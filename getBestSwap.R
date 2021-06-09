getBestSwap<-function(rafakbm, proporcion=0.8, resta=0.2){
  ## se inicializan los items iniciales y la solucion actual como la base inicial
  items=length.kbm(rafakbm)
  bestbase=rafakbm@base

  ## listas donde se almacenan las bases que produzcan mejoras
  ## en lista bases se almacena la base, y en la otra lista se almacena el número de items de laKBM2L asociado a esa lista
  listaBases<-list()
  listaItems<-c()

  j<-1
  b<-length(bestbase)

  ## doble bucle para iterar por todos los posibles cambios de base con H=2
  for(it1 in 1:((b)-1)){
      for (it2 in (it1+1):(b)){

      ## calculamos la distancia G según la fórmula
      g2= (it1-1)+(it2-it1-1)+2-1

      ## filtramos las que estén dentro del vecindario
      if(g2>((b)-1)*proporcion & g2<= ((b)-1)*(proporcion + resta)){

        ## calculamos los items de la KBM2L con la nueva base
        newBase<-vector.swap(bestbase,it1,it2)
        prueba<-custom.base(rafakbm, newBase)
        prueba<-swap.base.kbm(rafakbm,prueba)
        items2<-length.kbm(prueba)

        ## comprobamos si se ha producido una mejora
        if(items2<items){

          ## si es así, lo añadimos a la lista
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

  ## si no hay mejoras, se devuelve la base inicial
  return (bestbase)
  
}
