
getBestSwap2<-function(rafakbm, proporcion=0.8, resta=0.2, temp){

  items=length.kbm(rafakbm)
  
  bestbase=rafakbm@base
  ######### esta lista tiene que tener elementos que contengan tuplas ( la base y el numero de items)
  listaBases<-c()
  listaItems<-100000000000
  listaBasesMala<-c()
  listaItemsMala<-100000000000

  b<-length(bestbase)
  j=(combinaciones.base(bestbase))
  long=length(j$distanciaG)
  indicesBasesProbar=sample(1:long,as.integer(long/2))


  
  basesComb=j$bases[indicesBasesProbar]
  gComb=j$distanciaG[indicesBasesProbar]
  

  basesComb=basesComb[gComb>((b)-1)*proporcion & gComb<= ((b)-1)*(proporcion+resta)]

  if(length(basesComb)<1){
    return (bestbase)
    
  }

  for( i in range(length(basesComb))){

        newBase<-basesComb[[i]]


        prueba<-custom.base(rafakbm, newBase)
        prueba<-swap.base.kbm(rafakbm,prueba)
        items2<-length.kbm(prueba)
        
        
        if(items2<items & items2<listaItems){
    
          listaBases<-newBase
          listaItems<-items2
          #j=j+1
        }
        else if(length(listaBases)<1 & items2<listaItemsMala){
          
          listaBasesMala<-newBase
          listaItemsMala<-items2
          #jMalo=jMalo+1
          
        }
        #g=g+1
      #}
      
      
      #h=h+1
    
    
  }
  ## si hay mejoras, cogemos la mejor
  if(length(listaBases)>0){
    bestbase<-listaBases
  }
  
  else if (length(listaBasesMala)>0){

    mejorPeorBase<-listaBasesMala
    items2=listaItemsMala
    prob<-exp(-(items2-items)/temp)
    if(prob>=runif(1, 0, 1)){
      
      bestkbm<-prueba
      items<-items2
      bestbase<-newBase
    }
  }
  
  
  return (bestbase)
  
}
