list(
  google = list(
    url = "https://dns.google.com/experimental",
    extra_params = list()
  ),
  cloudflare = list(
    url = "https://cloudflare-dns.com/dns-query",
    extra_params = list(
      cd = "false",
      do = "true",
      ct = "application/dns-json"
    )
  ),
  quad9 = list(
    url = "https://dns.quad9.net/dns-query",
    extra_params = list()
  ),
  securedns_eu = list(
    url = "https://doh.securedns.eu/dns-query",
    extra_params = list(
      edns_client_subnet = NULL
    )
  ),
  dnswarden_adblock = list(
    url = "https://doh.dnswarden.com/adblock",
    extra_params = list()
  ),
  dnswarden_uncensored = list(
    url = "https://doh.dnswarden.com/uncensored",
    extra_params = list()
  ),
  cleanbrowsing_security = list(
    url = "https://doh.cleanbrowsing.org/doh/security-filter/",
    extra_params = list(cd = "false")
  ),
  cleanbrowsing_family = list(
    url = "https://doh.cleanbrowsing.org/doh/family-filter/",
    extra_params = list()
  ),
  cleanbrowsing_adult = list(
    url = "https://doh.cleanbrowsing.org/doh/adult-filter/",
    extra_params = list()
  ),
  power_dns = list(
    url = "https://doh.powerdns.org",
    extra_params = list()
  ),
  appliedprivacy = list(
    url = "https://doh.appliedprivacy.net/query",
    extra_params = list()
  )
) -> doh_servers