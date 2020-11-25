library(readtext)
library(gtools)
library(seqinr)
library(stringr)
library(dplyr)


## PIP
setwd("/Users/pouloeld/Desktop/PIP_TRUE_MSA/")
pip_msanames= list.files(pattern="*.fasta")
pip_msanames= mixedsort(pip_msanames,decreasing = TRUE)


pip_Lprefix= "leaf_"
pip_Lsuffix= seq(0,8-1)
pip_taxa= paste(pip_Lprefix,pip_Lsuffix,sep="")
pip_nEvents= c(0*length(8))
pip_eventData= data.frame(pip_taxa)


pip_prefix= "Replica_"
pip_suffix= seq(1,100)
pip_replicaname= paste(prefix,ƒsuffix,sep="")
pip_eventData[pip_replicaname]=pip_nEvents


pip_eventData= as.matrix(pip_eventData)
c=2


for (pip_Names in pip_msanames) {
  pip_seq= read.fasta(pip_Names, seqtype = "AA")
  pip_seq= pip_seq[order(names(pip_seq))]
  for (t in 1:9) {
    if(t<=8){
      #print("if")
      pip_S= trimws(getSequence(pip_seq[[t]], as.string = TRUE))
      pip_nIndels= str_count(pip_S, pattern = fixed("-")) + str_count(pip_S, pattern = fixed("*")) #int out
      pip_eventData[t,c]= pip_nIndels
    }else{
      #print(c)
      c=c+1
    }
  }
}


write.table(pip_eventData,file="pip_events.txt")
write.csv(pip_eventData,file="pip_events.csv")

## INDELible

setwd("/Users/pouloeld/Desktop/INDELible_TRUE_MSA/")
indelible_msanames= list.files(pattern="*.fasta")
indelible_msanames= mixedsort(indelible_msanames,decreasing = FALSE)

Lprefix= "leaf_"
Lsuffix= seq(0,8-1)
taxa= paste(Lprefix,Lsuffix,sep="")
nEvents= c(0*length(8))
indelible_eventData= data.frame(taxa)

prefix= "Replica_"
suffix= seq(1,100)
replicaname= paste(prefix,suffix,sep="")
indelible_eventData[replicaname]=nEvents

indelible_eventData= as.matrix(indelible_eventData)
c=2

for (Names in indelible_msanames) {
  indelibleseq= read.fasta(Names, seqtype = "AA")
  indelibleseq= indelibleseq[order(names(indelibleseq))]
  for (t in 1:9) {
    if(t<=8){
      #print("if")
      S= trimws(getSequence(indelibleseq[[t]], as.string = TRUE))
      nIndels= str_count(S, pattern = fixed("-")) + str_count(S, pattern = fixed("*")) #int out
      indelible_eventData[t,c]= nIndels
    }else{
      #print(c)
      c=c+1
      }
  }
}

write.table(indelible_eventData,file="indelible_events.txt")
write.csv(indelible_eventData,file="indelible_events.csv")

