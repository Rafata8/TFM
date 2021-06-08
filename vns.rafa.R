vns.rafa<-function(rafa.kbm,proporcionIni=0.8, resta=0.2){
  ## inicializamos la base y la solucion
  proporcion=proporcionIni
  base=rafa.kbm@base
  bestkbm<-rafa.kbm
  for (i in 1:50){
   
   #funcion que obtiene la mejor base posible del vecindario proporcionado
    bestBase=getBestSwap(bestkbm, proporcion)

    ##si no mejora, reducimos vecindario
    if(all(bestBase==base)){
      proporcion=proporcion-resta
    }

    #si mejora, actualizamos la solucion y volvemos al primer vecindario
    else{
      base=bestBase
      apoyokbm<-custom.base(bestkbm, base)
      bestkbm<-swap.base.kbm(bestkbm,apoyokbm)
      
      proporcion=proporcionIni
    }
    
    # sin no quedan más vecindarios, finalizar
    if (proporcion<0){
      break
    }
  }
  return(bestkbm)
  }


  
  
  
  
