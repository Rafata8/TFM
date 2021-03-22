library(binaryLogic)
library(dplyr)
library(tidyr)
createCKBM <-function(nAtrib,nDecis){
  
  ### primero los atributos
  longitud=2^nAtrib
  columnas=c()
  for (i in 1:(nAtrib)){
    columnas=c(columnas,paste("A",i,sep=""))
    
  }
    
  
  
  
  df <- data.frame(x=rep(NA, 1),  # as many cols as you need
                   stringsAsFactors=FALSE)     
  
  for (i in 0:(longitud-1)){
    bin=as.binary(i,n=nAtrib)
    df[i+1, ] <- toString(bin)

  }
  df <-df %>% separate(x, columnas,sep=",")
  
  
  ###ahora el offset
  offset<-c(1:longitud)
  df<-cbind(offset = offset, df)
  
  
  
  ##### y la decision (bastante parecido a atributos)
  decisiones=i:nDecis
  tramo=as.integer(longitud/nDecis)
  decisiones=c()
  
  n=length(as.binary(nDecis-1))
  for (i in 1:(nDecis-1)){
    dec=as.binary(i-1,n=n)
    decisiones=c(decisiones,rep(toString(dec),tramo))
  }
  #print(decisiones)
  dec=as.binary(nDecis-1,n=n)
  decisiones=c(decisiones,rep(toString(dec),longitud-tramo*(nDecis-1)))
  #print(decisiones)
  
  #creamos las columnas de decision
  columnasD=c()
  for (i in 1:(n)){
    columnasD=c(columnasD,paste("D",i,sep=""))
    
  }
  
  df['D']=decisiones
  
  df <-df %>% separate(D, columnasD,sep=",")
  
  
  #### meassure
  med<-rep(0.3,longitud)
  df['Meassure']<-med
  
  
  df<-as.data.frame(sapply(df,as.numeric))
  
  
  return (df)

}
