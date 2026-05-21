#' Baboon's interactions.
#'
#' This dataset contains the sequence of 5377 interactions between 20 Guinea
#' baboons living in an enclosure of a Primate Center in France. The 'edgelist'
#' element contains all directed interactions between pairs of baboons
#' registered by an observer between June 13th 2019 and July 10th 2019.
#' Moreover, the type of behavior and its duration is recorded. A distinction
#' is made between 'POINT' events (without duration) and 'STATE' events (with
#' duration > 0). Note that the edgelist contains event without a recipient
#' and events directed towards the "self".
#'
#' @docType data
#'
#' @usage data(baboons_obs)
#'
#' @format Dataframe with 5377 rows and 7 columns.
#' \describe{
#'  \item{time}{POSIXct value with the time stamps of the onset of the events.}
#'  \item{actor1}{Factor with the names of the sender of the events.}
#'  \item{actor2}{Factor with the names of the recipient of the events.}
#'  \item{behavior}{Factor with the behaviors of the baboons.}
#'  \item{category}{Factor with the classifications of the behaviors.}
#'  \item{duration}{Numeric value indicating the duration of the events in
#' seconds. The duration of events that lasted longer than 300 seconds (five
#' minutes) were not recorded (i.e., they were recorded as lasting 300 seconds
#' but may have lasted longer).}
#'  \item{point}{Factor that indicates whether the event is a POINT event (YES) or a STATE event (NO).}
#' }
#'
#' @seealso \link{baboons_sens}
#'
#' @source \url{https://sociopatterns.org/datasets/baboons-interactions/}
#'
#' @references Geladi et al. (2020) Proc. R. Soc. A. 476:20190737
#' \doi{10.1098/rspa.2019.0737}
"baboons_obs"
