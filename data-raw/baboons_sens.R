# Load data
con <- gzcon(url("http://www.sociopatterns.org/wp-content/uploads/2020/12/RFID_data.txt.gz"))
txt <- readLines(con)
records <- read.csv(textConnection(txt), sep = "\t", header = TRUE)

# Actors
actors <- sort(unique(c(records$i, records$j)))

# Column names
colnames(records) <- c("time", "actor1", "actor2", "datetime")

# Undirected edges: sort actors within rows in the records
records[,c("actor1", "actor2")] <- t(apply(records, 1, function(x) {
  sort(x[c("actor1", "actor2")])
}))

# Transform records into relational events
# Create a risk set
riskset <- t(combn(sort(actors), 2))

# Match edge ID
records$edge <- prodlim::row.match(records[,c("actor1", "actor2")], riskset)

# Transform edges
onset <- terminus <- vector()
onset_time <- terminus_time <- vector()

for(i in 1:nrow(records)) {
  # Did the edge occur in the last 20 seconds? If not, onset = TRUE
  last <- records[records$time == records$time[i]-20, ]
  onset[i] <- ifelse(records$edge[i] %in% last$edge, FALSE, TRUE)

  # Does the edge occur in the next 20 seconds? If not, terminus = TRUE
  subs <- records[records$time == records$time[i]+20, ]
  terminus[i] <- ifelse(records$edge[i] %in% subs$edge, FALSE, TRUE)
}

for(i in 1:nrow(records)) {
  if(onset[i]) {
    # Set onset time if onset is true
    onset_time[i] <- records$time[i] - 20
  } else {
    # Determine onset time if onset is false
    onset_time[i] <- records$time[max(which(records$time < records$time[i] &
        records$edge == records$edge[i] & onset))] - 20
  }

  if(terminus[i]) {
    # Determine terminus time if terminus is true
    terminus_time[i] <- records$time[i]
  } else {
    # Determine terminus time if terminus is false
    terminus_time[i] <- records$time[min(which(records$time > records$time[i] &
        records$edge == records$edge[i] & terminus))]
  }
}

records$onset <- onset
records$terminus <- terminus
records$onset_time <- onset_time
records$terminus_time <- terminus_time
records$duration <- records$terminus_time - records$onset_time

# Collect edgelist
edgelist <- records[records$onset==TRUE,
  c("time", "actor1", "actor2", "duration")]
rownames(edgelist) <- NULL

# Collect data
baboons_sens <- edgelist

# Time variable
baboons_sens$time <- as.POSIXct(baboons_sens$time, origin = "1970-01-01")
baboons_sens$actor1 <- factor(baboons_sens$actor1, levels = actors)
baboons_sens$actor2 <- factor(baboons_sens$actor2, levels = actors)

# Save
usethis::use_data(baboons_sens, overwrite = TRUE)
