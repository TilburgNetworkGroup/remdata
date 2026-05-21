#' Time-stamped interactions between ants
#'
#' This dataset contains eight sequences with the time-stamped interactions
#' between ants of four colonies during two filming session of approximately
#' 1800-second intervals per colony. Interactions are defined here as
#' antenna-body contact between individual ants.
#'
#' Number of actors and events per colony and filming session
#' Colony 1, session 1: 90 ants, 1911 events
#' Colony 1, session 2: 72 ants, 1820 events
#' Colony 2, session 1: 73 ants, 975 events
#' Colony 2, session 2: 70 ants, 1917 events
#' Colony 3, session 1: 12 ants, 78 events
#' Colony 3, session 2: 6 ants, 104 events
#' Colony 6, session 1: 35 ants, 652 events
#' Colony 6, session 2: 34 ants, 367 events
#'
#' @docType data
#'
#' @usage data(ants)
#'
#' @format Named list with nine elements. Eight elements corresponds to a film
#' session of a colony (e.g., colony11 = colony 1, film session 1) and contains
#' a list with the elements 'edgelist' and 'attributes'. The 9th element, named
#' 'colonies', contains attribute information about the colonies.
#'
#' @section edgelist:
#' Dataframe with the time-stamped interactions between the ants within the
#' respective colony during the film session.
#' \describe{
#'  \item{time}{Numeric value with the time of the interaction in seconds since
#' the beginning of the film session.}
#'  \item{actor1}{String with the name of the ant initiating the interaction by
#' extending antenna to contact another ant's body or antenna.}
#'  \item{actor2}{String with the name of the ant receiving the interaction by
#' being touched by another ant's antenna.}
#'  \item{posx}{When recorded, numeric value with the position in pixels of the
#' actor1 ant's head centroid.}
#'  \item{posy}{When recorded, numeric value with the position in pixels of
#' the actor1 ant's head centroid.}
#' }
#'
#' @section attributes:
#' Dataframe with all the ants in the filming. Queen ants have a Q in the name.
#' \describe{
#'  \item{name}{String with the name of the ant.}
#'  \item{initialx}{Position in pixels of the ant's head centroid.}
#'  \item{initialy}{Position in pixels of the ant's head centroid.}
#'  \item{queen}{Logical whether or not the ant is a queen ant.}
#'  \item{colony}{Integer id of the colony (1,2,3,6).}
#'  \item{session}{Integer id of the filming session (1,2).}
#' }
#'
#' @section colonies:
#' Dataframe with information about the 4 colonies.
#' \describe{
#'  \item{id}{Integer id of the colony (1,2,3,6).}
#'  \item{session}{Integer id of the filming session (1,2).}
#'  \item{area}{Area of the nest in pixels^2.}
#'  \item{length}{Mean body length of ants in pixels.}
#'  \item{minx}{Coordinates in pixels of interaction bounding box.}
#'  \item{miny}{Coordinates in pixels of interaction bounding box.}
#'  \item{maxx}{Coordinates in pixels of interaction bounding box.}
#'  \item{maxy}{Coordinates in pixels of interaction bounding box.}
#' }
#'
#' @source \doi{10.1371/journal.pone.0020298.s008}
#'
#' @references Blonder B, Dornhaus A (2011) Time-Ordered Networks Reveal
#' Limitations to Information Flow in Ant Colonies. PLOS ONE 6(5): e20298.
#' \doi{10.1371/journal.pone.0020298}
"ants"
