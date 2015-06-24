# Create the user interface
shinyUI(
  fluidPage(
    fluidRow(column(6,
                    plotOutput("SepalPlot",
                               hoverId = "hoverSepal",
                               clickId = "clickSepal")),
             column(6,
                    plotOutput("PetalPlot",
                               hoverId = "hoverPetal",
                               clickId = "clickPetal"))
    ),
    fluidRow(column(1,""),
             column(2,
                    sliderInput("Sepal.Width", "Sepal.Width", 
                                min(iris$Sepal.Width), max(iris$Sepal.Width),
                                value = c(sepalBoundaries[[1]], sepalBoundaries[[3]]), 
                                step = (sepalBoundaries[[3]]-sepalBoundaries[[1]])/10)),
             column(2,
                    sliderInput("Sepal.Length", "Sepal.Length", 
                                min(iris$Sepal.Length), max(iris$Sepal.Length),
                                value = c(sepalBoundaries[[2]], sepalBoundaries[[4]]), 
                                step = (sepalBoundaries[[4]]-sepalBoundaries[[2]])/10)),
             column(2,""),
             column(2,
                    sliderInput("Petal.Width", "Petal.Width", 
                                min(iris$Petal.Width), max(iris$Petal.Width),
                                value = c(petalBoundaries[[1]], petalBoundaries[[3]]), 
                                step = (petalBoundaries[[3]]-petalBoundaries[[1]])/10)),
             column(2,
                    sliderInput("Petal.Length", "Petal.Length", 
                                min(iris$Petal.Length), max(iris$Petal.Length),
                                value = c(petalBoundaries[[2]], petalBoundaries[[4]]), 
                                step = (petalBoundaries[[4]]-petalBoundaries[[2]])/10)),
             column(1,"")),
    fluidRow(uiOutput("ui"))
  )
)
