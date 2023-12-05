#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(shinyWidgets)


# Define UI for application that draws a histogram
fluidPage(
  sidebarLayout(
    sidebarPanel(
      airDatepickerInput("selected_date", 
                         label = "Choose a date:",
                         value = Sys.Date(),
                         view = "months",
                         minView = "months",
                         dateFormat = "yyyy-mm"
      )
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Expenses", 
                 br(),
                 textOutput("title_out"),
                 br(),
                 tableOutput("tab_out")
        ),
        tabPanel("Income", 
                 br(),
                 textOutput("title_in"),
                 br(),
                 tableOutput("tab_in")
        )
      )
    )
  )
)
