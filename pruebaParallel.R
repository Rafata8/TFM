registerDoParallel(8)
library(foreach)
library(doParallel)

rafakbm <- random.kbm( rl=c("D1","D2"), rcl=c(2,2), al=c("A1","A2","A3","A4","A5","A6","A7"), acl=c(2,2,2,2,2,2,2), n=8)
bestbase<-rafakbm@base
j=(combinaciones.base(bestbase))

basesComb=j$bases
gComb=j$distanciaG
a<-foreach (i=1:length(gComb), .combine=rbind,.packages=c('gmp','kbmr-definition'),
            ) %dopar% {


  newBase<-basesComb[[i]]

  
  prueba<-custom.base(rafakbm, newBase)
  prueba<-swap.base.kbm(rafakbm,prueba)
  length.kbm(prueba)
}


getItems<- function(newBase,rafakbm){
  #newBase<-basesComb[[i]]
  
  
  prueba<-custom.base(rafakbm, newBase)
  prueba<-swap.base.kbm(rafakbm,prueba)
  length.kbm(prueba)
}

numCores <- detectCores()
results <- mclapply(basesComb, getItems, mc.cores = numCores)



library(parallel)
cl <- makeCluster(getOption("cl.cores", 4))
l <- list(1, 2)

c<-  parLapply(cl, basesComb, function(newBase,rafakbm){
  #newBase<-basesComb[[i]]
  
  
  prueba<-custom.base(rafakbm, newBase)
  prueba<-swap.base.kbm(rafakbm,prueba)
  length.kbm(prueba)
})



#user  system elapsed 
#0       0      10 

stopCluster(cl)


a



c
