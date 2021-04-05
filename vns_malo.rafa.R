vns_malo.rafa<- function(x,expected){
  ##parametro cual esperamos que sea el tamaño maximo de lista
  expected=1
  
  #longitud actual
  bestLength<-length.kbm(x)
  
  #bucle, cuantas veces queremos mejorar
  for(i in range(1:10)){
    #cogemos las bases con distG=2
    info<- combinaciones.base(x@base)
    bases<-info[[1]]
    distG<-info[[2]]
    
    ##quiero añadir: si estamos muuyyyyyyyyyyy alejados, coger base random
    
    ##################

    #si bastante alejados
    #   cogemos maximas distancias, comprobamos cual nos da menor length kbm y si es menor actualizamos
    if(length.kbm(x)>=expected*13){
      maximaD<-maxDistG
      maximos<-which(distG==max(distG))
      #maximos2<-which(distG==(max(distG)-1))
      listasPos<-c()
      #comprobamos todas las length
      ######## a partir de aqui esta todo mal
      for (i in range(1:length(maximos))){
        prueba<-custom.base(x, bases[[maximos[i]]]+1)
        prueba<-swap.base.kbm(x,prueba)
        long<-length.kbm(prueba)
        listasPos<-c(listasPos,long)
      }
      #cogemos la menor, y si es menor que la actual, actualizamos
      if(min(listasPos)<bestLength){
        bestLength<-min(listasPos)
        indice<-maximos[which.min(listasPos)]
        baseSwap<-bases[indice]
        # asctualizamos
        swap<-custom.base(x,baseSwap+1)
        x<-swap.base.kbm(rafa.kbm,prueba)
      }
      
      
    }
    
  }
  
  return(which.min(distG))
  
  
  
}
