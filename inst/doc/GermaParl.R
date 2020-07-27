## ---- echo = FALSE, message = FALSE-------------------------------------------
Sys.setenv("CORPUS_REGISTRY" = "")

## ----s-attributes, echo = FALSE, message = FALSE------------------------------
s_attrs <- list(
  c("lp", "legislative period", "13 to 18"),
  c("session", "session/protocol number", "1 to 253"),
  c("src", "source material for data preparation", "txt or pdf"),
  c("url", "URL", "URL of the original document"),
  c("agenda_item", "agenda item", "number of the agenda item"),
  c("agenda_item_type", "type of agenda item", "debate/question_time/government_declaration/..."),
  c("date", "date of the session", "YYYY-MM-TT (e.g. '2013-06-28')"),
  c("year", "year of the session", "1996 to 2016"),
  c("interjection", "whether contribution is interjection", "TRUE/FALSE"),
  c("role", "role of the speaker", "presidency/mp/government/..."),
  c("speaker", "Name", "speaker name"),
  c("parliamentary_group", "Parliamentary group", "partliamentary group the speaker is affiliated with"),
  c("party", "Party", "party of the speaker")
)
tab <- do.call(rbind, s_attrs)
colnames(tab) <- c("s-attribute", "description", "values")
knitr::kable(tab, format = "markdown")

## ----installing_GermaParl, eval = FALSE---------------------------------------
#  install.packages("GermaParl")

## -----------------------------------------------------------------------------
library(GermaParl)

## ----load_germaparl, eval = FALSE---------------------------------------------
#  germaparl_download_corpus()

## ----check_installation, eval = FALSE-----------------------------------------
#  germaparl_is_installed()
#  germaparl_get_doi()
#  germaparl_get_version()

## ---- eval = FALSE------------------------------------------------------------
#  citation("GermaParl")

## ----stat_by_lp, eval = TRUE, echo = FALSE, message = FALSE-------------------
knitr::kable(GermaParl::germaparl_by_lp, format = "markdown")

## ----stat_by_year, eval = TRUE, echo = FALSE, message = FALSE-----------------
summary_row <- t(data.frame(colSums(GermaParl::germaparl_by_year)))
rownames(summary_row) <- NULL
content_rows <- GermaParl::germaparl_by_year
rownames(content_rows) <- NULL
tab <- rbind(content_rows, summary_row)
tab[["year"]] <- as.character(tab[["year"]])
tab[nrow(tab), "year"] <- "TOTAL"
tab[nrow(tab), "unknown_share"] <- round(
  sum(GermaParl::germaparl_by_year[["unknown_total"]]) / sum(GermaParl::germaparl_by_year[["size"]]),
  digits = 3
)
colnames(tab)[6:7] <- c("unknown (total)", "unknown (share)")
knitr::kable(tab, format = "markdown")

## ----urls, echo = FALSE, message = FALSE--------------------------------------

urls <- list(
  c("1996", "http://webarchiv.bundestag.de/archive/2005/1205/bic/plenarprotokolle/pp/1996/index.htm"),
  c("1997", "http://webarchiv.bundestag.de/archive/2005/1205/bic/plenarprotokolle/pp/1997/index.htm"),
  c("1998", "http://webarchiv.bundestag.de/archive/2005/1205/bic/plenarprotokolle/pp/1998/index.htm"),
  c("1999", "http://webarchiv.bundestag.de/archive/2005/1205/bic/plenarprotokolle/pp/1999/index.htm"),
  c("2000", "http://webarchiv.bundestag.de/archive/2005/1205/bic/plenarprotokolle/pp/2000/index.htm"),
  c("2001", "http://webarchiv.bundestag.de/archive/2005/1205/bic/plenarprotokolle/pp/2001/index.htm"),
  c("2002", "http://webarchiv.bundestag.de/archive/2005/1205/bic/plenarprotokolle/pp/2002/index.html"),
  c("2003", "http://webarchiv.bundestag.de/archive/2005/1205/bic/plenarprotokolle/pp/2003/index.html"),
  c("2004", "http://webarchiv.bundestag.de/archive/2005/1205/bic/plenarprotokolle/pp/2004/index.html"),
  c("2005", "http://webarchiv.bundestag.de/archive/2005/1205/bic/plenarprotokolle/pp/2005/index.html"),
  c("2006", "http://webarchiv.bundestag.de/archive/2008/0912/bic/plenarprotokolle/pp/2006/index.html"),
  c("2007", "http://webarchiv.bundestag.de/archive/2008/0912/bic/plenarprotokolle/pp/2007/index.html"),
  c("2008", "http://webarchiv.bundestag.de/archive/2008/0912/bic/plenarprotokolle/pp/2008/index.html")
)
tab <- do.call(rbind, urls)
colnames(tab) <- c("year", "URL")
knitr::kable(tab, format = "markdown")

