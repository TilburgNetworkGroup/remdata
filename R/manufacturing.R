#' Manufacturing emails Network
#'
#' Internal email communication network between employees of a mid-sized manufacturing company in the period from 2010-01-01 to 2010-09-30. Any directed edge in the sequence represents an email sent by one person (the sender) to another one (the recipient). Considering that an email can have any number of recipients, for any email with multiple receivers the single event is splitted into as many dyadic events as the number of recipients in the email. Additional information about who in the company reports to whom is also available.
#'
#' @docType data
#'
#' @usage data(manufacturing)
#'
#' @format 'manufacturing' is a List of three objects.
#' \enumerate{
#' \item \strong{edgelist}: a List containing a \code{data.frame} describing a network of 82876 events among 167 actors.
#'
#' \describe{
#'  \item{time}{timestamp of the email (interval timing).}
#'  \item{actor1}{ID (integer value) of the actor that is the sender of the email.}
#'  \item{actor2}{ID (integer value) of the actor that receives the email.}
#' }
#'
#' \item \strong{actors}: a vector of actors ID's.
#' \item \strong{attributes}: a List of one object 'reportsto', that is a \code{data.frame} of two columns describing the  which actor ('ID') reports to whom ('ReportsToID'). Actor ID = 86 is CEO (the only loop in this \code{data.frame}).
#'}
#'
#' @source \url{https://doi.org/10.7910/DVN/6Z3CGX}
#'
#' @references Nurek, Mateusz, and Radosław Michalski. "Combining Machine Learning and Social Network Analysis to Reveal the Organizational Structures." Applied Sciences 10, no. 5 (2020): 1699. doi: \url{https://dx.doi.org/10.3390/app10051699}
"manufacturing"
