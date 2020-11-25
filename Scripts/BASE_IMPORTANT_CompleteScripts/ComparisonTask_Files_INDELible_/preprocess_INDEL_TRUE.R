library(readtext)
library(gtools)
library(seqinr)
library(stringr)
library(dplyr)

## INDELible

setwd("/Users/pouloeld/Desktop/INDELible_TRUE_MSA/")
indelible_msanames= list.files(pattern="*.fasta")
indelible_msanames= mixedsort(indelible_msanames,decreasing = FALSE)

Lprefix= "leaf_"
Lsuffix= seq(0,8-1)
taxa= paste(Lprefix,Lsuffix,sep="")
nEvents= c(0*length(8))
indelible_eventData= data.frame(taxa)

indelible_eventData= as.matrix(indelible_eventData)
c=2 #Used to insert in the 2nd column of the data frame till 101 column ie 100

for (Names in indelible_msanames) {
  indelibleseq= read.fasta(Names, seqtype = "AA")
  indelibleseq= indelibleseq[order(names(indelibleseq))]
  for (t in 1:9) {
    if(t<=8){
      print("if")
      S= trimws(getSequence(indelibleseq[[t]], as.string = TRUE))
      S= gsub("*","",S,fixed = TRUE)
      S= gsub("-","",S,fixed = TRUE)
      
    }else{
      print(c)
      c=c+1
    }
  }
}