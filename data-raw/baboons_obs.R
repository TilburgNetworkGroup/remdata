# Load data
con <- gzcon(url("http://www.sociopatterns.org/wp-content/uploads/2020/12/OBS_data.txt.gz"))
txt <- readLines(con)
dat <- read.csv(textConnection(txt), sep = "\t", header = TRUE)

# Fix typo
dat$Recipient[which(dat$Recipient=="MALI  ")] <- "MALI"

# Actors
actors <- sort(unique(c(dat$Actor, dat$Recipient)))

# Fix DateTime variable
dat$time <- as.POSIXct(dat$DateTime, format = "%d/%m/%Y %H:%M")

# Collect data
baboons_obs <- data.frame(
  time = dat$time,
  actor1 = dat$Actor,
  actor2 = dat$Recipient,
  behavior = dat$Behavior,
  category = dat$Category,
  duration = dat$Duration,
  point = dat$Point
)

baboons_obs$actor1 <- factor(baboons_obs$actor1, levels = actors)
baboons_obs$actor2 <- factor(baboons_obs$actor2, levels = actors)
baboons_obs$behavior <- factor(baboons_obs$behavior)
baboons_obs$category <- factor(baboons_obs$category)
baboons_obs$point <- factor(baboons_obs$point)

# Save
usethis::use_data(baboons_obs, overwrite = TRUE)
