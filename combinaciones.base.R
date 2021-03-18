##devuelve todas las combinaciones de distancia hamming 2, y devuelve tambien la distancia G
combinaciones.base<- function(base,orden=1,distanciaH=2){
  lbas<-length(base)
  j<-1
  listaBases<-list()
  listaDisG<-c()
  if(orden==1){
    for(it1 in 1:(lbas-1)){
      for(it2 in (it1+1):(lbas)){
        listaBases[[j]]<-vector.swap.R(base,it1,it2)
        #dis G= Rleft +(sum(huecos entre medias+hamming -1))= (i-1)+(j-i-1)+2-1
        #listaDisG[[j]]<- (it1-1)+(it2-it1-1)+2-1
        listaDisG<-c(listaDisG,(it1-1)+(it2-it1-1)+2-1)
        j<-j+1 
      }
    }
  }
  else{
    for(it1 in lbas:2){
      for(it2 in (it1-1):1){
        listaBases[[j]]<-vector.swap(base,it1,it2)
        #dis G= Rleft +(sum(huecos entre medias+hamming -1))= (i-1)+(j-i-1)+2-1
        listaDisG[[j]]<- (it1-1)+(it1-it2-1)+2-1
        j<-j+1 
      }
    }
  }
  result<-list("bases"= listaBases, "distanciaG"= listaDisG)
  return(result)
  
}
