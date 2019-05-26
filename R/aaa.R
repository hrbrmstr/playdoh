httr::user_agent(
  sprintf(
    "playdoh package v%s: (<%s>)",
    utils::packageVersion("playdoh"),
    utils::packageDescription("playdoh")$URL
  )
) -> .PLAYDOH_UA
