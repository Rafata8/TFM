
getBestSwap<-function(rafakbm, proporcion=0.9){
  items=length.kbm(rafakbm)
  print("empieza")
  print(items)
  bestbase=rafakbm@base
  ######### esta lista tiene que tener elementos que contengan tuplas ( la base y el numero de items)
  listaBases<-list()
  listaItems<-c()
  j<-1
  b<-length(bestbase)
  for(it1 in 1:((b)-1)){
  
    for (it2 in (it1+1):length(b)){
      g2= (it1-1)+(it2-it1-1)+2-1
      print (it1)
      print(it2)
      
      if(g2>(length(b)-1)*proporcion & g2<= (length(b)-1)*(proporcion+0.2)){
        # base2=base.swap(base,it1,it2)
        # newKBM=kbm.custom.swap(rafakbm,base2)
        # items2<-calculate.len.kbm(rafakbm)
        newBase<-vector.swap.R(base,it1,it2)
        prueba<-custom.base(rafakbm, newBase+1)
        prueba<-swap.base.kbm(rafakbm,prueba)
        items2<-length.kbm(prueba)
        #print(items2)

        if(items2<items){
          #lista.add("base"=base2, "items"=items2)
          listaBases[[j]]<-newBase
          listaItems[[j]]<-items2
        }
        #g=g+1
      }
      
      
      #h=h+1
    }

  }
  ## si hay mejoras, cogemos la mejor
  if(length(listaItems)>0){
    #bestbase=base(mindist(lista))
    bestbase<-listaBases[which.min(listasPos)]
  }


  return (bestbase)
  
}
