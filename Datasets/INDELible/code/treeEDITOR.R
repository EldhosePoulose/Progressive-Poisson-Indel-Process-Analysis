library(phytools)
library(gtools) #Use this to use mixed sort to order strings in order 0 1 2 3 instead of [0 1 10 11 20 21]
library(readtext)

treepath= "/Users/pouloeld/Documents/ProPIP/Params_Generation/inputs/realData_ins/newicktree_realData"
treenames = list.files(treepath, pattern="*.newick")
treenames= mixedsort(treenames,decreasing = TRUE)

c= 0
for(i in treenames){
  GuideTree= read.tree(file=i)
  #to remove round the edge.length to 9 decimal points, for INDELible
  GuideTree$edge.length= round(GuideTree$edge.length,4) #size adjusted to avoid numerical error
  write(trr5, file=paste0("sim_",c,".newick")) #protect original newick file
  c= c+1
}
# 
# shorttrees = list.files(pattern="*.tree")
# shorttrees= mixedsort(shorttrees,decreasing = TRUE)
# 
# 
# c=0
# for(j in 1:100){ 
#   #here we need to add tree from shorttrees[j] which is a tree file
#   treeastext= readtext(shorttrees[j],verbosity = 0)
#   trr= treeastext$text
#   trr= unlist(strsplit(trr, split='root', fixed=TRUE))
#   trr= paste0(trr[1],trr[2])
#   trr0= unlist(strsplit(trr, split='internal_0', fixed=TRUE))
#   trr0= paste0(trr0[1],trr0[2])
#   trr1= unlist(strsplit(trr0, split='internal_1', fixed=TRUE))
#   trr1= paste0(trr1[1],trr1[2])
#   trr2= unlist(strsplit(trr1, split='internal_2', fixed=TRUE))
#   trr2= paste0(trr2[1],trr2[2])
#   trr3= unlist(strsplit(trr2, split='internal_3', fixed=TRUE))
#   trr3= paste0(trr3[1],trr3[2]) 
#   trr4= unlist(strsplit(trr3, split='internal_4', fixed=TRUE))
#   trr4= paste0(trr4[1],trr4[2]) 
#   trr5= unlist(strsplit(trr4, split='internal_5', fixed=TRUE))
#   trr5= paste0(trr5[1],trr5[2]) 
#   
#   write(trr5, file=paste0("sim_",c,".newick"))
#   c= c+1
# }
