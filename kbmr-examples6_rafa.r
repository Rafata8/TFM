
inst.kbm <- random.kbm( rl=c("D1","D2"), rcl=c(2,2), al=c("A1","A2","A3","A4","A5","A6","A7","A8"), acl=c(2,2,2,2,2,2,2,2), n=8)
print(inst.kbm, MODE="O")
y<-random.base(inst.kbm)
system.time({
  a<-swap.base.kbm(x = inst.kbm, new.x = y)
})


###################### prueba VNSSSSSSSSSS
inst.kbm <- random.kbm( rl=c("D1","D2"), rcl=c(2,2), al=c("A1","A2","A3","A4","A5","A6","A7"), acl=c(2,2,2,2,2,2,2), n=8)
print(inst.kbm, MODE="O")
y<-random.base(inst.kbm)
#prueba<-swap.base.kbm(inst.kbm,y)
a<-swap.base.kbm(x = inst.kbm, new.x = y)
#prueba<-custom.base(inst.kbm,y@base+1)
print(a, MODE="O")
system.time({
  sol<-vns.rafa(a)
})


print(sol, MODE="O")





  ################# prueba aneealingggggg
inst.kbm <- random.kbm( rl=c("D1","D2"), rcl=c(2,2), al=c("A1","A2","A3","A4","A5","A6","A7"), acl=c(2,2,2,2,2,2,2), n=8)
print(inst.kbm, MODE="O")
y<-random.base(inst.kbm)
#prueba<-swap.base.kbm(inst.kbm,y)
a<-swap.base.kbm(x = inst.kbm, new.x = y)
#prueba<-custom.base(inst.kbm,y@base+1)
print(a, MODE="O")
simulado<-simulated_annealing(a,50)
print(simulado, MODE="O")

system.time({
  simulado<-simulated_annealing(a,150)
})



############ pruebas mezcla annealing-vns
inst.kbm <- random.kbm( rl=c("D1","D2"), rcl=c(2,2), al=c("A1","A2","A3","A4","A5","A6","A7"), acl=c(2,2,2,2,2,2,2), n=8)
print(inst.kbm, MODE="O")
y<-random.base(inst.kbm)
#prueba<-swap.base.kbm(inst.kbm,y)
a<-swap.base.kbm(x = inst.kbm, new.x = y)
#prueba<-custom.base(inst.kbm,y@base+1)
print(a, MODE="O")
sol2<-vns2.rafa(a)
print(sol2, MODE="O")

system.time({
  simulado<-vns2.rafa(a)
})
print(simulado, MODE="O")




############ pruebas parallel vns
inst.kbm <- random.kbm( rl=c("D1","D2"), rcl=c(2,2), al=c("A1","A2","A3","A4","A5","A6","A7"), acl=c(2,2,2,2,2,2,2), n=8)
print(inst.kbm, MODE="O")
y<-random.base(inst.kbm)
#prueba<-swap.base.kbm(inst.kbm,y)
a<-swap.base.kbm(x = inst.kbm, new.x = y)
#prueba<-custom.base(inst.kbm,y@base+1)
print(a, MODE="O")
system.time({
  sol2<-vnsPar.rafa(a)
})


######################### pruebas VNS Switches

inst.kbm <- random.kbm( rl=c("D1","D2"), rcl=c(2,2), al=c("A1","A2","A3","A4","A5","A6","A7"), acl=c(2,2,2,2,2,2,2), n=8)
print(inst.kbm, MODE="O")
y<-random.base(inst.kbm)
print(y@base)
#prueba<-swap.base.kbm(inst.kbm,y)
a<-swap.base.kbm(x = inst.kbm, new.x = y)
#prueba<-custom.base(inst.kbm,y@base+1)
print(a, MODE="O")
system.time({
  sol<-vns.switch(a)
})



print(sol, MODE="O")


######################### pruebas VNS multistart Switches
system.time({
  sol2<-multiSwitch(a)
})

print(sol2, MODE="O")
print(a)



######################### pruebas medical
inst.kbm <- df.kbm( att=10, res=1, file="./Datos/medical-v10.csv", data=TRUE, tab="csv")
prenron.kbm <- df.kbm( att=1001, res=53, file="models/enron.csv", data=TRUE,tab="csv", CASES=270)##!!!


readfile1 <- read.csv("./Datos/medical-v10.csv")
readfile2 <- read.csv("./models/enron.csv")


inst.kbm <- df.kbm( df, att=3, res=2, data=FALSE)
