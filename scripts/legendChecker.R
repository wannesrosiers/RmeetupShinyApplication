legendChecker <- function(X,Y){
  if (X > 4.05 & X < 4.23){
    if (Y < 7.26 & Y > 7.14){
      result <- "virginica"
    } else if (Y < 7.49 & Y > 7.37){
      result <- "versicolor"
    } else if (Y < 7.70 & Y > 7.58){
      result <- "setosa"
    } else {
      result <- NULL
    }
  } else {
    result <- NULL
  }
  
  return(result)
}
