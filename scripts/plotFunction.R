plotFunction <- function(data, Var1, Var2, closestInfo,boundaries,
                         legend,species,colors, legendVar){
  
  # While not hovering or to far from a point, show the normal plot
  if (!is.null(legendVar)){
    subdata <- data[which(data$Species == legendVar),]
    plot(subdata[,Var1],subdata[,Var2],
         xlim = c(boundaries[[1]],boundaries[[3]]),
         ylim = c(boundaries[[2]],boundaries[[4]]),
         xlab = Var1,
         ylab = Var2,
         col = colors[subdata$Species],
         frame.plot = FALSE)
    
  } else if (closestInfo[[1]] > 0.1){
    plot(data[,Var1],data[,Var2],
         xlim = c(boundaries[[1]],boundaries[[3]]),
         ylim = c(boundaries[[2]],boundaries[[4]]),
         xlab = Var1,
         ylab = Var2,
         col = colors[data$Species],
         frame.plot = FALSE)
    
    # enlarge the point
  } else {
    # Plot the entire frame
    plot(data[-closestInfo[[2]],Var1],data[-closestInfo[[2]],Var2],
         xlim = c(boundaries[[1]],boundaries[[3]]),
         ylim = c(boundaries[[2]],boundaries[[4]]),
         xlab = Var1,
         ylab = Var2,
         col = colors[data[-closestInfo[[2]],]$Species],
         frame.plot = FALSE)
    
    # Replot the point
    points(data[closestInfo[[2]],Var1],data[closestInfo[[2]],Var2],
           col = "black",
           pch = 13, cex = 3)
  }
  if (legend == TRUE){
    if (!is.null(legendVar) | closestInfo[[1]] > 0.1){
      legend(x = 4.05, y = 8.05, xpd = TRUE, bty = "n", 
             legend=species, pch = "-", lwd = 3,
             col=colors, title="Specie")
    } else {
      if (closestInfo[[3]] == "setosa"){
        shapes <- c(13,1,1)
        sizes  <- c(3,1,1)
      } else if (closestInfo[[3]] == "versicolor"){
        shapes <- c(1,13,1)
        sizes  <- c(1,3,1)
      } else {
        shapes <- c(1,1,13)
        sizes  <- c(1,1,3)
      }
      legend(x = 4.05, y = 8.05, xpd = TRUE, bty = "n", 
             legend=species, pch = shapes, pt.cex = sizes,
             col=colors, title="Species")
    }
  }
}
