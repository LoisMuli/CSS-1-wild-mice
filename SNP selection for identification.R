# strain identification
options(scipen = 50)
# set window
setwd("D:/Final-R/750GO")

# library packages
library(dplyr)
library(tidyr)

# read data

## 758
bldidan <- read.delim("758idtop50.txt")[,-c(1,13,14,25,26,27,31:38)]
bldidpos <- separate(bldidan,Location,c("Location","POS"),sep = "-")
bldidpos$posb <- as.numeric(cut(as.numeric(bldidpos$POS),breaks = 30))
bldidpos <- bldidpos[,c(26,1:25)]
# Select SNPs to keep (sorted by precedence level)
bldidfin <- bldidpos[c(1,2,7,9,11,12,29,37,44,50,51,52,57,61,75,99,111,120,131,140,144,156),]
write.csv(bldidfin,"758idlist.csv")

## 750
ypidan <- read.delim("750top50test.txt")[,-c(1,13,14,25,26,27,31:38)]
ypidpos <- separate(ypidan,Location,c("Location","POS"),sep = "-")
ypidpos$posb <- as.numeric(cut(as.numeric(ypidpos$POS),breaks = 30))
ypidpos <- ypidpos[,c(26,1:25)]
# Select SNPs to keep (sorted by precedence level)
ypidfin <- ypidpos[c(1,8,13,24,27,32,35,36,43,46,52,53,58,64,72,78,80,121,256,260,269),]
write.csv(ypidfin,"750idlist.csv")

## 765
zz2idan <- read.delim("765idtop50.txt")[,-c(1,13,14,25,26,27,31:38)]
zz2idpos <- separate(zz2idan,Location,c("Location","POS"),sep = "-")
zz2idpos$posb <- as.numeric(cut(as.numeric(zz2idpos$POS),breaks = 30))
zz2idpos <- zz2idpos[,c(26,1:25)]
# Select SNPs to keep (sorted by precedence level)
zz2idfin <- zz2idpos[c(4,10,17,20,24,31,35,43,44,48,50,59,62,69,70,75,94,97,99),]
write.csv(zz2idfin,"765idlist.csv")

## 465
zz1idan <- read.delim("465idtop50.txt")[,-c(1,13,14,25,26,27,31:38)]
zz1idpos <- separate(zz1idan,Location,c("Location","POS"),sep = "-")
zz1idpos$posb <- as.numeric(cut(as.numeric(zz1idpos$POS),breaks = 30))
zz1idpos <- zz1idpos[,c(26,1:25)]
# Select SNPs to keep (sorted by precedence level)
zz1idfin <- zz1idpos[c(8,11,13,15,24,31,35,44,53,65,67:70,71,80,83,85),]
write.csv(zz1idfin,"465idlist.csv")

## 767
hzidan <- read.delim("767idtop50.txt")[,-c(1,13,14,25,26,27,31:38)]
hzidpos <- separate(hzidan,Location,c("Location","POS"),sep = "-")
hzidpos$posb <- as.numeric(cut(as.numeric(hzidpos$POS),breaks = 30))
hzidpos <- hzidpos[,c(26,1:25)]
# Select SNPs to keep (sorted by precedence level)
hzidfin <- hzidpos[c(1,3,6,10,16,23,25,28,30,32,34,36,48,53:55,66,76,82,83,92,100,111),]
write.csv(hzidfin,"767idlist.csv")

## 772
dxidan <- read.delim("772idtop50.txt")[,-c(1,13,14,25,26,27,31:38)]
dxidpos <- separate(dxidan,Location,c("Location","POS"),sep = "-")
dxidpos$posb <- as.numeric(cut(as.numeric(dxidpos$POS),breaks = 30))
dxidpos <- dxidpos[,c(26,1:25)]
# Select SNPs to keep (sorted by precedence level)
dxidfin <- dxidpos[c(1,4,14,18,23,28,38,47,50,56,60,63,67,73,78,97,101,102,108,113,121,126,133),]
write.csv(dxidfin,"772idlist.csv")

## 772chr8
dx8an <- read.delim("772chr8top50.txt")[,-c(1,13,14,25,26,27,31:38)]
dx8pos <- separate(dx8an,Location,c("Location","POS"),sep = "-")
dx8pos$posb <- as.numeric(cut(as.numeric(dx8pos$POS),breaks = 30))
dx8pos <- dx8pos[,c(26,1:25)]
# Select SNPs to keep (sorted by precedence level)
dx8fin <- dx8pos[c(227,465,602,673,675,677,684,721,739,2142,7020,10447,13303,18230,24269,24935,31744,34272,36761,40849,42154,44654,47630,50619,59859),]
write.csv(dx8fin,"772chr8list.csv")

## 765chr2
zz22an <- read.delim("765chr2top50.txt")[,-c(1,13,14,25,26,27,31:38)]
zz22pos <- separate(zz22an,Location,c("Location","POS"),sep = "-")
zz22pos$posb <- as.numeric(cut(as.numeric(zz22pos$POS),breaks = 30))
zz22pos <- zz22pos[,c(26,1:25)]
# Select SNPs to keep (sorted by precedence level)
zz22fin <- zz22pos[c(42,204,210,266,283,326,350,392,459,66594,182579,251871,349175,486852,510501,581748,643562,669806,732380,814223,829080,878095,962980,962997,963115,963202,963211,963218,963221,963393),]
write.csv(zz22fin,"765chr2list.csv")

## 758chr3
bld3an <- read.delim("758chr3top50.txt")[,-c(1,13,14,25,26,27,31:38)]
bld3pos <- separate(bld3an,Location,c("Location","POS"),sep = "-")
bld3pos$posb <- as.numeric(cut(as.numeric(bld3pos$POS),breaks = 30))
bld3pos <- bld3pos[,c(26,1:25)]
# Select SNPs to keep (sorted by precedence level)
bld3fin <- bld3pos[c(215,1150,1437,1449,1454,1456,1458,1474,1476,1618,1983,2512,3821,4489,5554,5568,5589,5593,6578,7359),]
write.csv(bld3fin,"758chr3list.csv")
