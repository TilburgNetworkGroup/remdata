#' SFHH conference interactions.
#' 
#' This dataset contains the sequence of 26040 face-to-face contacts between 
#' 403 participants of the 2009 SFHH conference in Nice, France (June 4-5, 2009)
#' . Wearable proximity sensors recorded with a 20-second time interval every 
#' face-to-face contact between individuals that was active in the last 20 
#' second window. Following Genois & Barrat (2018), a contact between two 
#' individuals is defined as the set of successive time-windows of 20 seconds 
#' during which the individuals are detected in contact. In the 
#' 'SFHHconference' object, these records are collected in a relational event 
#' sequence with for every contact between a pair of individuals the time of 
#' onset and its duration. Time is expressed in seconds since the onset of the 
#' study period. The events in the sequence are undirected. Multiple events can 
#' occur at the same time point and the individuals can be in contact with 
#' multiple other individuals at the same time. 
#' 
#' @docType data
#' 
#' @usage data(SFHHconference)
#' 
#' @format Dataframe with 26040 rows and 4 columns.
#' \describe{
#'  \item{time}{Numeric value that indicates the onset of the contact in 
#' seconds since onset of the study period.}
#'  \item{actor1}{Integer value with the ID of the first actor in the contact.}
#'  \item{actor2}{Integer value with the ID of the second actor in the contact.}
#'  \item{duration}{Numeric value that indicates the duration of the contact in 
#' seconds.}
#' } 
#' 
#' @source \url{http://www.sociopatterns.org/datasets/sfhh-conference-data-set/}
#' 
#' @references Cattuto et al. (2010) PloS ONE 5(7) e11596 \url{https://doi:10.1371/journal.pone.0011596}, Genois & Barrat (2018) EPJ Data Science 7:11 \url{https://doi.org/10.1140/epjds/s13688-018-0140-1}, Stehle et al. (2011) BMC Medicine 9(87) \url{https://doi.org/10.1186/1741-7015-9-87}
"SFHHconference"