
#' Dark Sky API Authentication
#'
#' These functions are used specifically for their side effects -- namely to
#' set (or reset) Dark Sky API authentication secrets stored in
#' \code{options()$DarkSky}.
#'
#' @param key Dark Sky secret key
#' @param lat latitude (in decimal degrees). Positive north; negative south.
#' @param lon longitude (in decimal degrees). Positive east; negative west.
#'
#' @return Returns \code{TRUE} (invisibly) if options were successfully set or
#'   reset.
#'
#' @seealso \url{https://darksky.net/dev/docs}
#'
#' @export
#'
set_dark_sky_credentials <- function(key, lat, lon) {

    # Check inputs
    if (length(key) != 1L || !grepl('^\\w{32}$', key)) {
        stop('Value for `key` does not appear to be a valid Dark Sky API key')
    }

    if (length(lat) != 1L || !is.numeric(lat) || lat < -90 || lat > 90) {
        stop('Value for `lat` must be a single number in [-90, 90]')
    }

    if (length(lon) != 1L || !is.numeric(lon) || lon < -180 || lon > 180) {
        stop('Value for `lon` must be a single number in [-180, 180]')
    }

    # Set options
    options(DarkSky = list(key = key, lat = lat, lon = lon))

    return(invisible(TRUE))
}

#' @rdname set_dark_sky_credentials
#' @export
reset_dark_sky_credentials <- function() {
    options(DarkSky = list())
    return(invisible(TRUE))
}
