# Load data
url <- "https://nrvis.com/download/data/dynamic/comm-linux-kernel-reply.zip"
temp <- tempfile()
download.file(url, temp)
dat <- read.delim(unz(temp, "comm-linux-kernel-reply.edges"), header=FALSE, skip = 3)
unlink(temp)

# Add date
dat$date <- as.POSIXct(dat$V4, origin = "1970-01-01")
dat <- dat[order(dat$date),]

# Remove duplicates
doubles <- duplicated(dat)
dat <- dat[!doubles,]

# Re-arrange columns
linux_replies <- data.frame(
  time = dat$V4,
  actor1 = dat$V2,
  actor2 = dat$V1,
  date = dat$date
)

# Save
usethis::use_data(linux_replies, overwrite = TRUE)
