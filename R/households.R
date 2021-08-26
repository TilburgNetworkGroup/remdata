#' Interactions between members of 5 Kenyan households
#' 
#' This dataset contains five sequences with the interactions between the 
#' members of five households of rural Kenya. The households are named 'E', 
#' 'F', 'L', 'H' and 'B'. Each of the five households was followed for three 
#' days between April 24 and May 12, 2012. During these three days, wearable 
#' proximity sensors recorded every face-to-face interaction among the members 
#' of the households. Members of households L, F and E wore the sensors during 
#' partly overlapping time windows. In the 'edgelist' elements of 
#' 'households', the proximity records are collected in a relational 
#' event sequence with for every contact between a pair of individuals the time 
#' of onset in hours since the start of the study period for the respective 
#' household and its duration in seconds. Only contact events recorded between 
#' 6am and 8pm are reported. The number of recorded interactions is 13473 among 
#' 17 members for household E, 1397 among 8 members for household F, 1365 among 
#' 6 members for household L, 10376 among 29 members for household H, and 5814 
#' among 15 members for household B. The events in the sequence are undirected. 
#' Multiple events can occur at the same time point and the individuals can be 
#' in contact with multiple other individuals at the same time. In the 
#' 'attributes' elements of 'households', information on the age and the 
#' sex of the individuals is provided. 
#' 
#' @docType data
#' 
#' @usage data(households)
#' 
#' @format Named list of five elements, each element corresponds to a household 
#' and contains a list with the elements 'edgelist' and 'attributes':
#' 
#' @section edgelist:
#' Dataframe with the face-to-face contacts between the members of the 
#' respective household. 
#' \describe{
#'  \item{time}{Numeric value that indicates the onset of the contact in 
#' hours since onset of the study period. Hours are indicated by integers 
#' corresponding to the end of the time interval (e.g, hour 0-1 with 1).}
#'  \item{actor1}{Integer value with the ID of the first actor in the contact.}
#'  \item{actor2}{Integer value with the ID of the second actor in the contact.}
#'  \item{duration}{Numeric value that indicates the duration of the contact in 
#' seconds.}
#'  \item{household}{String indicating the household of which the actors in the 
#' edgelist are members ('E', 'F', 'L', 'H' or 'B'). Note that this value is 
#' the same for each edgelist.}
#' }
#' 
#' @section attributes:
#' Dataframe describing the age and sex of the members of the respective 
#' household.
#' \describe{
#'  \item{id}{Integer value with the ID of the individual.}
#'  \item{time}{Change time of the attributes. Since the attributes are 
#' constant over the course of the study period, this value is equal to 0 for 
#' all entries.}
#'  \item{age}{Age category of the individual (0 = 0-5 years, 1 = 6-14 years, 
#'  2 = 15-19 years, 3 = 20-49 years, 4 = 50 years and older).}
#'  \item{sex}{String with the sex of the individual ('M' = male, 
#'  'F' = female).}
#' }
#' 
#' @source \url{http://www.sociopatterns.org/datasets/kenyan-households-contact-network/}
#' 
#' @references Kiti et al. (2016) EPJ Data Science 5(21) \url{https://doi.org/10.1140/epjds/s13688-016-0084-2}
"households"