import os

#'sim-0_MSA.fasta'
d1="D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP1_TRUE_MSA_PIPJAVA/execs/0.exec/output"

os.chdir(d1)

indel_mt = []

count = 0
for i in range(0,100):
    file = open('sim-'+str(i)+'_MSA.fasta')
    
    for line in file:
        for i in line:
            if i == '-':
                count += 1
            if i != '-':
                if count != 0:
                    indel_mt.append(count)
                    count = 0
        if count != 0:
            indel_mt.append(count)
            count = 0
    file.close()
#print(indel_mt)


d2 = 'D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP2_TEST_MSA_MiniJATAI/miniJATI_out_msa'
os.chdir(d2)
indel_inf_msa= []
for i in range(0,100):
    f = open('msa_out0_'+str(i)+'.fa','r')
    t=f.read().replace('\n', '')
    l = int((len(t)-24)/8)
    for j in range(1,9):
        c = t.index('>t'+str(j))
        count = 0
        
        start = c+3
        for i in range(start,start+l):
            if t[i] == '-':
                count += 1
            if t[i] != '-':
                if count != 0:
                    indel_inf_msa.append(count)
                    count = 0
        if count != 0:
                indel_inf_msa.append(count)
                count = 0
    f.close()

len(indel_mt) == len(indel_inf_msa)
    
