calculateClosestPoint <- function(data, Var1, Var2, x, y){
  for (i in 1:dim(data)[1]){
    data[i,"distance"]   <- euclideanDistance(c(data[i,Var1],data[i,Var2]),c(x,y))
  }
  minimalDistance <- min(data$distance)
  closestPoint    <- which(data$distance == minimalDistance)[1]
  closestSpecies  <- data[closestPoint,"Species"]
  
  return(list(minimalDistance,closestPoint,closestSpecies))
}
