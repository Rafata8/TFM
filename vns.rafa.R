
vns.rafa<-function(rafa.kbm,proporcion=0.8){
  base=rafa.kbm@base
  bestkbm<-rafa.kbm
  for (i in 1:50){
   
    bestBase=getBestSwap(bestkbm, proporcion)
    
    ##si no mejora, reducimos vecindario
    if(all(bestBase==base)){
      proporcion=proporcion-0.2
    }
    #si mejora, volvemos a vecindario grande
    else{
      base=bestBase
      ##cambiamos de kbm
      apoyokbm<-custom.base(bestkbm, base)
      bestkbm<-swap.base.kbm(bestkbm,apoyokbm)
      
      proporcion=0.8
    }
    
    if (proporcion<0){
      break
    }
  }
  return(bestkbm)
  }


  
  
  
  
