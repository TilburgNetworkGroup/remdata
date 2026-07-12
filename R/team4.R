#' Interactions between members of a research team
#'
#' This dataset contains the sequence of 11,607 interactions between nine
#' members of a research team. The dataset is part of the GEDII project, a
#' project with the aim to develop new tools and methods for doing research on
#' the impact of gender diversity in research & development teams. Eight teams
#' have been participating in the GEDII case studies, the current data set
#' contains data of 'team 4'. This research team works in the field of
#' biomedical engineering in a public research center. Sociometric badges
#' recorded every interaction between the team members for five consecutive
#' days. The dataset contains both face-to-face interactions detected with
#' infrared sensors and proximity data detected with bluetooth sensors. To
#' create the relational event history in the 'edgelist' element, an event
#' between a pair of team members is defined as the set of seconds during
#' which the members are detected in contact, while they are not in the
#' preceding nor in the next 25 second time window. The events in the sequence
#' are undirected. Multiple events can occur at the same time point and the
#' team members can be in contact with multiple other team members at the same
#' time. Information on the gender, age, educational level, tenure and role of
#' the individual within the team is available in the 'attributes' element.
#' Moreover, the advice seeking network and friendship network for the team
#' members is available in the 'advice' and 'social' elements.
#'
#' @docType data
#'
#' @usage data(team4)
#'
#' @format List with elements 'edgelist', 'attributes', 'advice' and 'social'
#'
#' @section edgelist:
#' Dataframe with the 11,607 face-to-face contacts between the members of the
#' research team.
#' \describe{
#'  \item{time}{POSIXct value that indicates the onset of the contact.}
#'  \item{actor1}{Integer value with the ID of the first actor in the contact.}
#'  \item{actor2}{Integer value with the ID of the second actor in the contact.}
#'  \item{duration}{Numeric value that indicates the duration of the contact in
#' seconds.}
#'  \item{sensor}{String with the sensor that detected the contact (infrared or
#' bluetooth)}
#'  \item{signal_strength}{Numeric value with the average strength of the
#' bluetooth signal during the contact. Higher values indicate stronger signal,
#' which is shown to be related to, but not equal to, physical distance between
#' the individuals wearing the sensors (see Chaffin et al., 2017 in
#' Organizational Research Methods). Contacts detected with infrared sensors
#' have signal strength "NA".}
#' }
#'
#' @section attributes:
#' Dataframe describing a number of attributes of the 9 team members.
#' \describe{
#'  \item{name}{Integer value with the ID of the individual.}
#'  \item{time}{Change time of the attributes. Since the attributes are
#' constant over the course of the study period, this value is equal to 0 for
#' all entries.}
#'  \item{role}{Role within the team.}
#'  \item{gender}{String with the gender of the individual.}
#'  \item{hqual}{Educational level.}
#'  \item{tenure}{Months since joining the team.}
#'  \item{age}{Age in years.}
#' }
#'
#' @section advice:
#' Matrix with advice seeking network. The team members rated each other in a
#' round-robin design by answering the question "I consult this person for work
#' related advice" (1 = never, 2 = rarely, 3 = sometimes, 4 = very often, 5 =
#' always). Row names and column names correspond to the respective actors.
#'
#' @section social:
#' Matrix with friendship network. The team members rated each other in a
#' round-robin design by answering the question "I spend time socially with
#' this person outside the lab/office" (1 = never, 2 = some times a year, 3 =
#' some times a month, 4 = some times a week, 5 = daily). Row names and column
#' names correspond to the respective actors.
#'
#' @source \url{https://zenodo.org/records/3446071}
#'
#' @references Jörg Müller, Elisabeth Günther, Anne Humbert (2018). GEDII
#' Wearable Sensors Dataset of 8 Research Teams. \doi{10.5281/zenodo.1434706}
"team4"
