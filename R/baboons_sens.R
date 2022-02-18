#' Baboon's interactions.
#'
#' This dataset contains the sequence of 31861 interactions between 13 Guinea
#' baboons living in an enclosure of a Primate Center in France, between June
#' 13th 2019 and July 10th 2019. Wearable proximity sensors recorded with a
#' 20-second time interval every contact between baboons that was active in the
#' last 20 second window. A contact between two baboons is defined as the set
#' of successive time-windows of 20 seconds during which the baboons are
#' detected in contact. In the 'edgelist' element, these records are collected
#' in a relational event sequence with for every contact between a pair of
#' baboons the time of onset and its duration. Time is expressed in Unix time.
#' The events in the sequence are undirected. Multiple events can occur at the
#' same time point and the individuals can be in contact with multiple others
#' at the same time.
#'
#' @docType data
#'
#' @usage data(baboons_sens)
#'
#' @format Dataframe with 31861 rows and 4 columns.
#' \describe{
#'  \item{time}{POSIXct value indicating the timestamp for the onset of the
#' event.}
#'  \item{actor1}{String with the name of the sender of the event.}
#'  \item{actor2}{String with the name of the recipient of the event.}
#'  \item{duration}{Numeric value indicating the duration of the event in
#' seconds.}
#' }
#'
#' @seealso \link{baboons_obs}
#'
#' @source \url{http://www.sociopatterns.org/datasets/baboons-interactions/}
#'
#' @references Geladi et al. (2020) Proc. R. Soc. A. 476:20190737 \url{https://doi.org/10.1098/rspa.2019.0737},
"baboons_sens"
