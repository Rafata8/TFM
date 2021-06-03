

switch.kbm<- function(x,proporcion=0.9){
  indices<-x@Index
  respuestas<-x@Response
  base<-x@base
  bestbase<-base
  items<-length(respuestas)

  
  listaBases<-list()
  listaItems<-c()
  j<-1
  b<-length(bestbase)
  for(it1 in 1:((b)-1)){
    
    for (it2 in (it1+1):(b)){
      g2= (it1-1)+(it2-it1-1)+2-1
      
      
      if(g2>((b)-1)*proporcion & g2<= ((b)-1)*(proporcion+0.2)){
        newBase<-vector.swap(bestbase,it1,it2)
        #newBase<-c(0,1,2,3,4,5,6)
        
        ######################hasta aqui todo como siempre
        
        
        # transformacion en la base para cambiar las columnas que queremos
        baseConvertida=sapply(newBase,getConvertedBase,base1=bestbase)
        baseConvertida=c(baseConvertida,length(baseConvertida))
        
        
        # ahora cogemos los switches, solo los indices, añadimos la respuesta
        # transponemos los indices
        indices_t<-t(indices)
        #añadimos respuesta
        m <- cbind(indices_t, respuestas)
        #ordenamos los indices
        nueva<-m[,(baseConvertida+1)]
        nueva<-nueva[do.call(order, lapply(1:NCOL(nueva), function(i) nueva[, i])), ]
        #calculamos los switches
        items2<-getSwitches(nueva)
   
        
        if(items2<items){
          #lista.add("base"=base2, "items"=items2)
          listaBases[[j]]<-newBase
          listaItems[[j]]<-items2
          j=j+1
        }


      }
      

    }
    
  }
  ## si hay mejoras, cogemos la mejor
  if(length(listaItems)>0){
    bestbase<-listaBases[[which.min(listaItems)]]
  }

  
  return (bestbase)
  

}


getConvertedBase<-function(elemento,base1){
  return (which(base1 == elemento)-1)
}
