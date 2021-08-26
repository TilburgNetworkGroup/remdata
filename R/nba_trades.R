#' Network of trades between NBA franchises since 1948.
#'
#' Relational event sequence with 2251 events among 30 actors (all NBA franchises).
#' An undirected network of trades between NBA franchises. The events happened from the
#' year May 1948 until March 2021.
#' The data was scraped from <https://www.basketball-reference.com/> on April 29, 2021.
#'
#' @format This data is a list that includes
#' \enumerate{
#' \item \strong{edgelist} A data frame with 2251 rows and  3 columns
#' \describe{
#' \item{time}{This variable represents the date in which the trade occurred.}
#' \item{actor1}{Franchise both sending and receiving players on the trade.}
#' \item{actor2}{Franchise both sending and receiving players on the trade.}
#' }
#'
#' \item \strong{actors} A vector with the names of the 30 NBA francises.
#'
#'
#'
#' }
#' @source \url{https://www.basketball-reference.com/}
"nba_trades"

