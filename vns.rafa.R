
vns.rafa<-function(rafa.kbm,proporcion=0.8){
for (i in 1:50){
  base=rafa.kbm@base
  bestBase=getBestSwap(rafa.kbm, proporcion)
  
  ##si no mejora, reducimos vecindario
  if(all(bestBase==base)){
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
  return(base)
  }


  
  
  
  
