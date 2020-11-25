# sim<-seq(0.01,0.1,0.01)
# 
# for(i in 1:4){
#   write.table(sim[i],file = paste0("sim",i,"_",sep=".txt"))
# }
# 
# 
# #make sure the files are in the same working directory, if not provide the path 
# #getwd()  #to get the path 
# #setwd("path here")
# #To create a folder 
# #dir.create("folder name here")
# #To create an empty file
# #file.create("test.txt")
# # 
# # d= 0
# # for(i in treenames){
# #   sapply(paste0("control",d, ".txt"), file.create)
# #   d= d+1
# # }
# #   
# # [TYPE] AMINOACID 1
# # 
# # [SETTINGS]
# # [ancestralprint]			NEW			
# # [output]					FASTA		
# # [phylipextension]			phy			
# # [nexusextension]			new			
# # [fastaextension]			fasta		
# # [randomseed]				1234567		
# # [printrates]				TRUE		
# # [insertaslowercase]			FALSE		
# # [markdeletedinsertions]		TRUE		
# # [printcodonsasaminoacids]	FALSE		
# # [fileperrep]				TRUE		
# 
# # [MODEL] WAGModel
# # [submodel]		WAG 				
# # [indelmodel]	POW 1.7				
# # [indelrate]		0.05				
# # 
# # [PARTITIONS]	taxa8 [tree8 WAGModel 200]
# # 
# # [TREE] tree8 (((leaf_1:0.007246778,leaf_6:0.196305321)internal_1:0.216838946,((leaf_5:0.302307903,leaf_7:0.037388996)internal_0:0.114760341,leaf_3:0.193212198)internal_2:0.014736040)internal_3:0.000826806,(leaf_2:0.077850947,(leaf_0:0.410243442,leaf_4:0.119206971)internal_5:0.111700971)internal_4:0.000826806);
# # 
# # [EVOLVE]	taxa8 1 out_1
# 
# 
# library(gtools)
# library(readtext)
# 
# file.names= mixedsort(sort(file.names))
# l= 10
# for(j in 1:l){
#   
#   aa= readtext(shorttrees[j],verbosity = 0)
#   print(aa$text)
#   #cat(paste0("[EVOLVE]	Tree8 1 out-",j))
#   }
# 
# cat("[EVOLVE]	Tree8 1 out1")
# 
# 
# #27.02.2020**********************************************
# 
# file.create("test.txt")
# sink("test.txt")
# #treeastext= readtext("sim-0.tree",verbosity = 0)
# cat(paste0("[TREE]	Tree8   ",treeastext$text))
# sink()
# ab= readtext("test.txt")
# tt= ab$text
# tt[1]
# tt= unlist(strsplit(tt, split='root', fixed=TRUE))
# tt= cat(tt[1],tt[2])
# 
# #here we need to add tree from shorttrees[j] which is a tree file
# treeastext= readtext(shorttrees[j],verbosity = 0)
# treeastext= unlist(strsplit(tt, split='root', fixed=TRUE))
# treeastext= cat(tt[1],tt[2])
# cat(paste0("[TREE]	Tree8   ",treeastext$text)) 
