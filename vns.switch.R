vns.switch<-function(rafa.kbm,proporcion=0.8){
  base=rafa.kbm@base
  bestkbm<-rafa.kbm
  for (i in 1:50){
    
    bestBase=switch.kbm(bestkbm, proporcion)
    
    ##si no mejora, reducimos vecindario
    if(all(bestBase==base)){
      proporcion=proporcion-0.2
    }
    #si mejora, volvemos a vecindario grande
    else{
      ##cambiamos de kbm
      apoyokbm<-custom.base(bestkbm, bestBase)
      nuevokbm<-swap.base.kbm(bestkbm,apoyokbm)

      
      if(length.kbm(nuevokbm)<length.kbm(bestkbm)){
        bestkbm<-nuevokbm
        base=bestBase
        proporcion=0.8

      }
      else{

        proporcion=proporcion-0.2
      }
      
      
    }
    
    if (proporcion<0){
      break
    }
  }
  return(bestkbm)
}
