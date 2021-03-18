proporcion=0.8
rafa.kbm
base=rafa.kbm@base
contadorPeq=0
for (i in 1:50){
  bestBase=getBestSwap(rafa.kbm, proporcion)
  
  ##si no mejora, reducimos vecindario
  if(bestBase==base){
    proporcion=proporcion-0.2
  }
  #si mejora, volvemos a vecindario grande
  else{
    base=bestBase
    proporcion=0.8
  }
  
  if (proporcion<0){
    break
  }
}


  
  
  
  
