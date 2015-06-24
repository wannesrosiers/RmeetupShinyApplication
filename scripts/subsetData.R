subsetData <- function(data, SW1, SW2, SL1, SL2, PW1, PW2, PL1, PL2){
  data <- data[which(data$Sepal.Width >= SW1),]
  data <- data[which(data$Sepal.Width <= SW2),]
  data <- data[which(data$Petal.Width >= PW1),]
  data <- data[which(data$Petal.Width <= PW2),]
  data <- data[which(data$Sepal.Length >= SL1),]
  data <- data[which(data$Sepal.Length <= SL2),]
  data <- data[which(data$Petal.Length >= PL1),]
  data <- data[which(data$Petal.Length <= PL2),]
  
  return(data)
}
