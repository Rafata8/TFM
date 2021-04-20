

getBestSParallelMC<-function(rafakbm, proporcion=0.9){
  items=length.kbm(rafakbm)
  
  bestbase=rafakbm@base
  ######### esta lista tiene que tener elementos que contengan tuplas ( la base y el numero de items)
  listaBases<-list()
  listaItems<-c()
  j<-1
  b<-length(bestbase)
  
  
  
  j=(combinaciones.base(bestbase))
  
  basesComb=j$bases
  gComb=j$distanciaG
  
  
  basesComb=basesComb[gComb>((b)-1)*proporcion & gComb<= ((b)-1)*(proporcion+resta)]
  
  if(length(basesComb)<1){
    return (bestbase)
    
  }
  
  listaItems<-mclapply.hack(basesComb, function(x,b=rafakbm){
    #newBase<-basesComb[[i]]
    
    
    prueba<-custom.base(b, x)
    prueba<-swap.base.kbm(b,prueba)
    length.kbm(prueba)
  })

  
  
  ## si hay mejoras, cogemos la mejor
  if(length(listaItems)>0){
    bestbase<-listaBases[[which.min(listaItems)]]
  }
  
  
  return (bestbase)
  
}

