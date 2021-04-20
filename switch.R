x <- random.kbm(rl=c("D1","D2"), rcl=c(2,2), al=c("A1","A2","A3","A4","A5","A6","A7"), acl=c(3,3,2,2,2,2,2), n=8)
indices<-x@Index
respuestas<-x@Response
base<-x@base
base
newBase<-c(1,0,2,3,4,5,6)

indices[ , base]  <- indices[ , newBase]
indices
print(x, MODE="I")


items <- min( 0, length( x@Response))
items

logoffset=FALSE
str.out <- "\nkbm.index mode:\n"
for( i in 1:items) 
  str.out <- paste( str.out, paste( i, " <",  interpretation.index( x@AttributeCardinalList, x@AttributeDomainList, x@Index[,i], roundbrackets=TRUE), ", ", 
                                    interpretation.index( x@ResponseCardinalList, x@ResponseDomainList, offset.inv( x@WeightsResponse, x@Response[i]), roundbrackets=TRUE), ", ", 
                                    x@Meassure[i], "| ", if (i==1) x@OffSet[i]+1 else x@OffSet[i]-x@OffSet[i-1], "\n", sep=""), sep="") 


interpretation.index( x@AttributeCardinalList, x@AttributeDomainList, x@Index[,i], roundbrackets=TRUE)
