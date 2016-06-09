library(shiny)
library(datasets)

# We tweak the "am" field to have nicer factor labels. Since this doesn't
# rely on any user inputs we can do this once at startup and then use the
# value throughout the lifetime of the application
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))
mpgData$vs <- factor(mpgData$vs, labels = c("V", "S"))
mpgData$model <- row.names(mpgData)
mpgData <- mpgData[,c("model", "am", "vs", "cyl", "gear", "mpg")]

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Compute the search text in a reactive expression since it is 
  # shared by the output$search_text and output$list expressions
  searchText <- reactive(
    {
      paste("<hr/><h4>Searching for automobiles with:</h4>  Transmission: <b>", input$transmission, "</b>, Engine Type:  <b>", input$vs, 
            "</b>, Min Cylinders:  <b>", input$cylinder, "</b>, Min Gears:  <b>", input$gear, "</b><br/><hr />" )
    }
  )
  
  searchResults <- reactive(
    {
      data = subset(mpgData, am == input$transmission | input$transmission == "Both")
      data = subset(data, vs == input$vs | input$vs == "Both")
      data = subset(data, cyl >= input$cylinder)
      data = subset(data, gear >= input$gear )
      return(data)      
    }
  )


  output$search_by <- renderText({
    searchText()
  })
  
  output$summary <- renderText({
    data <- searchResults()
    max_mpg <- max(data$mpg)
    best_model <- data[data$mpg == max_mpg, c("model")]
    
    output <- searchText()
    output <- paste(output, "<h4>Best MPG:</h4>  ",max_mpg, "<br/>")
    output <- paste(output, "<h4>Best Model:</h4>  ", best_model)
    return(output)
  })

    output$list <- renderDataTable(
    {
      data <- searchResults()
      colnames(data) <- c("Model", "Transmission", "Engine Type", "Cylinders", "# of Gears", "MPG")
      return(data)
    }, 
    options = list(aLengthMenu = c(5, 10, 20), 
                  iDisplayLength = 5,
                  autoWidth=TRUE)
  )
  
})
