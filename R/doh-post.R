#' Make a POST DoH Request (wireformat)
#'
#' Issue the query of type `type` for `name` to the DoH endpoint specified at `server_path`.
#'
#' @param name name to query for
#' @param type DNS query type (defaults to "`A`")
#' @param server_path full URL path to the DoH server quer endpoint (defaults to Quad9).
#' @return `NULL` (if the query failed) or a `data.frame` (tibble)
#' @export
doh_post <- function(name, type = "A", server_path = "https://dns.quad9.net/dns-query") {

  # for now, use python's {dnslib} as a crutch to
  # encode/decode wireformat DNS questions and answers

  .dns$DNSRecord$question(
    qname = tolower(name[1]),
    qtype = toupper(type[1]),
    qclass = "IN"
  ) -> q

  qpak <- q$pack()

  # now, send it off to the server

  httr::POST(
    url = server_path[1],
    httr::add_headers(
      `Content-Type` = "application/dns-message",
      `Accept` = "application/dns-message"
    ),
    encode = "raw",
    body = qpak
  ) -> res

  httr::warn_for_status(res)

  # if the response is OK, make it a data frame

  if (httr::status_code(res) == 200) {

    r <- .dns$DNSRecord$parse(httr::content(res))

    q <- r$get_q()

    do.call(
      rbind.data.frame,
      lapply(r$rr, function(.x) {
        data.frame(
          query = py_str(q$qname),
          qtype = q$qtype,
          rname = py_str(.x$rname),
          rtype = .x$rtype,
          rdata = py_str(.x$rdata),
          ttl = .x$ttl,
          stringsAsFactors = FALSE
        )
      })

    ) -> xdf

    class(xdf) <- c("tbl_df", "tbl", "data.frame")

    xdf

  } else {
    NULL
  }

}
