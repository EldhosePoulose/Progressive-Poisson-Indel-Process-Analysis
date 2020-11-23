import os

filelist=[]

for i in os.listdir("D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PIPjava/state/execs/2.exec/output"):
    if i.endswith('.fasta'):
        filelist.append(i)

MSA_len = []
for filename in filelist:
    file = open(filename)
    for line in file:
        if line.startswith("A") or line.startswith("C") or line.startswith("G") or line.startswith("T") or line.startswith("-"):
            MSA_len.append(len(line))
            break
print(MSA_len)
