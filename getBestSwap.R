
getBestSwap<-function(rafakbm, proporcion=0.9){
  items=length.kbm(rafakbm)

  bestbase=rafakbm@base
  ######### esta lista tiene que tener elementos que contengan tuplas ( la base y el numero de items)
  listaBases<-list()
  listaItems<-c()
  j<-1
  b<-length(bestbase)
  for(it1 in 1:((b)-1)){
  
    for (it2 in (it1+1):(b)){
      g2= (it1-1)+(it2-it1-1)+2-1

      
      if(g2>((b)-1)*proporcion & g2<= ((b)-1)*(proporcion+0.2)){
        # base2=base.swap(base,it1,it2)
        # newKBM=kbm.custom.swap(rafakbm,base2)
        # items2<-calculate.len.kbm(rafakbm)
        newBase<-vector.swap(bestbase,it1,it2)
        prueba<-custom.base(rafakbm, newBase)
        prueba<-swap.base.kbm(rafakbm,prueba)
        items2<-length.kbm(prueba)


        if(items2<items){
          #lista.add("base"=base2, "items"=items2)
          listaBases[[j]]<-newBase
          listaItems[[j]]<-items2
          j=j+1
        }
        #g=g+1
      }
      
      
      #h=h+1
    }

  }
  ## si hay mejoras, cogemos la mejor
  if(length(listaItems)>0){
    bestbase<-listaBases[[which.min(listaItems)]]
  }


  return (bestbase)
  
}
