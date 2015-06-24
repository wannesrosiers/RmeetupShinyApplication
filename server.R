# Define the shiny server
shinyServer(function(input, output, session) {
  
  # Filter the data based on the slider input
  subIris <- reactive({
    subIris <- subsetData(jitteredIris,
                          input$Sepal.Width[1],input$Sepal.Width[2],
                          input$Sepal.Length[1],input$Sepal.Length[2],
                          input$Petal.Width[1],input$Petal.Width[2],
                          input$Petal.Length[1],input$Petal.Length[2])
    return(subIris)
  })
  
  # Check if and which variable in the legend you are hovering
  legendVar <- reactive({
    if (!is.null(input$hoverSepal$x)){
      legendVar <- legendChecker(input$hoverSepal$x, input$hoverSepal$y)
    } else {
      legendVar <- NULL
    }
  })
  
  # When hovering, calculate the closest point
  closestPoint <- reactive({
    # When hovering, calculate the closest point
    if (!is.null(input$hoverSepal$x)){
      temp <- calculateClosestPoint(subIris(),"Sepal.Width","Sepal.Length",
                                    input$hoverSepal$x,input$hoverSepal$y)
    } else if (!is.null(input$hoverPetal$x)) {
      temp <- calculateClosestPoint(subIris(),"Petal.Width","Petal.Length",
                                    input$hoverPetal$x,input$hoverPetal$y)
    } else {
      temp <- list(100,NULL,NULL)
    }
  })
  
  # When hovering, calculate the closest point
  closestClickPoint <- reactive({
    # When hovering, calculate the closest point
    if (!is.null(input$clickSepal$x)){
      temp <- calculateClosestPoint(subIris(),"Sepal.Width","Sepal.Length",
                                    input$clickSepal$x,input$clickSepal$y)
    } else if (!is.null(input$clickPetal$x)) {
      temp <- calculateClosestPoint(subIris(),"Petal.Width","Petal.Length",
                                    input$clickPetal$x,input$clickPetal$y)
    } else {
      temp <- list(100,NULL,NULL)
    }
  })
  
  # Create both plots
  output$SepalPlot <- renderPlot({
    plotFunction(subIris(),"Sepal.Width","Sepal.Length", 
                 closestPoint(), sepalBoundaries, TRUE,
                 species, colors, legendVar())
  })
  
  output$PetalPlot <- renderPlot({
    plotFunction(subIris(),"Petal.Width","Petal.Length",
                 closestPoint(), petalBoundaries,FALSE,
                 species, colors, legendVar())
  })
  
  # Create a data table of information you clicked on
  output$clickedObject <- renderDataTable({
    # Return a data frame with useful elements
    printData <- subIris()[which(subIris()$Species == closestClickPoint()[[3]]),]
    for (i in 1:4){
      printData[,i] <- round(printData[,i],1)
    }
    return(printData)
  }
  , options = list(searching = FALSE,
                    pageLength = 5,
                    lengthChange = 0)
  )
  
  output$ui <- renderUI({
    # Display the data frame if the click is close enough
    if(closestClickPoint()[[1]] > 0.1){
      return("")
    }
    else {
      dataTableOutput("clickedObject")
    }
  })

})
