## code to prepare `team4` dataset goes here

library(gediismtrx)

# collect records
records <- gedii_interaction
records <- records[records$Team == "Team_4",]
rownames(records) <- NULL
colnames(records)[1:3] <- c("time", "actor1", "actor2")
head(records)

# sensor
records$sensor <- ifelse(is.na(records$RSSI), "infrared", "bluetooth")
records$signal_strength <- records$RSSI

# Undirected edges: sort actors within rows in the records
records[,c("actor1", "actor2")] <- t(apply(records, 1, function(x) {
  sort(as.integer(x[c("actor1", "actor2")]))
}))

# Collect actor information
actors <- gedii_sociodemo
actors <- actors[actors$Team == 4,]
covariates <- data.frame(name = actors$RID, time = 0, team = actors$Team,
  role = actors$Role, gender = actors$Gender, hqual = actors$HQual,
  tenure = actors$Tenure, age = actors$Age)
rownames(covariates) <- NULL

# Collect round-robin data
rr <- gedii_rr
advice <- rr[[4]][1:9, 3:11]
social <- rr[[4]][1:9, 12:20]
rownames(advice) <- rownames(social) <- colnames(advice) <- colnames(social) <- actors$RID

# Transform records into relational events
# Create a risk set
riskset <- t(combn(sort(covariates$id), 2))

# Match edge ID
records$edge <- prodlim::row.match(records[,c("actor1", "actor2")], riskset)

# Transform edges
records$interaction <- NA
records$rownumber <- 1:nrow(records)

# For loop over records
for(i in 1:nrow(records)) {

  # Give an interaction id
  if(is.na(records$interaction[i])) {
    records$interaction[i] <- i
  }

  next25 <- records[records$time > records$time[i] & records$time <= records$time[i] + 25,]

  if(records$edge[i] %in% next25$edge) {
    matches <- next25[which(next25$edge == records$edge[i] &
        next25$sensor == records$sensor[i]),]

    records$interaction[matches$rownumber] <- records$interaction[i]
  }

  cat(i, "\r")
}

# For loop over interactions
new_records <- data.frame()

for(int in unique(records$interaction)) {

  select <- records[records$interaction == int,]
  start <- min(select$time)
  end <- max(select$time)
  duration <- end-start
  dat <- data.frame(time = start, actor1 = select$actor1[1], actor2 = select$actor2[1],
    duration = duration, sensor = select$sensor[1],
    signal_strength = round(mean(select$signal_strength)),
    edge = select$edge[1], interaction = select$interaction[1])

  new_records <- rbind(new_records, dat)
}

# Collect data
edgelist <- new_records[,1:6]
rownames(edgelist) <- NULL
head(edgelist)

attributes <- covariates
team4 <- list(edgelist = edgelist, attributes = attributes,
  advice = advice, social = social)
str(team4)
class(team4$edgelist) <- "data.frame"
team4$edgelist$duration <- round(team4$edgelist$duration)
team4$attributes <- team4$attributes[,-3]

# Save
usethis::use_data(team4, overwrite = TRUE)
