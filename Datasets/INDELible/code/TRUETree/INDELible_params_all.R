#This is the base file to manupulate the Guide tree. In order to use this as the input tree for INDELible

#Now at the PIPJava Trees
#******************************************************************************************************************
setwd("/Users/pouloeld/Documents/INDELIble/INDELiIble_SIM/INDELible_sim_NewickTrees/TRUETree")
library(phytools)
library(gtools) #Use this to use mixed sort to order strings in order 0 1 2 3 instead of [0 1 10 11 20 21]
library(readtext)

treepath= "/Users/pouloeld/Documents/INDELIble/INDELiIble_SIM/INDELible_sim_NewickTrees/TRUETree"
treenames = list.files(treepath, pattern="*.newick")
treenames= mixedsort(treenames,decreasing = TRUE)

c= 0
for(i in treenames){
  GuideTree= read.tree(file=i)
  #to remove round the edge.length to 9 decimal points, for INDELible
  #GuideTree$edge.length= round(GuideTree$edge.length,4) #size adjusted to avoid numerical error
  write.tree(GuideTree,file= paste0("sim-",c,sep= ".tree")) #protect original newick file
  #New empty control files are created here
  #sapply(paste0("control-",c, ".txt"), file.create)
  c= c+1
}
sapply(paste0("control",".txt"), file.create)
#******************************************************************************************************************
#Moving to Control file now
controlnames = list.files(pattern="control.txt")
#controlnames= mixedsort(controlnames,decreasing = TRUE) 
shorttrees = list.files(pattern="*.tree")
shorttrees= mixedsort(shorttrees,decreasing = TRUE)

#Content (fixed)
#Content (dynamic) Tree block with the data from above
#l= length(controlnames)

#append 1:100
#naming 0:99

sink(controlnames[1])
  
cat("[TYPE] AMINOACID 1")
cat("\n")
cat("\n")
  
cat("[SETTINGS]")
cat("\n")
cat("   [ancestralprint]            NEW")	
cat("\n")
cat("   [output]                    FASTA")	
cat("\n")
cat("   [phylipextension]           phy")
cat("\n")
cat("   [nexusextension]            new")	
cat("\n")
cat("   [fastaextension]            fasta")	
cat("\n")
cat("   [randomseed]                1234567")	
cat("\n")
cat("   [printrates]                TRUE")
cat("\n")
cat("   [insertaslowercase]         FALSE")
cat("\n")
cat("   [markdeletedinsertions]     TRUE")
cat("\n")
cat("   [printcodonsasaminoacids]   FALSE")
cat("\n")
cat("   [fileperrep]                TRUE")
cat("\n")
cat("\n")
  
cat("[MODEL] WAGModel")
cat("\n")
cat("   [submodel]		  WAG") 
cat("\n")
cat("   [indelmodel]      POW 1.7")	
cat("\n")
cat("   [indelrate]		  0.05")	
cat("\n")
cat("\n")

#file.show(controlnames[1])
c=0
for(j in 1:100){ 
  #here we need to add tree from shorttrees[j] which is a tree file
  treeastext= readtext(shorttrees[j],verbosity = 0)
  trr= treeastext$text
  trr= unlist(strsplit(trr, split='root', fixed=TRUE))
  trr= paste0(trr[1],trr[2])
  trr0= unlist(strsplit(trr, split='internal_0', fixed=TRUE))
  trr0= paste0(trr0[1],trr0[2])
  trr1= unlist(strsplit(trr0, split='internal_1', fixed=TRUE))
  trr1= paste0(trr1[1],trr1[2])
  trr2= unlist(strsplit(trr1, split='internal_2', fixed=TRUE))
  trr2= paste0(trr2[1],trr2[2])
  trr3= unlist(strsplit(trr2, split='internal_3', fixed=TRUE))
  trr3= paste0(trr3[1],trr3[2]) 
  trr4= unlist(strsplit(trr3, split='internal_4', fixed=TRUE))
  trr4= paste0(trr4[1],trr4[2]) 
  trr5= unlist(strsplit(trr4, split='internal_5', fixed=TRUE))
  trr5= paste0(trr5[1],trr5[2]) 
  
  write(trr5, file=paste0("sim_",c,".newick"))
  cat(paste0(("[TREE]	t_"),j-1),trr5)
  cat("\n")
  cat("\n")
  c= c+1
}

for(j in 1:100){ 
cat(paste0(("[PARTITIONS]	Pname_"),j-1),paste0(("[t_"),j-1),paste0("WAGModel 200]"))
cat("\n")
cat("\n")
}

cat("[EVOLVE]")
cat("\n")
for(j in 1:100){ 
cat(   paste0(("Pname_"),j-1),paste("1"),paste0(("out_"),j-1))
cat("\n")
}
sink()




