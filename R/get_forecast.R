
#' Get Weather Forecast From Dark Sky API
#'
#' @return Returns the Dark Sky response, parsed into an R-friendly list.
#'
#' @seealso <https://darksky.net/dev/docs>
#'
#' @export
#'
get_forecast <- function() {
    key <- getOption('DarkSky')$key
    lat <- getOption('DarkSky')$lat
    lon <- getOption('DarkSky')$lon

    if (is.null(key) || is.null(lat) || is.null(lon)) {
        stop("Don't know how to request the Dark Sky forecast See `??set_dark_sky_credentials`")
    }

    path <- sprintf(
        'https://api.darksky.net/forecast/%s/%s,%s?units=si',
        key, lat, lon
    )

    x <-httr::GET(path)

    if (httr::http_type(x) != 'application/json') {
        stop('API did not return json', call. = FALSE)
    }

    y <- httr::content(x, 'parsed', encoding = 'UTF-8')

    if (httr::http_error(x)) {
        stop(
            sprintf(
                'API request failed [%s]\n%s',
                httr::status_code(x),
                yaml::as.yaml(y)
            ),
            call. = FALSE
        )
    }

    return(y)
}
