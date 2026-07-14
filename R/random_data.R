#' Random Relational Event History
#'
#' A randomly generated sequence of relational events with 20 actors and 9915 events. Each event type is associated to one of the three following sentiments: \emph{conflict}, \emph{competition} and \emph{cooperation}.
#'
#' @name randomREH
#' @docType data
#'
#' @format \code{data(randomREH)} will load a list containing following objects:
#'\describe{
#'    \item{\code{edgelist}}{a \code{data.frame} that contains the random sequence of events. Columns of the edgelist are:
#'            \describe{
#'                \item{\code{time}}{the timestamp indicating the time at which each event occurred;}
#'                \item{\code{actor1}}{the name of the actor that generated the relational event;}
#'                \item{\code{actor2}}{the name of the actor that received the relational event;}
#'                \item{\code{type}}{the type of the relational event.}
#'            }
#'     }
#'    \item{\code{actors}}{names of actors interacting in the dynamic network.}
#'    \item{\code{types}}{names of event types observed in the network and describing the sentiment of the interaction (\emph{conflict}, \emph{competition} and \emph{cooperation}).}
#'    \item{\code{origin}}{starting time point (\code{t_0}) prior to the first observed event (\code{t_1}), the class of this object must be the same as the one of the time column in the edgelist.}
#'    \item{\code{omit_dyad}}{a list where each element describes an alteration of the riskset which takes place at specific time points and for certain actors and/or types.
#'     }
#'}
"randomREH"


#' Random Relational Event History (small)
#'
#' A subset from the randomly generated sequence of relational events `randomREH`, with 5 actors and 586 events (without event types).
#'
#'
#' @name randomREHsmall
#' @docType data
#'
#'
#' @format \code{data(randomREHsmall)} will load a list containing following objects:
#'\describe{
#'    \item{\code{edgelist}}{a \code{data.frame} that contains the random sequence of events. Columns of the edgelist are:
#'            \describe{
#'                \item{\code{time}}{the timestamp indicating the time at which each event occurred;}
#'                \item{\code{actor1}}{the name of the actor that generated the relational event;}
#'                \item{\code{actor2}}{the name of the actor that received the relational event;}
#'            }
#'     }
#'    \item{\code{actors}}{names of actors interacting in the dynamic network.}
#'    \item{\code{origin}}{starting time point (\code{t_0}) prior to the first observed event (\code{t_1}), the class of this object must be the same as the one of the time column in the edgelist.}
#'    \item{\code{omit_dyad}}{a list where each element describes an alteration of the riskset which takes place at specific time points and for certain actors and/or types.
#'     }
#'}
"randomREHsmall"


#' Simulated relational event history
#'
#' A dataset containing a small example of a relational event history. Data is
#' simulated.
#'
#' @format A dataframe with 115 rows and 5 variables:
#' \describe{
#'  \item{time}{time of the event since onset of observation (e.g., in minutes)}
#'  \item{actor1}{the first actor involved in the event}
#'  \item{actor2}{the second actor involved in the event}
#'  \item{setting}{the setting for the event}
#'  \item{weight}{the intensity of the event (e.g., based on the duration)}
#' }
#'
#' @usage data(history)
#' @source Simulated relational event history for actors in a social network.
#' @seealso \code{\link{info}} for exogenous information on the actors in
#' the social network.
#'
#' @keywords dataset
"history"

#' Simulated exogenous information on actors in a social network.
#'
#' A dataset containing exogenous information on the actors in the social
#' network of a relational event history. Data is simulated.
#'
#' @format A dataframe with 10 rows and 5 variables:
#' \describe{
#'  \item{id}{numeric id of the actor}
#'  \item{time}{numeric value, describes when the value of the covariate
#'   changes, if it changes}
#'  \item{age}{dichotomized age of the actor (e.g., 0 = below 25, 1 = 25 or
#'   older)}
#'  \item{sex}{dichotomized sex of the actor (e.g., 0 = male, 1 = female)}
#'  \item{extraversion}{standardized extraversion score of the actor}
#'  \item{agreeableness}{standardized agreeableness score of the actor}
#' }
#'
#' @usage data(info)
#' @source Simulated exogenous information on actors in a social network.
#' @seealso \code{\link{history}} for the relational event history.
#'
#' @keywords dataset
"info"

# Define effects for the start and end models of DuREM
start_effects <- ~ 1 + remstats::inertia(scaling = "std") + remstats::reciprocity(scaling = "std") +
  remstats::send("age", attr_actors = info2, scaling = "std") + remstats::outdegreeSender(scaling = "std") +
  remstats::isp(scaling = "std")
end_effects <- ~ 1 + remstats::totaldegreeDyad(scaling = "std") + remstats::difference("age", attr_actors = info2, scaling = "std")


#' Generated Relational Event History with Duration, Type, and Weight
#'
#' A randomly generated sequence of relational events `randomREH2`, among 5
#' actors and 1000 events with duration. For starting an event, inertia,
#' reciprocity, outdegreeSender, isp, and age of sender were
#' used; for (undirected) ending an event totaldegreeDyad and age difference
#' was used. Actor covariates in \code{\link{info2}}.
#'
#' @name randomREH2
#' @docType data
#'
#' @format \code{data(randomREH2)} will load a list containing following objects:
#'\describe{
#'    \item{\code{edgelist}}{
#'    a \code{data.frame} that contains the random sequence of events. Columns of the edgelist are:
#'            \describe{
#'                \item{\code{time}}{the timestamp indicating the time at which each event occurred;}
#'                \item{\code{actor1}}{the name of the actor that generated the relational event;}
#'                \item{\code{actor2}}{the name of the actor that received the relational event;}
#'                \item{\code{end}}{the time of ending the relational event;}
#'                \item{setting}{the setting (type) of the event, either \code{social} or \code{work};}
#'                \item{duration}{the duration of each event, which can also function as event weight for instance.}
#'            }
#'     }
#'}
#' @usage data(randomREH2)
#' @seealso \code{\link{info2}} for actor covariates.
"randomREH2"


#' Exogenous information of 5 actors
#'
#' A dataset containing the (hypothetical) age of the actors in a social
#' network of a relational event history \code{\link{randomREH2}}.
#'
#' @name info2
#' @docType data
#'
#' @format A dataframe with 7 rows and 5 variables:
#' \describe{
#'  \item{name}{numeric id of the actor}
#'  \item{time}{numeric value, describes when the value of the covariate
#'   changes, if it changes}
#'  \item{age}{age of the actor}
#'  \item{sex}{dichotomized sex of the actor (e.g., 0 = male, 1 = female)}
#' }
#'
#' @usage data(info2)
#' @seealso \code{\link{randomREH2}} for the relational event history.
#'
#' @keywords dataset
"info2"

