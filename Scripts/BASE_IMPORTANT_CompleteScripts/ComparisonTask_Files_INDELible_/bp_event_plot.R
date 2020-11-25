library(readtext)
library(gtools)
library(seqinr)
library(stringr)
library(dplyr)

##PIP
setwd("/Users/pouloeld/Desktop/PIP_TRUE_MSA/")

pip_msanames= list.files(pattern="*.fasta")
pip_msanames= mixedsort(pip_msanames,decreasing = TRUE)

#loop here to change out as per iter out

pipseq= read.fasta(pip_msanames[3], seqtype = "AA")
pipseq= pipseq[order(names(pipseq))]
#getSequence(msaseq[[1]])
pipseQ= trimws(getSequence(pipseq[[1]], as.string = TRUE)) #trim blank spaces end start

leaf_0= c(pipseq[["leaf_0"]][1:nchar(pipseQ)])
leaf_0= ifelse(leaf_0 %in% c("*", "-"), 1, 0)
leaf_1= c(pipseq[["leaf_1"]][1:nchar(pipseQ)])
leaf_1= ifelse(leaf_1 %in% c("*", "-"), 1, 0)
leaf_2= c(pipseq[["leaf_2"]][1:nchar(pipseQ)])
leaf_2= ifelse(leaf_2 %in% c("*", "-"), 1, 0)
leaf_3= c(pipseq[["leaf_3"]][1:nchar(pipseQ)])
leaf_3= ifelse(leaf_3 %in% c("*", "-"), 1, 0)
leaf_4= c(pipseq[["leaf_4"]][1:nchar(pipseQ)])
leaf_4= ifelse(leaf_4 %in% c("*", "-"), 1, 0)
leaf_5= c(pipseq[["leaf_5"]][1:nchar(pipseQ)])
leaf_5= ifelse(leaf_5 %in% c("*", "-"), 1, 0)
leaf_6= c(pipseq[["leaf_6"]][1:nchar(pipseQ)])
leaf_6= ifelse(leaf_6 %in% c("*", "-"), 1, 0)
leaf_7= c(pipseq[["leaf_7"]][1:nchar(pipseQ)])
leaf_7= ifelse(leaf_7 %in% c("*", "-"), 1, 0)

pip_bp= data.frame()
pip_bp= rbind(leaf_0)
pip_bp= rbind(pip_bp,leaf_1)
pip_bp= rbind(pip_bp,leaf_2)
pip_bp= rbind(pip_bp,leaf_3)
pip_bp= rbind(pip_bp,leaf_4)
pip_bp= rbind(pip_bp,leaf_5)
pip_bp= rbind(pip_bp,leaf_6)
pip_bp= rbind(pip_bp,leaf_7)
totIndel= colSums(pip_bp)
pip_bp= rbind(pip_bp,totIndel)

nBP= seq(1:nchar(pipseQ))
plot(nBP,totIndel,type = "l",xlab="Number of characters ",ylab = "Frequency of Occurance of INDELS on each column",main="PIP_INDEL_frequency pattern")


##############
# aa2= c("A","R","N","-","*")
# ifelse(aa2 %in% c("*", "-"), 1, 0)
##########


