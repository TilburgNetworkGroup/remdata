#' Contact patterns in a village in rural Malawi
#'
#' This dataset contains the sequence of 35117 face-to-face contacts between 86
#' individuals living in a village in rural Malawi. The data collection was
#' conducted between 16h December 2019 and 10th January 2020. Wearable
#' proximity sensors recorded with a 20-second time interval every face-to-face
#' contact between individuals that was active in the last 20 second window. A
#' contact between two individuals is defined as the set of successive
#' time-windows of 20 seconds during which the individuals are detected in
#' contact. In the Malawi data object, these records are collected in a
#' relational event sequence, with for every contact between a pair of
#' individualsthe time of onset and its duration. The events in the sequence are
#' undirected. Multiple events can occur at the same time point and the
#' individuals can be in contactwith multiple other individuals at the same time.
#'
#' @docType data
#'
#' @usage data(Malawi)
#'
#' @format dataframe with 35117 rows and 5 columns.
#' \describe{
#'  \item{time}{Numeric value: time in seconds since onset of the observation period.}
#'  \item{actor1}{Numeric value: ID of the first actor in the event.}
#'  \item{actor2}{Numeric value: ID of the second actor in the event.}
#'  \item{duration}{Numeric value: duration of the event in seconds.}
#'  \item{day}{Integer: day of the month.}
#' }
#'
#' @source \url{https://sociopatterns.org/datasets/contact-patterns-in-a-village-in-rural-malawi/}
#'
#' @references Ozella, L., Paolotti, D., Lichand, G. et al. Using wearable proximity sensors to characterize social contact patterns in a village of rural Malawi. EPJ Data Sci. 10, 46 (2021). \doi{10.1140/epjds/s13688-021-00302-w}
"Malawi"
