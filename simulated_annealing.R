simulated_annealing <- function(rafakbm,nIter,temperature=400){

  bestbase=rafakbm@base
  bestkbm<-rafakbm
  items=length.kbm(rafakbm)
  
  
  for (i in 1:nIter){
    temp <- temperature/nIter
    # cogemos combinacion al azar
    combinaciones<-combinaciones.base(bestbase)
    bases<-combinaciones$base
    newBase<-sample(bases, 1)
    #y lo hacemos kbm y comparamos numero de items
    prueba<-custom.base(rafakbm, newBase)
    prueba<-swap.base.kbm(rafakbm,prueba)
    items2<-length.kbm(prueba)
    
    # si es menor, lo cambiamos
    if(items2<items){
      bestkbm<-prueba
      items<-items2
      bestbase<-newBase
    }
    #si es peor, hay probabilidad de cambiarlo
    else{
      prob<-e^(-(items2-items)/temp)
      if(prob>=runif(1, 0, 1)){
        bestkbm<-prueba
        items<-items2
        bestbase<-newBase
      }
    }

  }
  
  return(bestkbm)

}
