getSpecialValues <- function(data,Var1,Var2){
  # Calculate the true minima and maxima
  minXValue  <- min(data[,Var1])
  minYValue  <- min(data[,Var2])
  maxXValue  <- max(data[,Var1])
  maxYValue  <- max(data[,Var2])
  
  # Return these values
  return(list(minXValue, minYValue, maxXValue, maxYValue))
}
