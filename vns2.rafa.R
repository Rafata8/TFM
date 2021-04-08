
vns2.rafa<-function(rafa.kbm,nIter=50,proporcion=0.8, resta=0.2, temperature=100){
  base=rafa.kbm@base
  bestkbm<-rafa.kbm
  for (i in 1:nIter){
    temp <- temperature/i
    bestBase=getBestSwap2(bestkbm, proporcion,resta,temp)
    
    ##si no mejora, reducimos vecindario
    if(all(bestBase==base)){
      proporcion=proporcion-resta
    }
    #si mejora, volvemos a vecindario grande
    else{
      base=bestBase
      ##cambiamos de kbm
      apoyokbm<-custom.base(bestkbm, base)
      bestkbm<-swap.base.kbm(bestkbm,apoyokbm)
      
      proporcion=0.9
    }
    
    if (proporcion<0){
      print('se acabaron los vecindarios')
      break
    }
  }
  return(bestkbm)
}






