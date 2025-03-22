library(googlesheets4)
sheet_url <- "https://docs.google.com/spreadsheets/d/16kzgCFB30W6im_Sk6ONdgHyZnijd8Smk4SmiNdgFzYQ/edit"
dados <- read_sheet(sheet_url)
print(colnames(dados))
