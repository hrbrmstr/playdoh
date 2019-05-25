
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
doh_post("rud.is")
## # A tibble: 1 x 6
##   query   qtype rname   rtype rdata           ttl
##   <chr>   <int> <chr>   <int> <chr>         <int>
## 1 rud.is.     1 rud.is.     1 172.93.49.183  3600

doh_post("lenovo.com", "txt")
## # A tibble: 10 x 6
##    query      qtype rname      rtype rdata                                                                           ttl
##    <chr>      <int> <chr>      <int> <chr>                                                                         <int>
##  1 lenovo.co…    16 lenovo.co…    16 "\"qh7hdmqm4lzs85p704d6wsybgrpsly0j\""                                            1
##  2 lenovo.co…    16 lenovo.co…    16 "\"ece42d7743c84d6889abda7011fe6f53\""                                            1
##  3 lenovo.co…    16 lenovo.co…    16 "\"a82c74b37aa84e7c8580f0e32f4d795d\""                                            1
##  4 lenovo.co…    16 lenovo.co…    16 "\"google-site-verification=VxW_e6r_Ka7A518qfX2MmIMHGnkpGbnACsjSxKFCBw0\""        1
##  5 lenovo.co…    16 lenovo.co…    16 "\"google-site-verification=sHIlSlj0U6UnCDkfHp1AolWgVEvDjWvc0TR4KaysD2c\""        1
##  6 lenovo.co…    16 lenovo.co…    16 "\"Visit www.lenovo.com/think for information about Lenovo products and serv…     1
##  7 lenovo.co…    16 lenovo.co…    16 "\"google-site-verification=nGgukcp60rC-gFxMOJw1NHH0B4VnSchRrlfWV-He_tE\""        1
##  8 lenovo.co…    16 lenovo.co…    16 "\"iHzQJvsKnyGP2Nm2qBgL3fyBJ0CC9z4GkY/flfk4EzLP8lPxWHDDPKqZWm1TkeF5kEIL+NotY…     1
##  9 lenovo.co…    16 lenovo.co…    16 "\"v=spf1 include:spf.messagelabs.com include:_netblocks.eloqua.com ~all\""       1
## 10 lenovo.co…    16 lenovo.co…    16 "\"facebook-domain-verification=1r2am7c2bhzrxpqyt0mda0djoquqsi\""                 1
```

## playdoh Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |        6 | 0.86 | 122 | 0.92 |          23 | 0.51 |       26 | 0.42 |
| Rmd  |        1 | 0.14 |  11 | 0.08 |          22 | 0.49 |       36 | 0.58 |

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
