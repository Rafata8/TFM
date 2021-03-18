
function getBestSwap(rafaKBM, proporcion=0,9){
  items=length.kbm(rafaKBM)
  bestbase=rafa.kbm@base
  ######### esta lista tiene que tener elementos que contengan tuplas ( la base y el numero de items)
  listaBases<-list()
  listaItems<-c()
  j<-1
  for(it1 in 1:(length(b)-1)){
  
    for (it2 in (it1+1):length(b)){
      g2= (it1-1)+(it2-it1-1)+2-1
      #print (g2)
      
      if(g2>(length(b)-1)*proporcion & g2<= (length(b)-1)*(proporcion+0.2)){
        # base2=base.swap(base,it1,it2)
        # newKBM=kbm.custom.swap(rafaKBM,base2)
        # items2<-calculate.len.kbm(rafaKBM)
        newBase<-vector.swap.R(base,it1,it2)
        prueba<-custom.base(rafaKBM, newBase+1)
        prueba<-swap.base.kbm(rafaKBM,prueba)
        items2<-length.kbm(prueba)

        if(items2<items){
          #lista.add("base"=base2, "items"=items2)
          listaBases[[j]]<-newBase
          listaItems[[j]]<-items2
        }
        #g=g+1
      }
      
      
      h=h+1
    }

  }
  ## si hay mejoras, cogemos la mejor
  if(length(listaItems)>0){
    #bestbase=base(mindist(lista))
    bestbase<-listaBases[which.min(listasPos)]
  }


  return bestbase
  
}