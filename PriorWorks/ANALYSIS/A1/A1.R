####Import dataset####
#import with environment or as code, set wd to outfiles from qscore directory
files = list.files(pattern = "out") #create list of outfiles
newfiles = lapply(files, read.csv, header=F, sep=';') #newfiles[[1]]: first dataframe out0
#create 6 df: check with newfiles[[1]]$V1[1], newfiles[[2]]$V1[2] and so on, which intensity and balanced
#or unbalanced is given

#newfiles[[1]]$V1[1]
b_I10 = newfiles[[1]]
b_I100 = newfiles[[2]]
b_I200 = newfiles[[3]]
unb_I10 = newfiles[[4]]
unb_I100 = newfiles[[5]]
unb_I200 = newfiles[[6]]

####Q####

#create columns
Q = b_I10 #any df can be used
Q$b_I10  = b_I10$V3
Q$b_I100 = b_I100$V3
Q$b_I200 = b_I200$V3
Q$unb_I10  = unb_I10$V3
Q$unb_I100 = unb_I100$V3
Q$unb_I200 = unb_I200$V3
Q[1] = NULL
Q[1] = NULL
Q[1] = NULL
Q[1] = NULL
Q[1] = NULL
Q[1] = NULL
#6 times to remove V1 to V6

#remove substring and convert to numberic
Q = as.data.frame(sapply(Q, function(x){as.numeric(gsub(pattern = ".*=", replacement = "", x))}))

####TC####
#create columns
TC = b_I10 #any df can be used
TC$b_I10 = b_I10$V4
TC$b_I100 = b_I100$V4
TC$b_I200 = b_I200$V4
TC$unb_I10 = unb_I10$V4
TC$unb_I100 = unb_I100$V4
TC$unb_I200 = unb_I200$V4
TC[1] = NULL #6 times to remove V1 to V6
TC[1] = NULL
TC[1] = NULL
TC[1] = NULL
TC[1] = NULL
TC[1] = NULL

#remove substring and convert to numberic
TC = as.data.frame(sapply(TC, function(x){as.numeric(gsub(pattern = ".*=", replacement = "", x))}))

####Cline####
#create columns
Cline = b_I10 #any df can be used
Cline$b_I10 = b_I10$V5
Cline$b_I100 = b_I100$V5
Cline$b_I200 = b_I200$V5
Cline$unb_I10 = unb_I10$V5
Cline$unb_I100 = unb_I100$V5
Cline$unb_I200 = unb_I200$V5
Cline[1] = NULL
Cline[1] = NULL
Cline[1] = NULL#6 times to remove V1 to V6
Cline[1] = NULL
Cline[1] = NULL
Cline[1] = NULL

#remove substring and convert to numberic
Cline = as.data.frame(sapply(Cline, function(x){as.numeric(gsub(pattern = ".*=", replacement = "", x))}))

####Modeler####
#create columns
Modeler = b_I10 #any df can be used
Modeler$b_I10 = b_I10$V6
Modeler$b_I100 = b_I100$V6
Modeler$b_I200 = b_I200$V6
Modeler$unb_I10 = unb_I10$V6
Modeler$unb_I100 = unb_I100$V6
Modeler$unb_I200 = unb_I200$V6
Modeler[1] = NULL #6 times to remove V1 to V6
Modeler[1] = NULL
Modeler[1] = NULL
Modeler[1] = NULL
Modeler[1] = NULL
Modeler[1] = NULL

#remove substring and convert to numberic
Modeler = as.data.frame(sapply(Modeler, function(x){as.numeric(gsub(pattern = ".*=", replacement = "", x))}))

####plot####
#combine
#pdf("A1_plot.pdf")
par(mfrow=c(2,2))
boxplot(Q)
title(main = "Q")
boxplot(TC)
title(main = "TC")
boxplot(Cline)
title(main = "Cline")
boxplot(Modeler)
title(main = "Modeler")

