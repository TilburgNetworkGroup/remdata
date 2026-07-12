## code to prepare `highschool2013` dataset goes here

# Load data
con <- gzcon(url("http://www.sociopatterns.org/wp-content/uploads/2015/07/High-School_data_2013.csv.gz"))
txt <- readLines(con)
records <- read.table(textConnection(txt), quote="\"", comment.char="")

con <- gzcon(url("http://www.sociopatterns.org/wp-content/uploads/2015/07/Contact-diaries-network_data_2013.csv.gz"))
txt <- readLines(con)
cdiaries <- read.table(textConnection(txt), quote="\"", comment.char="")

con <- gzcon(url("http://www.sociopatterns.org/wp-content/uploads/2015/07/Friendship-network_data_2013.csv.gz"))
txt <- readLines(con)
friendship <- read.table(textConnection(txt), quote="\"", comment.char="")

con <- gzcon(url("http://www.sociopatterns.org/wp-content/uploads/2015/07/Facebook-known-pairs_data_2013.csv.gz"))
txt <- readLines(con)
facebook <- read.table(textConnection(txt), quote="\"", comment.char="")

con <- gzcon(url("http://www.sociopatterns.org/wp-content/uploads/2015/09/metadata_2013.txt"))
txt <- readLines(con)
actors <- read.table(textConnection(txt), quote="\"", comment.char="")

# Column names
colnames(cdiaries) <- c("sender", "receiver", "weight")
colnames(records) <- c("time", "actor1", "actor2", "class1", "class2")
colnames(facebook) <- c("actor1", "actor2", "link")
colnames(friendship) <- c("sender", "receiver")
colnames(actors) <- c("id", "class", "gender")

# Sort actors
actors <- actors[order(actors$id),]
rownames(actors) <- NULL

# Missing values
actors$gender[actors$gender=="Unknown"] <- NA

# Create networks
net <- matrix(0, nrow = nrow(actors), ncol = nrow(actors))
rownames(net) <- colnames(net) <- actors$id
contacts <- net
contacts[which(!(actors$id %in% cdiaries$sender)),] <- NA

for(i in 1:nrow(cdiaries)) {
  row <- which(actors$id == cdiaries$sender[i])
  col <- which(actors$id == cdiaries$receiver[i])
  contacts[row, col] <- cdiaries$weight[i]
}

fnet <- net
for(i in 1:nrow(facebook)) {
  ac1 <- which(actors$id == facebook$actor1[i])
  ac2 <- which(actors$id == facebook$actor2[i])
  fnet[ac1, ac2] <- facebook$link[i]
  fnet[ac2, ac1] <- facebook$link[i]
}

facebook <- fnet

fnet <- net
fnet[which(!(actors$id %in% friendship$sender)),] <- NA
for(i in 1:nrow(friendship)) {
  s <- which(actors$id == friendship$sender[i])
  r <- which(actors$id == friendship$receiver[i])
  fnet[s, r] <- 1
}

friendship <- fnet

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
  name = actors$id,
  time = 0,
  class = actors$class,
  gender = actors$gender
)

highschool2013 <- list(edgelist = edgelist, attributes = attributes,
  contacts = contacts, friendship = friendship, facebook = facebook)

usethis::use_data(highschool2013, overwrite = TRUE)
