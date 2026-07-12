# Load data
url <- "http://www.sociopatterns.org/wp-content/uploads/2016/06/scc2034_household_contact_dataset.zip"
temp <- tempfile()
download.file(url, temp)
records <- read.delim(unz(temp, "scc2034_kilifi_all_contacts_within_households.csv"),
  header = FALSE, sep = ",")
unlink(temp)

# Recode time variable (in hours since study start, 0:00 day 1)
records$time <- records$hour + (records$day-1)*24

# Check wheter h1 is always h2
all(records$h1 == records$h2)

# Recode household
records$household <- records$h1
households <- unique(records$household)

# Extract actors
actors <- lapply(households, function(h) {
  data.frame(id = sort(unique(c(records$m1[records$household == h],
    records$m2[records$household == h]))))
})
names(actors) <- households

# Extract actors information
actors <- lapply(1:length(actors), function(h) {
  dat <- data.frame(t(sapply(actors[[h]]$id, function(i) {
    ind1 <- which(records$m1 == i & records$household == names(actors)[h])
    if(length(ind1) > 0) {
      ind1 <- ind1[1]
      c(records$age1[ind1], records$sex1[ind1])
    } else {
      ind2 <- which(records$m2 == i & records$household == names(actors)[h])
      ind2 <- ind2[1]
      c(records$age2[ind2], records$sex2[ind2])
    }
  })))

  colnames(dat) <- c("age", "sex")
  dat$time <- 0
  dat <- cbind(actors[[h]], dat)
  dat$age <- as.integer(dat$age)
  dat <- dat[,c("id", "time", "age", "sex")]
  colnames(dat)[1] <- "name"
  dat
})
names(actors) <- households

# Extract events
edgelists <- lapply(households, function(h) {
  selec <- records[records$household == h,]
  edgelist <- data.frame(
    time = selec$time,
    actor1 = selec$m1,
    actor2 = selec$m2,
    duration = selec$duration,
    household = selec$household
  )
  edgelist <- edgelist[order(edgelist$time),]

  # Undirected edges: sort actors within rows in the records
  edgelist[,c("actor1", "actor2")] <- t(apply(edgelist, 1, function(x) {
    sort(as.integer(x[c("actor1", "actor2")]))
  }))

  rownames(edgelist) <- NULL
  edgelist
})
names(edgelists) <- households

# Collect data
data <- lapply(households, function(h) {
  list(edgelist = edgelists[[which(names(edgelists)==h)]],
    attributes = actors[[which(names(actors)==h)]])
})
names(data) <- households
households <- data

# Save data

usethis::use_data(households, overwrite = TRUE)
