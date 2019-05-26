#' Make a DoH Request (GET/REST)
#'
#' Issue a `GET` REST API query of type `type` for `name` to the
#' DoH endpoint specified at `server_path`.
#'
#' @param name name to query for
#' @param type DNS query type (defaults to "`A`")
#' @param server_path full URL path to the DoH server quer endpoint (defaults to Quad9).
#' @param extra_params any special `GET` query parameter needed for a given server API endpoint.
#'        this should be a named `list`.
#' @return `NULL` (if the query failed) or a `data.frame` (tibble)
#' @references <https://tools.ietf.org/id/draft-ietf-doh-dns-over-https-05.html>
#' @export
#' @examples
#' doh_get("rud.is", "A")
doh_get <- function(name, type = "a", extra_params = list(), service_path = "https://9.9.9.9/dns-query") {

  stopifnot(is.list(extra_params))

  extra_params[["name"]] <- tolower(name)
  extra_params[["type"]] <- tolower(type[1])

  httr::GET(
    url = service_path,
    query = extra_params,
    .PLAYDOH_UA
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")
  out <- jsonlite::fromJSON(out)

  # will be NULL or a data frame
  ret <- out[["Answer"]]

  # cleanup column names and add query metadata if query was OK
  if (length(ret)) {

    colnames(ret) <- tolower(colnames(ret))

    attr(ret, "question") <- out[["Question"]]
    attr(ret, "flags") <- out[c("Status", "TC", "RD", "RA", "AD", "CD")]
    attr(ret, "edns_client_subnet") <- out[["edns_client_subnet"]]
    attr(ret, "comment") <- out[["comment"]]

  }

  ret

}
