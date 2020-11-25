#for inputfiles in 2 4 6 14 25 39 45 46 48 50 63 86 88 97 99 ;
for inputfiles in {0..99};
do  
	mv /Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/PIPJava/ProPIPinferredMSA_P_$(($inputfiles+1)).fasta /Users/pouloeld/Documents/Statistics/InferredMSAs/ProPIP/PIPJava/ProPIPinferredMSA_P_$inputfiles.fasta
done



#$(($inputfiles+1))