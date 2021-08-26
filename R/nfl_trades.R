#' Network of trades between NFL franchises in the twenty first century.
#'
#' Relational event sequence with 1030 events among 32 actors (all NFL franchises).
#' A directed network of trades between NFL franchises. The events happened from
#' the year 2000 until April 2021.
#' The data was scraped from <https://www.nfl.com/> on April 30, 2021.
#'
#' @format This data is a list that includes
#' \enumerate{
#' \item \strong{edgelist} A data frame with 1030 rows and  3 columns
#' \describe{
#' \item{time}{This variable represents the date in which the trade occurred.}
#' \item{actor1}{Franchise sending the player (sender).}
#' \item{actor2}{Franchise receiving the player (receiver).}
#' }
#'
#' \item \strong{actors} A vector with the names of the 32 NFL francises.
#'
#' \item \strong{attributes} A data frames with 32 rows and 2 columns.
#' \describe{
#' \item{actor}{It contains the names of the franchises.}
#' \item{conference}{It contains the conference of the team. This variable could be used to create a rivalry flag in the REM.}
#' }
#'
#'
#' }
#' @source \url{https://www.nfl.com/}
"nfl_trades"

