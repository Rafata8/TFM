

getSwitches<-function(matriz){
  col=matriz[,ncol(matriz)]

  switches=0
  for (i in 1:length(col)){
    if(i==1){
      switches=1
    }
    else{
      if(col[i]!=col[i-1]){
        switches=switches+1
      }
      
    }
  }
  return (switches)
}
