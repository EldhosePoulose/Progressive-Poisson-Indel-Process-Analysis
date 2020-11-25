#This is the base file to manupulate the Guide tree. In order to use this as the input tree for INDELible
#Now at the PIPJava Trees
#******************************************************************************************************************
setwd("/Users/pouloeld/Documents/INDELIble/INDELiIble_SIM/INDELible_sim_NewickTrees")
library(phytools)
library(gtools) #Use this to use mixed sort to order strings in order 0 1 2 3 instead of [0 1 10 11 20 21]
library(readtext)

treenames = list.files(pattern="*.newick")
treenames= mixedsort(treenames,decreasing = TRUE)

c= 0
for(i in treenames){
  GuideTree= read.tree(file=i)
  #to remove round the edge.length to 9 decimal points, for INDELible
  GuideTree$edge.length= round(GuideTree$edge.length,9)
  #to remove root label, for INDELible
  #GuideTree$node.label= GuideTree$node.label[-1] 
  #Writing the tree back to the same file the file extension can be manupulated
  write.tree(GuideTree,file= paste0("sim-",c,sep= ".tree")) #protect original newick file
  #New empty control files are created here
  sapply(paste0("control-",c, ".txt"), file.create)
  c= c+1
}

#******************************************************************************************************************
#Moving to Control files now
controlnames = list.files(pattern="*.txt")
controlnames= mixedsort(controlnames,decreasing = TRUE)
shorttrees = list.files(pattern="*.tree")
shorttrees= mixedsort(shorttrees,decreasing = TRUE)

#Content (fixed)
#Content (dynamic) Tree block with the data from above
#l= length(controlnames)

#append 1:100
#naming 0:99

for(j in 1:100){

sink(controlnames[j])
  
cat("[TYPE] AMINOACID 1")
cat("\n")
cat("\n")
  
cat("[SETTINGS]")
cat("\n")
cat("   [ancestralprint]           NEW")	
cat("\n")
cat("   [output]                   FASTA")	
cat("\n")
cat("   [phylipextension]          phy")
cat("\n")
cat("   [nexusextension]           new")	
cat("\n")
cat("   [fastaextension]           fasta")	
cat("\n")
cat("   [randomseed]               1234567")	
cat("\n")
cat("   [printrates]               TRUE")
cat("\n")
cat("   [insertaslowercase]        FALSE")
cat("\n")
cat("   [markdeletedinsertions]     TRUE")
cat("\n")
cat("   [printcodonsasaminoacids]  FALSE")
cat("\n")
cat("   [fileperrep]               TRUE")
cat("\n")
cat("\n")
  
cat("[MODEL] WAGModel")
cat("\n")
cat("   [submodel]		  WAG") 
cat("\n")
cat("   [indelmodel]    POW 2.0")	
cat("\n")
cat("   [indelrate]		  0.05")	
cat("\n")
cat("\n")
  
#here we need to add tree from shorttrees[j] which is a tree file
treeastext= readtext(shorttrees[j],verbosity = 0)
cat(paste0("[TREE]	tree8   "))
trr= treeastext$text
trr= unlist(strsplit(trr, split='root', fixed=TRUE))
cat(paste(trr[1],trr[2],sep = ""))
cat("\n")
cat("\n")
  
cat("[PARTITIONS]	INDELiblepart8 [tree8 WAGModel 200]")
cat("\n")
cat("\n")
cat("[EVOLVE] INDELiblepart8 1 WAGout")



sink()

}
file.show(controlnames[1])







