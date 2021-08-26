#' Network of football clubs participating in the most expensive transfers in football
#' history.
#'
#' Relational event sequence with 250 events among 77 actors. The transfers happened in
#' every season starting from the 1998/1999 season. This dataset represents the most
#' expensive transfers of players between football clubs. It is a directed network,
#' where the sender is the club selling the player and the receiver the one buying
#' the player. There are numerous players attributes, thus the name of the player
#' who was transferred was kept in the edgelist, so users can know which
#' covariates to use at every point in time.
#'
#' This data was scraped from <https://www.transfermarkt.com/> on April 23, 2021.
#'
#' @format This data is a list that includes
#' \enumerate{
#' \item \strong{edgelist} A data frame with 250  rows and  4 columns
#' \describe{
#' \item{time}{This variable represents the season in which the player was transferred.}
#' \item{actor1}{Club that sold the player (sender).}
#' \item{actor2}{Club that bought the player (receiver).}
#' \item{player}{Player who was the object of the transfer.}
#' }
#'
#' \item \strong{actors} A vector of length 77 that contains the full list of actors.
#'
#' \item \strong{attributes} A list containing two data frames. The first one is called ?players? and it is data frame with 250 rows and 6 columns that describes player?s covariates and how they change over time. If a covariate is constant, then time should be equal to the start of observation. The second one is called ?team? and it is data frame with 77 rows and 2 columns.
#' \describe{
#' \item{player}{The name of the player.}
#' \item{time}{Season in which the player was transferred.}
#' \item{age}{Age of the player at the time of the transfer.}
#' \item{transfer}{The fee paid for the player, in millions of euros. This amount was paid by the club receiver the player.}
#' \item{market}{This variable represents the market value of the player at the time of the transfer, in millions of euros.}
#' \item{position}{Position of the player on the field.}
#' \item{actor}{Names of all teams that appeared in the network at least once.}
#' \item{country}{The country of the team.}
#' }
#'
#'
#' }
#' @source \url{ https://www.transfermarkt.com/ }
"football_transfers"

