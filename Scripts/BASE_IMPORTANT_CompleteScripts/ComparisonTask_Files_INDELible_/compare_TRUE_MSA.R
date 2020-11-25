library(readtext)
library(gtools)
library(seqinr)
library(stringr)
library(dplyr)

niter= 100
##PIP
setwd("/Users/pouloeld/Desktop/PIP_TRUE_MSA/")

pip_msanames= list.files(pattern="*.fasta")
pip_msanames= mixedsort(pip_msanames,decreasing = TRUE)
pip_seq_l= list()

i=1
for (names in pip_msanames) {
  pipseq <- read.fasta(names, seqtype = "AA")
  #getSequence(msaseq[[1]])
  pipseq= pipseq[order(names(pipseq))]
  pipseQ= trimws(getSequence(pipseq[[1]], as.string = TRUE)) #trim blank spaces end start
  pip_seq_l[i]= nchar(pipseQ)
  i=i+1
}
pip_seq_l= unlist(pip_seq_l)

#Plotting
x= seq(1:niter)
plot(x,pip_seq_l,type = "l",xlab="Iteration",ylab = "Sequence length",main="PIP")


write.csv(pip_seq_l,file="pip_MSA.csv")




##INDELible***************************************************************************
niter= 100
ntaxa= 8
setwd("/Users/pouloeld/Desktop/INDELible_TRUE_MSA/")
indelible_msanames= list.files(pattern="*.fasta")
indelible_msanames= mixedsort(indelible_msanames,decreasing = FALSE)
indelible_seq_l= list()

## Table creation for marking number of events in each taxa on each iteration
Lprefix= "leaf_"
Lsuffix= seq(0,ntaxa-1)
taxa= paste(Lprefix,Lsuffix,sep="")
nEvents= c(0*length(ntaxa))
eventData= data.frame(taxa)

prefix= "Replica_"
suffix= seq(1,niter)
replicaname= paste(prefix,suffix,sep="")
eventData[replicaname]=nEvents

#Trying to plot the length of MSA vs iteration
i=1
for (Names in indelible_msanames) {
  indelibleseq= read.fasta(Names, seqtype = "AA")
  indelibleseq= indelibleseq[order(names(indelibleseq))]
  #getSequence(msaseq[[1]])
  indelibleseQ= trimws(getSequence(indelibleseq[[1]], as.string = TRUE))#trim blank spaces end start
  indelible_seq_l[i]= list(nchar(indelibleseQ))
  i=i+1 #indexing through iteration
}

##Plotting
indelible_seq_l= unlist(indelible_seq_l)
x= seq(1:niter)
plot(x,indelible_seq_l,type = "l",xlab="Iteration",ylab = "Sequence length",main="INDELible")

write.csv(indelible_seq_l,file="indelible_MSA.csv")




