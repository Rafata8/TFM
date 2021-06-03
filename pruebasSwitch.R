x=a
indices<-x@Index
respuestas<-x@Response
base<-x@base
bestbase<-base
items<-length(respuestas)
indices_t<-t(indices)

m <- cbind(indices_t, respuestas)
newBase<-c(0,1,2,3,4,5,6)
#newBase2<-c(newBase,length(newBase))
base2=c(base,length(base))
#b=m
base
b<-m[,(newBase2+1)]
newBase=c(4,6,3,2,1,0,5)


nueva<-m[,(baseConvertida+1)]

nueva<-nueva[do.call(order, lapply(1:NCOL(nueva), function(i) nueva[, i])), ]


m[ , c(1,2)]  <- m[ , c(2,1)]





getConvertedBase<-function(elemento,base1){
  return (which(base1 == elemento)-1)
}


baseConvertida=sapply(newBase,getConvertedBase,base1=base)
baseConvertida=c(baseConvertida,length(baseConvertida))



