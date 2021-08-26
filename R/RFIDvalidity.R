#' Face-to-face contacts between participants of an experiment
#'
#' This dataset contains two sequences with two types of measures of the same
#' social interactions between participants of an experiment, advertised as an
#' after-work get-together event. Participants were 11 individuals, staff and
#' students of a Swiss university. During the event, participants engaged in
#' social interactions with other participants. RFID badges and a video
#' recorded the face-to-face interactions between the participants. RFID data
#' was by the authors transformed into a time-stamped edgelist, available in
#' the 'RFID' element. Two individiuals coded the interactions in the video,
#' these are available in the 'video' element.
#'
#' @docType data
#'
#' @usage data(RFIDvalidity)
#'
#' @format List with elements 'RFID' and 'video'
#'
#' @section RFID:
#' Dataframe with 1,168 RFID-recorded face-to-face interactions.
#' \describe{
#'  \item{time}{POSIXct value that indicates the onset of the contact.}
#'  \item{actor1}{Integer value with the ID of the first actor in the contact.}
#'  \item{actor2}{Integer value with the ID of the second actor in the contact.}
#'  \item{duration}{Numeric value that indicates the duration of the contact in
#' seconds.}
#' }
#'
#' @section video:
#' Dataframe with 396 human-coded video-taped face-to-face interactions.
#' \describe{
#'  \item{time}{POSIXct value that indicates the onset of the contact.}
#'  \item{actor1}{Integer value with the ID of the first actor in the contact.}
#'  \item{actor2}{Integer value with the ID of the second actor in the contact.}
#'  \item{duration}{Numeric value that indicates the duration of the contact in
#' seconds.}
#' }
#'
#' @source \url{https://osf.io/rrhxe/}
#'
#' @references Timon Elmer, Krishna Chaitanya, Prateek Purwar, Cristoph
#' Stadtfeld (2019) The validity of RFID badges measuring face-to-face
#' interactions. Behavior Research Methods 51:2120-2138.
#' \url{https://doi.org/10.3758/s13428-018-1180-y}
"RFIDvalidity"
