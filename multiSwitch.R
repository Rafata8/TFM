multiSwitch<- function(inst.kbm, comienzos=6){

  
  listaBases<-list()
  listaItems<-c()
  #print(inst.kbm)
  
  for (i in 1:comienzos){
 
    y<-random.base(inst.kbm)
    listaBases[[i]]<-y@base
    #print(y@base)
  }
   #print(listaBases)
  
  for(i in 1:length(listaBases)){
    apoyokbm<-custom.base(inst.kbm, listaBases[[i]])
    a<-swap.base.kbm(x = inst.kbm, new.x = apoyokbm)
    a<-vns.switch(a)
    listaBases[[i]]<-a@base
    listaItems[[i]]<-length.kbm(a)
  }
  
  

  bestBase<-listaBases[[which.min(listaItems)]]
  apoyokbm<-custom.base(inst.kbm, bestBase)
  final<-swap.base.kbm(x = inst.kbm, new.x = apoyokbm)

  
  
  return (final)
}