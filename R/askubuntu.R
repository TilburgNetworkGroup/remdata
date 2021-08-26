#' AskUbuntu Network
#'
#' This data contain interactions from the StackExchange site "AskUbuntu". In this temporal network, directed edges between users represent three types of interactions: answering a question of another user, commenting on another user's question, and commenting on another user's answer.
#'
#' @docType data
#'
#' @usage data(askubuntu)
#'
#' @format 'askubuntu' is a List of two objects.
#' \enumerate{
#' \item \strong{edgelist}: a List containing a \code{data.frame} describing a network of 726661 events among 157222 actors (users in the website)
#'
#' \describe{
#'  \item{time}{timestamp of the interaction (interval timing).}
#'  \item{actor1}{ID (integer value) of the actor that writes an answer/comment.}
#'  \item{actor2}{ID (integer value) of the actor that receives the answer/comment.}
#' }
#'
#' \item \strong{actors}: a vector of actors ID's.
#' }
#'
#' @source \url{http://konect.cc/networks/sx-askubuntu/}
#'
#' @references 	Jure Leskovec. Stanford Network Analysis Project. \url{http://snap.stanford.edu/}, September 2014.
"askubuntu"
