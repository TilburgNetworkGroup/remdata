#' Contacts in a workplace.
#' 
#' This dataset contains the sequence of 4592 face-to-face contacts between 
#' employees measured in an office building in France, from June 24 to July 3, 
#' 2013. The data collection involved 92 employees of five different 
#' departments. Wearable proximity sensors recorded with a 20-second time 
#' interval every face-to-face contact between individuals that was active in 
#' the last 20 second window. A contact between two individuals is defined as 
#' the set of successive time-windows of 20 seconds during which the 
#' individuals are detected in contact. In the 'edgelist'  element, these 
#' records are collected in a relational event sequence with for every contact 
#' between a pair of individuals the time of onset and its duration. Time is 
#' expressed in seconds since the onset of the study period, taken as 0:00 on 
#' June 24, 2013. The events in the sequence are undirected. Multiple events 
#' can occur at the same time point and the individuals can be in contact with 
#' multiple other individuals at the same time. Information on the department 
#' of the individuals is available in the 'attributes' element. 
#' 
#' @docType data
#' 
#' @usage data(workplace2013)
#' 
#' @format List with elements 'edgelist' and 'attributes'. 
#' 
#' @section edgelist:
#' Dataframe with 4592 rows and 4 columns that contains the relational event 
#' sequence with face-to-face contacts in the workplace. 
#' \describe{
#'  \item{time}{Numeric value that indicates the onset of the contact in 
#' seconds since 0:00 June 24, 2013.}
#'  \item{actor1}{Integer value with the ID of the first actor in the contact.}
#'  \item{actor2}{Integer value with the ID of the second actor in the contact.}
#'  \item{duration}{Numeric value that indicates the duration of the contact in 
#' seconds.}
#' }
#' 
#' @section attributes:
#' Dataframe with 92 rows and 3 columns describing the department of the 
#' employees.
#' \describe{
#'  \item{name}{Integer value with the ID of the individual.}
#'  \item{time}{Change time of the attributes. Since the attributes are 
#' constant over the course of the study period, this value is equal to 0 for 
#' all entries.}
#'  \item{department}{String with the department of the employee ('DISQ' = 
#' Department of Scientific Direction, 'DMCT' = Department of Chronic Diseases 
#' and Traumatisms, 'DSE' = Department of Health and Environment, 'SRH' = Human 
#' Resources, and 'SFLE' = Logistics).}
#' }
#' 
#' @seealso \link{workplace2015}
#' 
#' @source \url{https://sociopatterns.org/datasets/contacts-in-a-workplace/}
#' 
#' @references Genois et al. (2015) Network Science 3(3) pp. 326-347 \doi{10.1017/nws.2015.10}, Genois & Barrat (2018) EPJ Data Science 7:11 \doi{10.1140/epjds/s13688-018-0140-1}
"workplace2013"