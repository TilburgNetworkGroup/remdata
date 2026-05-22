#' Democratic National Committee (DNC) emails Network
#'
#' This dataset describes the temporal directed network of emails in the 2016 Democratic National Committee email leak. Any directed edge in the sequence represents an email sent by one person (the sender) to another one (the recipient). Considering that an email can have any number of recipients, for any email with multiple receivers the single event is splitted into as many dyadic events as the number of recipients in the email. As a consequence of this, the resulting network contains about the double of the emails in the original data.
#'  
#' @docType data
#' 
#' @usage data(dnc)
#' 
#' @format 'dnc' is a List of two objects. 
#' \enumerate{
#' \item \strong{edgelist}: a List containing a \code{data.frame} describing a network of 34421 events among 1866 actors (users in the website)
#'
#' \describe{
#'  \item{time}{timestamp of the email (interval timing).}
#'  \item{actor1}{ID (integer value) of the actor that is the sender of the email.}
#'  \item{actor2}{ID (integer value) of the actor that receives the email.}
#' }
#'
#' \item \strong{actors}: a vector of actors ID's.
#'}
#'
#' @source \url{http://konect.cc/networks/dnc-temporalGraph/}
#'
#' @references Jérôme Kunegis. KONECT – The Koblenz Network Collection. In Proc. Int. Conf. on World Wide Web Companion, pages 1343–1350, 2013. \url{https://dl.acm.org/doi/10.1145/2487788.2488173}

"dnc"