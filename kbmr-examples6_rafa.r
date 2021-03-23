###   ###
## kbmR examples ##
###   ###

## non-empty
inst.kbm <- kbm( ResponseList.=c("D1","D2"), ResponseCardinalList.=c(2,2), ResponseDomainList.=c("d1a","d1b","d2a","d2b"), 
AttributeList.=c("A1","A2","A3"), AttributeCardinalList.=c(2,3,4), AttributeDomainList.=c("a1a","a1b","a2a","a2b","a2c","a3a","a3b","a3c","a3d"), 
base.=c(0,1,2), xbase.=c(0,1,0,1,2,0,1,2,3),
Kbm.OffSet=c(as.bigz(4),as.bigz(5),as.bigz(15),max.offset( c(2,3,4))), Kbm.Response=as.bigz( c(3,0,1,2)), Kbm.Meassure=c(0.75,.5,0.25,0.15)) 
print(inst.kbm, MODE="O")
print(inst.kbm, MODE="I")

## kbm & df
df <- kbm.df( inst.kbm, file="kbm1.txt")## write
#print(df)
inst.kbm <- df.kbm( df, att=3, res=2, data=FALSE)## read
#print(inst.kbm)
#df<-kbm.df( inst.kbm, file="kbm1.txt")## write
#print(df)

#inst.kbm <- df.kbm( df, att=103, res=14, file="yeast.csv", data=TRUE, tab="csv")##!!!
#print(inst.kbm)

racingTIME0 <- proc.time()###------------------------------------------------------------------------------------------------------------------------------------------
enron.kbm <- df.kbm( att=1001, res=53, file="models/enron.csv", data=TRUE, Obs.Var=TRUE, tab="csv", CASES=270, pam.att=36)##!!!
#show(enron.kbm@Response)
cat("\n tpo :::", (proc.time() - racingTIME0)[3], "\n")###---------------------------------------------------------------------------------------------------
print(enron.kbm)
print(enron.kbm@AttributeDomainList)
print(enron.kbm@ResponseDomainList)
#print(enron.kbm, MODE="I")
cat("KB/enron.kbm: ",KB(enron.kbm),"\n")
#print(table( as.numeric(enron.kbm@Response)))
#plot( enron.kbm@Response)
#kbm.df( enron.kbm, file="enron-inibase.kbm", kbm=TRUE)
cat("SwichtXX/enron.kbm: ",SwichtXX( enron.kbm),"\n")
cat("SwichtXY/enron.kbm: ",SwichtXY( enron.kbm),"\n")
#enron.kbm <- df.kbm( att=1001+1, res=53, file="enron-inibase.kbm", data=FALSE, tab="tab")##!!!

racingTIME0 <- proc.time()###------------------------------------------------------------------------------------------------------------------------------------------
z <- min.kbm( enron.kbm, optmode="s", chk=FALSE)
print(z, MODE="O")
cat("SwichtXY/z: ",SwichtXY( z),"\n")
cat("\n tpo :::", (proc.time() - racingTIME0)[3], "\n")###---------------------------------------------------------------------------------------------------
#z <- min.kbm( enron.kbm, optmode="l", chk=FALSE)
#print(z, MODE="O")
#print(SwichtXY( enron.kbm))

#inst.kbm <- df.kbm( att=1449, res=45, file="medical.csv", data=TRUE, tab="csv")##!!!
#print(inst.kbm)


inst.kbm <- random.kbm( rl=c("D1","D2"), rcl=c(2,2), al=c("A1","A2","A3","A4","A5","A6","A7"), acl=c(2,2,2,2,2,2,2), n=8)
print(inst.kbm, MODE="O")
y<-random.base(inst.kbm)
#prueba<-swap.base.kbm(inst.kbm,y)
a<-swap.base.kbm(x = inst.kbm, new.x = y)
#prueba<-custom.base(inst.kbm,y@base+1)
print(a, MODE="O")

sol<-vns.rafa(a)

print(sol, MODE="O")
