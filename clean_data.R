library(tidyverse)
rm(list = ls())

# data set
df = read_csv2("D:/Code/rstudio_workbench/R_Shiny/Shiny_apps/FinanceApp/csv/data_c.csv")

df <- df %>%
  select(-c(Wertstellung, `Gläubiger-ID`, Mandatsreferenz, Kundenreferenz))

# renaming columns
df <- df %>% 
  rename(
    "booking_date" = "Buchungsdatum",
    "status" = "Status",
    "payer" = "Zahlungspflichtige*r",
    "recipient" = "Zahlungsempfänger*in",
    "reason_for_transfer" = "Verwendungszweck",
    "in_out" = "Umsatztyp",
    "amount_euro" = "Betrag"
  )
 
 
# changing data types
df <- df %>% mutate(booking_date = as.Date(booking_date, format = "%d.%m.%y"),
                   status = as.character(status))
# remove dots
df$amount_euro <- gsub("\\.", "", df$amount_euro)

# replace , with .
df$amount_euro <- gsub(",", ".", df$amount_euro)

# remove €
df$amount_euro <- gsub("\\s*€", "", df$amount_euro)

# remove -
df$amount_euro <- gsub("-", "", df$amount_euro)

# remove blanks
df$amount_euro <- gsub("[^0-9.-]", "", df$amount_euro)

# change data type to numeric
df$amount_euro <- as.numeric(df$amount_euro)
 
# recipient and reason for transfer to lower case
df <- df %>%
  mutate_at(c("recipient", "reason_for_transfer"), tolower)
 
# write csv
write.csv(df, "D:/Code/rstudio_workbench/R_Shiny/Shiny_apps/FinanceApp/csv/data_cleaned.csv", row.names = FALSE)
 

 