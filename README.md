
# An R Client for the Dark Sky Weather API

The [Dark Sky API](https://darksky.net/dev) allows you to look up past, present,
and future weather conditions for any point on the globe, and the DarkSky
package for R aims to simplify such calls.

## Installation

Install directly from GitHub with:

```
devtools::install_github('fascinatingfingers/DarkSky')
```

## Getting started

To connect to the API, you'll need to register and be issued a developer key;
(see <https://darksky.net/dev/register>), and you'll also need to know the
latitude and longitude of your location. You can save these secrets as session
options as follows.

```{r}
DarkSky::set_dark_sky_credentials(
    key = '<Dark Sky secret key>',
    lat = 42.3736,
    lon = -71.1097
)
```

Once you've set your credentials, getting the forecast is as simple as...

```{r}
weather <- DarkSky::get_forecast()
weather$currently
```
