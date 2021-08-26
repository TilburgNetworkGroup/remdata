#' SMS Networks
#'
#' SMs (Short Messages) records from three different companies over a month period.
#'  
#' @docType data
#' 
#' @usage data(sms)
#' 
#' @format 'sms' is a List of three objects. 
#' \enumerate{
#' \item \strong{edgelist}: a List of three \code{data.frame}'s, each one containing an edgelist of SMs sent among actors (the first edgelist has 544817 messages and 44090 actors, the second has 636629 messages and 71042 actors, the third has 140611 messages and 14273 actors). In the reference article by Wu et al. (2010), who sends more than five SMs and receives more than five SMs is considered as an active user. However, actors in the data available here are not filtered based on such assumption. Each edgelist describes a sequence of SMs sent among a set of actors which differs across the three \code{data.frame}'s. The structure is the same for all the edgelists and is the following:
#'
#' \describe{
#'  \item{time}{Numeric value indicating the seconds transpired since the onset, with a precision of 1 sec (interval timing).}
#'  \item{actor1}{ID (integer value) of the actor that sends the message.}
#'  \item{actor2}{ID (integer value) of the actor that receives the message.}
#' }
#'
#' \item \strong{actors}: a List of three vectors, each one containing ID's of the actors in the three edgelists.
#'}
#'
#' @source \url{https://www.pnas.org/content/107/44/18803/tab-figures-data}
#'
#' @references Wu, Y., Zhou, C., Xiao, J., Kurths, J., & Schellnhuber, H. J. (2010). Evidence for a bimodal distribution in human communication. Proceedings of the National Academy of Sciences of the United States of America, 107(44), 18803–18808. \url{https://doi.org/10.1073/pnas.1013140107}

"sms"
