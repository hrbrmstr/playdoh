
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
doh_get("apple.com", "A")
## # A tibble: 3 x 5
##   name        type   ttl expires                       data         
## * <chr>      <int> <int> <chr>                         <chr>        
## 1 apple.com.     1  1521 Mon, 27 May 2019 16:26:57 UTC 17.142.160.59
## 2 apple.com.     1  1521 Mon, 27 May 2019 16:26:57 UTC 17.178.96.59 
## 3 apple.com.     1  1521 Mon, 27 May 2019 16:26:57 UTC 17.172.224.47

doh_get("rud.is", "AAAA")
## # A tibble: 1 x 5
##   name     type   ttl expires                       data                  
## * <chr>   <int> <int> <chr>                         <chr>                 
## 1 rud.is.    28 43200 Tue, 28 May 2019 04:01:37 UTC 2602:ff16:3::4dfb:9ac5

doh_get("rud.is", "MX")
## # A tibble: 4 x 5
##   name     type   ttl expires                       data                       
## * <chr>   <int> <int> <chr>                         <chr>                      
## 1 rud.is.    15 43200 Tue, 28 May 2019 04:01:37 UTC 40 aspmx2.googlemail.com.  
## 2 rud.is.    15 43200 Tue, 28 May 2019 04:01:37 UTC 20 alt1.aspmx.l.google.com.
## 3 rud.is.    15 43200 Tue, 28 May 2019 04:01:37 UTC 10 aspmx.l.google.com.     
## 4 rud.is.    15 43200 Tue, 28 May 2019 04:01:37 UTC 30 alt2.aspmx.l.google.com.

doh_get("lenovo.com", "TXT")
## # A tibble: 10 x 5
##    name        type   ttl expires                 data                                                                  
##  * <chr>      <int> <int> <chr>                   <chr>                                                                 
##  1 lenovo.co…    16  7200 Mon, 27 May 2019 18:01… "\"qh7hdmqm4lzs85p704d6wsybgrpsly0j\""                                
##  2 lenovo.co…    16  7200 Mon, 27 May 2019 18:01… "\"Visit www.lenovo.com/think for information about Lenovo products a…
##  3 lenovo.co…    16  7200 Mon, 27 May 2019 18:01… "\"a82c74b37aa84e7c8580f0e32f4d795d\""                                
##  4 lenovo.co…    16  7200 Mon, 27 May 2019 18:01… "\"iHzQJvsKnyGP2Nm2qBgL3fyBJ0CC9z4GkY/flfk4EzLP8lPxWHDDPKqZWm1TkeF5kE…
##  5 lenovo.co…    16  7200 Mon, 27 May 2019 18:01… "\"facebook-domain-verification=1r2am7c2bhzrxpqyt0mda0djoquqsi\""     
##  6 lenovo.co…    16  7200 Mon, 27 May 2019 18:01… "\"ece42d7743c84d6889abda7011fe6f53\""                                
##  7 lenovo.co…    16  7200 Mon, 27 May 2019 18:01… "\"google-site-verification=sHIlSlj0U6UnCDkfHp1AolWgVEvDjWvc0TR4KaysD…
##  8 lenovo.co…    16  7200 Mon, 27 May 2019 18:01… "\"google-site-verification=VxW_e6r_Ka7A518qfX2MmIMHGnkpGbnACsjSxKFCB…
##  9 lenovo.co…    16  7200 Mon, 27 May 2019 18:01… "\"google-site-verification=nGgukcp60rC-gFxMOJw1NHH0B4VnSchRrlfWV-He_…
## 10 lenovo.co…    16  7200 Mon, 27 May 2019 18:01… "\"v=spf1 include:spf.messagelabs.com include:_netblocks.eloqua.com ~…

doh_get("dataassurance.pwc.com", "CNAME")
## # A tibble: 1 x 5
##   name                    type   ttl expires                       data                   
## * <chr>                  <int> <int> <chr>                         <chr>                  
## 1 dataassurance.pwc.com.     5  3600 Mon, 27 May 2019 17:01:38 UTC f6759d2.x.incapdns.net.

doh_get("rud.is", "NS")
## # A tibble: 3 x 5
##   name     type   ttl expires                       data            
## * <chr>   <int> <int> <chr>                         <chr>           
## 1 rud.is.     2 43200 Tue, 28 May 2019 04:01:38 UTC dns.mwebdns.net.
## 2 rud.is.     2 43200 Tue, 28 May 2019 04:01:38 UTC dns.mwebdns.eu. 
## 3 rud.is.     2 43200 Tue, 28 May 2019 04:01:38 UTC dns.mwebdns.de.

doh_get("rud.is", "SOA")
## # A tibble: 1 x 5
##   name     type   ttl expires                     data                                                                  
## * <chr>   <int> <int> <chr>                       <chr>                                                                 
## 1 rud.is.     6 43200 Tue, 28 May 2019 04:01:38 … dns.mwebdns.de. hostmaster.mandoraweb.de. 2010012659 10800 3600 60480…

doh_get(to_inaddr_arpa("104.244.13.104"), "PTR")
## # A tibble: 1 x 5
##   name                          type   ttl expires                       data                         
## * <chr>                        <int> <int> <chr>                         <chr>                        
## 1 104.13.244.104.in-addr.arpa.    12 43200 Tue, 28 May 2019 04:01:38 UTC archive.farsightsecurity.com.
```

## playdoh Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines | (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | --: |
| R    |        7 | 0.88 | 125 | 0.88 |          25 | 0.47 |       54 | 0.6 |
| Rmd  |        1 | 0.12 |  17 | 0.12 |          28 | 0.53 |       36 | 0.4 |

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
