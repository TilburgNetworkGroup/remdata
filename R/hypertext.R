#' Interactions at the ACM hypertext 2009 conference
#' 
#' This dataset contains the sequence of 9865 face-to-face contacts between 
#' attendees of the ACM Hypertext 2009 conference hosted by the Institute for 
#' Scientific Interchange Foundation in Turin, Italy, from June 29th to July 
#' 1st 2009. The data collection involved 113 conference attendees. Wearable 
#' proximity sensors recorded with a 20-second time interval every face-to-face 
#' contact between individuals that was active in the last 20 second window. A 
#' contact between two individuals is defined as the set of successive 
#' time-windows of 20 seconds during which the individuals are detected in 
#' contact. In the 'hypertext' edgelist, these records are collected in a 
#' relational event sequence with for every contact between a pair of 
#' individuals the time of onset and its duration. Time of the events is 
#' expressed in seconds since onset of the study period. The events in the 
#' sequence are undirected. Multiple events can occur at the same time point 
#' and the individuals can be in contact with multiple other individuals at the 
#' same time. 
#' 
#' @docType data
#' 
#' @usage data(hypertext)
#' 
#' @format Dataframe with 9865 rows and 4 columns that contains the relational 
#' event sequence with face-to-face contacts between the individuals. 
#' \describe{
#'  \item{time}{Numeric value indicating the timestamp for the onset of the 
#' contact expressed in seconds since onset of the study period (8 am on June 
#' 29th 2009).}
#'  \item{actor1}{Integer value with the ID of the first actor in the contact.}
#'  \item{actor2}{Integer value with the ID of the second actor in the contact.}
#'  \item{duration}{Numeric value indicating the duration of the contact in 
#' seconds.}
#' }
#' 
#' @source \url{http://www.sociopatterns.org/datasets/hypertext-2009-dynamic-contact-network/}
#' 
#' @references Isella et al. (2011) Journal of Theoretical Biology 271, 166 \url{https://doi.org/10.1016/j.jtbi.2010.11.033}
"hypertext"