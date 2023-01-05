# DO intersect
options(scipen = 50)
# set window
setwd("D:/Final-R/750GO")

# library packages
library(dplyr)
library(tidyr)

# read data
ypdo <- read.delim("yphigh_do.txt",header = F)
zz2do <- read.delim("zz2high_do.txt",header = F)
dxdo <- read.delim("dxhigh_do.txt",header = F)
blddo <- read.delim("bldhigh_do.txt",header = F)
zz1do <- read.delim("zz1high_do.txt",header = F)
hzdo <- read.delim("hzhigh_do.txt",header = F)

# intersect
samedo <- Reduce(intersect,list(ypdo,zz2do,dxdo,blddo,zz1do,hzdo))

# unique
ypuniq <- Reduce(setdiff,list(ypdo,zz2do,dxdo,blddo,zz1do,hzdo))
zz2uniq <- Reduce(setdiff,list(zz2do,ypdo,dxdo,blddo,zz1do,hzdo))
dxuniq <- Reduce(setdiff,list(dxdo,zz2do,ypdo,blddo,zz1do,hzdo))
blduniq <- Reduce(setdiff,list(blddo,dxdo,zz2do,ypdo,zz1do,hzdo))
zz1uniq <- Reduce(setdiff,list(zz1do,dxdo,zz2do,ypdo,blddo,hzdo))
hzuniq <- Reduce(setdiff,list(hzdo,dxdo,zz2do,ypdo,blddo,zz1do))
