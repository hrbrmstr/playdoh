
[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/playdoh.svg?branch=master)](https://travis-ci.org/hrbrmstr/playdoh)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/playdoh/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/playdoh)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/playdoh)](https://cran.r-project.org/package=playdoh)

# playdoh

Make ‘DNS over HTTPS’ Queries

## Description

Make ‘DNS over HTTPS’ Queries

DoH RTFM:
<https://tools.ietf.org/id/draft-ietf-doh-dns-over-https-05.html>

## What’s Inside The Tin

The following functions are implemented:

  - `doh_post`: Make a POST DoH Request (wireformat)

## Installation

``` r
devtools::install_git("https://sr.ht.com/~hrbrmstr/playdoh.git")
# or
devtools::install_gitlab("hrbrmstr/playdoh.git")
# or (if you must)
devtools::install_github("hrbrmstr/playdoh")
```

## Usage

``` r
library(playdoh)
library(tidyverse) # for printing

# current version
packageVersion("playdoh")
## [1] '0.1.0'
```

### Basic functionality

``` r
doh_get("rud.is")
##      name type  ttl                       expires          data
## 1 rud.is.    1 2300 Sun, 26 May 2019 18:08:58 UTC 172.93.49.183

doh_get("lenovo.com", "txt")
##           name type  ttl                       expires
## 1  lenovo.com.   16 7200 Sun, 26 May 2019 19:30:38 UTC
## 2  lenovo.com.   16 7200 Sun, 26 May 2019 19:30:38 UTC
## 3  lenovo.com.   16 7200 Sun, 26 May 2019 19:30:38 UTC
## 4  lenovo.com.   16 7200 Sun, 26 May 2019 19:30:38 UTC
## 5  lenovo.com.   16 7200 Sun, 26 May 2019 19:30:38 UTC
## 6  lenovo.com.   16 7200 Sun, 26 May 2019 19:30:38 UTC
## 7  lenovo.com.   16 7200 Sun, 26 May 2019 19:30:38 UTC
## 8  lenovo.com.   16 7200 Sun, 26 May 2019 19:30:38 UTC
## 9  lenovo.com.   16 7200 Sun, 26 May 2019 19:30:38 UTC
## 10 lenovo.com.   16 7200 Sun, 26 May 2019 19:30:38 UTC
##                                                                                          data
## 1                               "facebook-domain-verification=1r2am7c2bhzrxpqyt0mda0djoquqsi"
## 2                      "google-site-verification=sHIlSlj0U6UnCDkfHp1AolWgVEvDjWvc0TR4KaysD2c"
## 3                      "google-site-verification=nGgukcp60rC-gFxMOJw1NHH0B4VnSchRrlfWV-He_tE"
## 4                                                          "a82c74b37aa84e7c8580f0e32f4d795d"
## 5             "Visit www.lenovo.com/think for information about Lenovo products and services"
## 6                                                          "qh7hdmqm4lzs85p704d6wsybgrpsly0j"
## 7                      "google-site-verification=VxW_e6r_Ka7A518qfX2MmIMHGnkpGbnACsjSxKFCBw0"
## 8                                                          "ece42d7743c84d6889abda7011fe6f53"
## 9  "iHzQJvsKnyGP2Nm2qBgL3fyBJ0CC9z4GkY/flfk4EzLP8lPxWHDDPKqZWm1TkeF5kEIL+NotYOF1wo7JtUDXXw=="
## 10                    "v=spf1 include:spf.messagelabs.com include:_netblocks.eloqua.com ~all"
```

## playdoh Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |        6 | 0.86 | 107 | 0.91 |          20 | 0.48 |       47 | 0.57 |
| Rmd  |        1 | 0.14 |  11 | 0.09 |          22 | 0.52 |       36 | 0.43 |

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
