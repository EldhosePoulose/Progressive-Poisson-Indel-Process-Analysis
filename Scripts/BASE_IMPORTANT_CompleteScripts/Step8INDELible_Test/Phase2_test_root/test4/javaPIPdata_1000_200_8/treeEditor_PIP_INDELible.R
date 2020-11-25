#This is the base file to manupulate the Guide tree. In order to use this as the input tree for INDELible

#Now at the PIPJava Trees
#******************************************************************************************************************
setwd("/Users/pouloeld/Documents/INDELIble/INDELiIble_SIM/INDELible_sim_NewickTrees")
library(phytools)
library(gtools) #Use this to use mixed sort to order strings in order 0 1 2 3 instead of [0 1 10 11 20 21]
library(readtext)

treepath= "/Users/pouloeld/Documents/INDELIble/INDELiIble_SIM/INDELible_sim_NewickTrees"
treenames = list.files(treepath, pattern="*.newick")
treenames= mixedsort(treenames,decreasing = TRUE)

c= 0
for(i in treenames){
  GuideTree= read.tree(file=i)
  #to remove round the edge.length to 9 decimal points, for INDELible
  #GuideTree$edge.length= round(GuideTree$edge.length,4) #size adjusted to avoid numerical error
  #write.tree(GuideTree,file= paste0("sim-",c,sep= ".tree")) #protect original newick file

  c= c+1
}