#' Newsportal article clicks
#'
#' This dataset contains the sequence of 2,988,181 article clicks of users of
#' the newsportal Globo.com between October 1st and October 16th, 2017. The
#' relational event history with these clicks can be found in the 'edgelist'
#' element. Information on the attributes of the articles is available in the
#' 'articles' element. Information on the attributes of the sessions that
#' users started in which they clicked on one or more articles is available in
#' the 'sessions' element.
#'
#' @docType data
#'
#' @usage data(newsportal)
#'
#' @format List with elements 'edgelist', 'articles', 'sessions' and 'users':
#'
#' @section edgelist:
#' Dataframe with 2,988,181 and 4 columns with the timestamped article clicks
#' of the users of the newsportal Globo.com.
#' \describe{
#'  \item{time}{POSIXct value with the timestamp of the click.}
#'  \item{user}{Integer value with the ID of the user that clicked on the
#' article.}
#'  \item{article}{Integer value with the ID of the article on which the user
#' clicked.}
#'  \item{session}{Integer with the ID of the session (more information on the
#' sessions, including on the start time, size, environment, device type and
#' operating system can be found in the 'sessions' element).}
#' }
#'
#' @section articles:
#' Dataframe with 364,047 rows and 4 columns with attribute information for the
#' articles that were clicked on during the study period.
#' \describe{
#'  \item{id}{Integer value with the ID of the article.}
#'  \item{category}{Integer value with the ID of the category of the article
#' (values unknown).}
#'  \item{created_at}{POSIXct value with the timestamp when the article was
#' created.}
#'  \item{word_count}{Numeric value with the number of words in the article.}
#' }
#'
#' @section sessions:
#' Dataframe with 1,048,594 rows and 7 columns with attribute information for
#' the sessions in which users of Globo.com clicked on articles.
#' \describe{
#'  \item{user}{Integer value with the ID of the user that started a session
#' during which she/he clicked on one or more articles.}
#'  \item{session}{Integer value with the ID of the session.}
#'  \item{start}{POSIXct value with the timestamp of the start of the session.}
#'  \item{size}{Integer value with the number of interactions during the
#' session.}
#'  \item{environment}{Integer value with the ID of the environment type (1 =
#' Facebook Instant Article, 2 = Mobile App, 3 = Accelerated Mobile Pages, 4 =
#' Web).}
#'  \item{device}{Integer with the ID of the device type (1 = Tablet, 2 = TV, 3
#' = Empty, 4 = Mobile, 5 = Desktop).}
#'  \item{os}{Integer with the ID of the operational system (1 = other, 2 =
#' iOS, 3 = Android, 4 = Windows Phone, 5 = Windows Mobile, 6 = Windows, 7 =
#' Mac OS X, 8 = Mac OS, 9 = Samsung, 10 = FireHbbTv, 11 = ATV OS X, 12 = tvOS,
#' 13 = Chrome OS, 14 = Debian, 15 = Symbian OS, 16 = BlackBerry OS, 17 =
#' Firefox OS, 18 = Android, 19 = 19 = Brew MP, 20 = Chromecast, 21 = webOS,
#' 22 = Gentoo, 23 = Solaris).}
#' }
#'
#' @section users:
#' Vector of length 322,897 with the integer IDs of all the users that clicked
#' on one or more articles during the study period.
#'
#' @source \url{https://www.kaggle.com/gspmoreira/news-portal-user-interactions-by-globocom}
#'
#' @references G. D. S. P. Moreira, D. Jannach and A. M. D. Cunha, "Contextual
#' Hybrid Session-Based News Recommendation With Recurrent Neural Networks," in
#' IEEE Access, vol. 7, pp. 169185-169203, 2019, \url{https://doi.org/10.1109/ACCESS.2019.2954957}
"newsportal"
