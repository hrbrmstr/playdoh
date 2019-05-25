py_c <- reticulate::py_config()

.dns <- NULL

.onLoad <- function(libname, pkgname) {

  if (utils::compareVersion(py_c$version, "3.5") < 0) {
    stop(
      paste0(
        c(
          "Python 3.5+ is required. If this is installed please set RETICULATE_PYTHON ",
          "to the path to the Python 3 binary on your system and try re-installing/",
          "re-loading the package."
        ),
        collapse = ""
      )
    )
    return()
  }

  if (!reticulate::py_module_available("dnslib")) {
    packageStartupMessage(
      "The 'dnslib' Python module must be installed."
    )
  } else {
    .dns <<- reticulate::import("dnslib", delay_load = TRUE)
  }

}