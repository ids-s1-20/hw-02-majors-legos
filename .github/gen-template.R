library(magrittr)
library(readr)

parsermd::parse_rmd("hw-02.Rmd") %>%
  parsermd::as_tibble() %>%
  dplyr::filter(sec_h3 != "Load packages and data" & !is.na(sec_h3)) %>%
  parsermd::rmd_template(keep_content = TRUE, keep_headings = TRUE) %>%
  write_rds(here::here(".github/workflows/template.rds"))
