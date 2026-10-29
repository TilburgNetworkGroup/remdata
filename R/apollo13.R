#' Communication during the Apollo 13 mission
#'
#' This dataset contains the sequence of 5498 directed messages between 19
#' actors during NASA's Apollo 13 mission in April 1970. The actors are the
#' three astronauts on board the spacecraft (Commander James A. Lovell Jr.,
#' Command Module Pilot John L. Swigert Jr., and Lunar Module Pilot Fred W.
#' Haise Jr.) and the flight controllers at Mission Control in Houston,
#' identified by the callsign of their console. The messages were transcribed
#' from two voice loops: the air-to-ground loop between the spacecraft and the
#' Capsule Communicator (CAPCOM), the only person at Mission Control who
#' addressed the crew, and the Flight Director's loop between the flight
#' controllers. The sequence starts about one hour before the incident, during
#' routine operations, and covers the explosion of oxygen tank 2 (55:54:53
#' ground elapsed time, GET) and the crew's "Houston, we've had a problem"
#' (55:55:20 and 55:55:35 GET), through to the diagnosis of the problem and
#' the burn that set the spacecraft back on a free-return trajectory to Earth
#' (61:29:43 GET). Time is expressed in seconds of GET since launch on April
#' 11th 1970, 19:13:00 UTC. The 39 messages in which the flight director
#' (FLIGHT) addressed all flight controllers have 'ALL' as receiver.
#' Information on the role and location of the actors is
#' available in the 'attributes' element.
#'
#' @docType data
#'
#' @usage data(apollo13)
#'
#' @format List with elements 'edgelist' and 'attributes'
#'
#' @section edgelist:
#' Dataframe with 5498 rows and 5 columns that contains the relational event
#' sequence with messages between the actors.
#' \describe{
#'  \item{time}{Numeric value that indicates the time of the message in seconds
#' of ground elapsed time (GET), i.e., seconds since launch. Note that the first
#' event occurs at 54:59:56 GET (197996 seconds); consider setting the origin
#' of the sequence accordingly (e.g., the 'origin' argument in remify).}
#'  \item{actor1}{String with the callsign of the sender of the message.}
#'  \item{actor2}{String with the callsign of the receiver of the message.}
#'  \item{loop}{String with the voice loop on which the message was recorded.
#' One of 'air-ground' (air-to-ground loop between the spacecraft and CAPCOM) or
#' 'flight director' (Flight Director's loop between the flight controllers).}
#'  \item{message}{String with the transcribed message as provided in the
#' source transcripts. A dash at the start or end of a message indicates
#' interrupted speech.}
#' }
#'
#' @section attributes:
#' Dataframe with 19 rows and 4 columns describing the actors.
#' \describe{
#'  \item{name}{String with the callsign of the actor.}
#'  \item{time}{Change time of the attributes. Since the attributes are
#' constant over the course of the study period, this value is equal to 0 for
#' all entries.}
#'  \item{role}{String with the role of the actor (e.g., 'Flight Director').}
#'  \item{location}{String with the location of the actor, 'spacecraft' (the
#' crew) or 'mission control' (the flight controllers in Houston).}
#' }
#'
#' @source \url{https://apollo13realtime.org/} and
#' \url{https://apollojournals.org/afj/ap13fj/07day3-before-the-storm.html}
#'
#' @references Shafiee Kamalabad, M., Leenders, R., & Mulder, J. (2023). What is
#'   the point of change? Change point detection in relational event models.
#'   \emph{Social Networks}, 74, 166-181. \doi{10.1016/j.socnet.2023.03.004}
#'
#'   Karimova, D., Leenders, R., Meijerink-Bosman, M., & Mulder, J. (2023).
#'   Separating the wheat from the chaff: Bayesian regularization in dynamic
#'   social networks. \emph{Social Networks}, 74, 139–155.
#'   \doi{10.1016/j.socnet.2023.02.006}
#'
#'   Tseng, I. (2017). Apollo 13 Real-Time. GitHub.
#'   \url{https://github.com/issa-tseng/apollo13rt}
"apollo13"
