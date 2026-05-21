#' Short description of the data – Network of trades between Brazilian states and countries in the European Union.
#' Relational event sequence with 28035 events among 55 actors. The events happened from January first 2015 until March first 2021.
#' Long description – Trades happened between Brazilian states and countries in the European Union, thus it is a directed network. Here, only Brazilian states can be senders and only EU countries can be receivers, so this network contains 27 sender (number of Brazilia states) and 28 receivers (number of countries in the EU, which contained the UK until 2020).
#'
#' @format This data is a list that includes
#' \enumerate{
#' \item \strong{edgelist} A data frame with 28035 rows and  3 columns
#' \describe{
#' \item{time}{This variable represents the date in which the trade occurred.}
#' \item{actor1}{Brazilian state sending goods (sender).}
#' \item{actor2}{European country receiving goods (receiver).}
#' }
#'
#' \item \strong{actors} A list containg two named vectors: sender and receiver. The sender vector contains the names of the 27 actors that can act as a sender. The receiver contains a list with the 28 actors that act as receivers.
#'
#' \item \strong{attributes} A data frames with 28035 rows and 4 columns.
#' \describe{
#' \item{state}{It contains the names of the states.}
#' \item{time}{It contains the date of the trade.}
#' \item{country}{It contains the name of the EU country.}
#' \item{value}{It contains the value of the trade in US dollar.}
#' }
#'
#'
#' }
#' @source \url{https://comexstat.mdic.gov.br/}
"brazilian_states_trade"

