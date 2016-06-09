library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Finding Cars"),
  
  # Sidebar with controls to select the variable to plot against mpg
  # and to specify whether outliers should be included
  sidebarPanel(
    selectInput("transmission", "Transmission:", selected="Both", list("Automatic" = "Automatic", "Manual" = "Manual", "Both" = "Both")),
    selectInput("vs", "Engine Type:", selected="Both", list("V-engine" = "V", "Straight" = "S", "Both" = "Both")),
    sliderInput("cylinder", "Minimum Cylinders:", value=4, min=4, max= 8, step=2),
    sliderInput("gear", "Minimum Forward gears:", value=3, min=3, max= 5, step=1)

  ),
  
  mainPanel(
    #tags$div(htmlOutput("search_by")),
    
    tabsetPanel( type="pills", position="above",
      tabPanel('Summary', htmlOutput("summary")),
      tabPanel('List', dataTableOutput("list"))
    )
  )
))
