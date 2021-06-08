
vns.rafa<-function(rafa.kbm,proporcion=0.8){
  ## inicializamos la base y la solucion
  base=rafa.kbm@base
  bestkbm<-rafa.kbm
  for (i in 1:50){
   
   #funcion que obtiene la mejor base posible del vecindario proporcionado
    bestBase=getBestSwap(bestkbm, proporcion)

    ##si no mejora, reducimos vecindario
    if(all(bestBase==base)){
      proporcion=proporcion-0.2
    }

    #si mejora, actualizamos la solucion y volvemos al primer vecindario
    else{
      base=bestBase
      apoyokbm<-custom.base(bestkbm, base)
      bestkbm<-swap.base.kbm(bestkbm,apoyokbm)
      
      proporcion=0.8
    }
    
    # sin no quedan más vecindarios, finalizar
    if (proporcion<0){
      break
    }
  }
  return(bestkbm)
  }


  
  
  
  
