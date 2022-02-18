# Load data
con <- gzcon(url("http://www.sociopatterns.org/wp-content/uploads/2014/08/highschool_2012.csv.gz"))
txt <- readLines(con)
records <- read.delim(textConnection(txt), header = FALSE)

con <- gzcon(url("http://www.sociopatterns.org/wp-content/uploads/2015/09/metadata_2012.txt"))
txt <- readLines(con)
actors <- read.delim(textConnection(txt), header = FALSE)

# Column names
colnames(records) <- c("time", "actor1", "actor2", "class1", "class2")
colnames(actors) <- c("id", "class", "gender")

# Sort actors
actors <- actors[order(actors$id),]
rownames(actors) <- NULL

# Undirected edges: sort actors within rows in the records
records[,c("actor1", "actor2")] <- t(apply(records, 1, function(x) {
  sort(as.integer(x[c("actor1", "actor2")]))
}))

# Transform records into relational events
# Create a risk set
riskset <- t(combn(sort(actors$id), 2))

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

# Collect data
edgelist <- records[records$onset==TRUE,
  c("time", "actor1", "actor2", "duration")]
rownames(edgelist) <- NULL

attributes <- data.frame(
  id = actors$id,
  time = 0,
  class = actors$class,
  gender = actors$gender
)
highschool2012 <- list(edgelist = edgelist, attributes = attributes)

usethis::use_data(highschool2012, overwrite = TRUE)
