###   ###
## kbmR ##
###   ###

# source("kbmR-prj.R")


  rm(list=ls(all=TRUE))

library( gmp) # bigz
#library( gat)
library( lattice)
library( foreach)
library( cluster)
library(MASS)
  library(parallel)

#### module ####
setwd("./defs")
source("kbmr-definition.R")
setwd("..")

#### module ####
setwd("./tabs")
source("kbmr-inout.R")
#source("kbmr-spectrum.R")
setwd("..")

#### module ####
setwd("./optalg")
source("kbmr-optimization.R")
setwd("..")

#### module ####
setwd("./query")
#source("kbmr-queries.R")
#source("kbmr-explanation.R")
setwd("..")

#### module RAFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ####
setwd("./Rafa")
source("custom.base.R")
source("vector.swap.R")
source("combinaciones.base.R")
source("getBestSwap.R")
source("vns.rafa.R")
source("getBestSwap2.R")
source("vns2.rafa.R")
source("vnsPar.rafa.R")
source("mclapply.hack.R")
source("getBestSParallelMC.R")

setwd("..")

### models, kbmr.demo()
setwd("./models")
cat("Models source reading:\n")
#source("kbmr-demo1.R")
#source("kbmr-demo2.R")

#source("kbmr-examples1.R")
#source("kbmr-examples2.R")
#source("kbmr-examples3.R")
#source("kbmr-examples4.R")
#source("kbmr-examples5.R")
#source("kbmr-examples6.R")
#source("kbmr-examples7.R")

cat("Models source OK.\n")
setwd("..")
  
