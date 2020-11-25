ntaxa=8

## Table creation
taxa= c(names(indelibleseq))
nEvents= c(0*length(taxa))
eventData= data.frame(taxa)
prefix= "Replica_"
suffix= seq(1:niter)
replicaname= paste(prefix,suffix,sep="")
eventData[replicaname]=nEvents
##****



  

#Count number of events in each MSA
for (j in 1:ntaxa) {

  S= trimws(getSequence(indelibleseq[[j]], as.string = TRUE))
  nEvents= str_count(S, pattern = fixed("-")) + str_count(S, pattern = fixed("*"))
  eventData$nEvents[j]= nEvents
}





# 
# taxa= c(names(indelibleseq))
# nEvents= c(0*length(taxa))
# eventData= data.frame(taxa,nEvents)
# 
# S= trimws(getSequence(indelibleseq[[8]], as.string = TRUE))
# nEvents= str_count(S, pattern = fixed("-")) + str_count(S, pattern = fixed("*"))
# eventData$nEvents[8]= nEvents
# 
# prefix= "Replica_"
# suffix= seq(1:niter)
# colnames= paste(prefix,suffix,sep="")
