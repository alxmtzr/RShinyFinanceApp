#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)


# Define server logic required to draw a histogram
function(input, output) {
  # Load or provide your data here
  # Assumption: Your data is in a DataFrame named "df"
  df <- read_csv("D:/Code/rstudio_workbench/R_Shiny/Shiny_apps/FinanceApp/csv/data_cleaned.csv")
  
  
  # Filter the data based on the selected date (first day of the month) and Expenses
  filtered_data_out <- reactive({
    selected_date <- input$selected_date
    month_start <- as.Date(paste0(format(selected_date, "%Y-%m"), "-01"))
    month_end <- as.Date(paste0(format(selected_date, "%Y-%m"), "-01")) + months(1)
    
    df %>%
      filter(booking_date >= month_start & booking_date < month_end, in_out == "Ausgang")
  })
  
  # Filter the data based on the selected date (first day of the month) and Income
  filtered_data_in <- reactive({
    selected_date <- input$selected_date
    month_start <- as.Date(paste0(format(selected_date, "%Y-%m"), "-01"))
    month_end <- as.Date(paste0(format(selected_date, "%Y-%m"), "-01")) + months(1)
    
    df %>%
      filter(booking_date >= month_start & booking_date < month_end, in_out == "Eingang")
  })
  
  # Select only the desired columns for the tables
  selected_columns_table_out <- reactive({
    select(filtered_data_out(), payer, recipient, reason_for_transfer, amount_euro)
  })
  
  selected_columns_table_in <- reactive({
    select(filtered_data_in(), payer, recipient, reason_for_transfer, amount_euro)
  })
  
  # Create text for the titles
  title_out <- reactive({
    selected_month <- format(input$selected_date, "%B %Y")
    paste("Month:", selected_month)
  })
  
  title_in <- reactive({
    selected_month <- format(input$selected_date, "%B %Y")
    paste("Month:", selected_month)
  })
  
  # Display the tables and titles based on the filtered and selected data
  output$tab_out <- renderTable({
    selected_columns_table_out()
  })
  
  output$tab_in <- renderTable({
    selected_columns_table_in()
  })
  
  output$title_out <- renderText({
    title_out()
  })
  
  output$title_in <- renderText({
    title_in()
  })
}
