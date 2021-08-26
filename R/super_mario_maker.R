#' Interactions between players of Super Mario Maker
#'
#' This dataset contains the sequences of interactions between players of Super
#' Mario Maker between November 16th 2017 and April 10th 2018. Super Mario
#' Maker is an online game in which players can both create their own courses
#' and play courses created by other players. This data set contains two types
#' of interactions: (1) in the 'plays' element, the records of which player
#' \emph{played} which course created by which player at what time are
#' collected, and (2) in the 'likes' element, the records of which player
#' \emph{liked} which course created by which player at what time are
#' collected. Note that these directed interactions can be viewed both as
#' two-modal (players > courses) and one-modal (players > creator). The players/
#' creators in the different elements of the dataset are linked by their id in
#' 'actors' and the courses in the different elements of the dataset are linked
#' by their id in 'courses'. The 'actors' elements also includes additional
#' attributes for the actors and the 'courses' element includes additional
#' attributes for the courses, including the timestamp of creation.
#'
#' @docType data
#'
#' @usage data(super_mario_maker)
#'
#' @format List with elements 'plays', 'likes', 'courses' and 'actors'.
#'
#' @section plays:
#' Dataframe with 3,941,378 rows and 4 columns that contains timestamped plays
#' of the courses by the players.
#' \describe{
#'  \item{time}{POSIXct value indicating the timestamp of the play.}
#'  \item{player}{Integer value with the ID of the actor that plays the course.}
#'  \item{course}{Integer value with the ID of the course that is being played.}
#'  \item{creator}{Integer value with the ID of the actor that created the
#' course that is being played.}
#' }
#'
#' @section likes:
#' Dataframe with 618,687 rows and 4 columns that contains timestamped likes
#' of the courses by the players.
#' \describe{
#'  \item{time}{POSIXct value indicating the timestamp of the like.}
#'  \item{player}{Integer value with the ID of the actor that likes the course.}
#'  \item{course}{Integer value with the ID of the course that is being liked.}
#'  \item{creator}{Integer value with the ID of the actor that created the
#' course that is being liked.}
#' }
#'
#' @section courses:
#' Dataframe with 115,032 rows and 5 columns with attribute information for the
#' courses.
#' \describe{
#'  \item{id}{Integer value with the ID of the course.}
#'  \item{creator}{Integer value with the ID of the creator of the course.}
#'  \item{difficulty}{String with the difficulty of the course (easy, normal,
#' expert or superExpert).}
#'  \item{gameStyle}{String with the style of the game (marioBros, marioBros3,
#' marioBrosU or marioWorld).}
#'  \item{time}{POSIXct value with the timestamp of the creation of the course.}
#' }
#'
#' @section actors:
#' Dataframe with 884,303 rows and 4 columns with attribute information for the
#' players.
#' \describe{
#'  \item{id}{Integer value with the ID of the player.}
#'  \item{plays}{Indicates whether the player is in the 'plays' dataframe as
#' player (1 = yes, 0 = no).}
#'  \item{creates}{Indicates whether the player is in the 'courses' dataframe
#' as creator (1 = yes, 0 = no).}
#'  \item{likes}{Indicates whether the player is in the 'likes' dataframe as
#' player (1 = yes, 0 = no).}
#'  \item{country}{String with the abbreviated country of the player.}
#' }
#'
#' @source \url{https://www.kaggle.com/leomauro/smmnet}
#'
#' @references Leonardo Mauro Pereira Moraes, & Robson Leonardo Ferreira
#' Cordeiro (2019). SMMnet: A Social Network of Games Dataset. In Brazilian
#' Symposium on Databases (SBBD) 2019 - Dataset Showcase Workshop (DSW). \url{https://www.kaggle.com/leomauro/smmnet}
"super_mario_maker"

