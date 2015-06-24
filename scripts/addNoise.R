addNoise <- function(data, Var1, Var2,specialValues){
  # Add the noise
  data[,Var1] <- data[,Var1] + jitter(rep(0,dim(data)[1]))
  data[,Var2] <- data[,Var2] + jitter(rep(0,dim(data)[1]))
  
  # make sure the boundaries stay the same
  data[,Var1] <- ifelse(data[,Var1] < specialValues[[1]], specialValues[[1]], data[,Var1])
  data[,Var1] <- ifelse(data[,Var1] > specialValues[[3]], specialValues[[3]], data[,Var1])
  data[,Var2] <- ifelse(data[,Var2] < specialValues[[2]], specialValues[[2]], data[,Var2])
  data[,Var2] <- ifelse(data[,Var2] > specialValues[[4]], specialValues[[4]], data[,Var2])
  
  return(data)
}
