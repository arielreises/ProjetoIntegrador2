library(googlesheets4)
sheet_url <- "https://docs.google.com/spreadsheets/d/-censored-/edit"
dados <- read_sheet(sheet_url)
print(colnames(dados))
