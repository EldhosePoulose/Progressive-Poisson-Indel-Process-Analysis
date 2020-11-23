import os
import pandas as pd
import matplotlib.pyplot as plt
#A2: Difference between the length of the true MSAs and the length of the inferred MSAs
""" 0: b_I10
    1: b_I100
    2: b_I200
    3: unb_I10
    4: unb_I100
    5: unb_I200"""

d0 = "D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP1_TRUE_MSA_PIPJAVA/execs/0.exec/output"

os.chdir(d0)
trueMSA_len_0 = []
for i in range(0,100):
    file = open('sim-'+str(i)+'_MSA.fasta')
    t=file.read().replace('\n', '')
    trueMSA_len_0.append((len(t)-24)/8)
    file.close()

d1 = "D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP1_TRUE_MSA_PIPJAVA/execs/1.exec/output"

os.chdir(d1)
trueMSA_len_1 = []
for i in range(0,100):
    file = open('sim-'+str(i)+'_MSA.fasta')
    t=file.read().replace('\n', '')
    trueMSA_len_1.append((len(t)-24)/8)
    file.close()

d2 = "D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP1_TRUE_MSA_PIPJAVA/execs/2.exec/output"
os.chdir(d2)
trueMSA_len_2 = []
for i in range(0,100):
    file = open('sim-'+str(i)+'_MSA.fasta')
    t=file.read().replace('\n', '')
    trueMSA_len_2.append((len(t)-24)/8)
    file.close()

d3 = "D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP1_TRUE_MSA_PIPJAVA/execs/3.exec/output"
os.chdir(d3)
trueMSA_len_3 = []
for i in range(0,100):
    file = open('sim-'+str(i)+'_MSA.fasta')
    t=file.read().replace('\n', '')
    trueMSA_len_3.append((len(t)-24)/8)
    file.close()

d4 = "D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP1_TRUE_MSA_PIPJAVA/execs/4.exec/output"
os.chdir(d4)
trueMSA_len_4 = []
for i in range(0,100):
    file = open('sim-'+str(i)+'_MSA.fasta')
    t=file.read().replace('\n', '')
    trueMSA_len_4.append((len(t)-24)/8)
    file.close()

d5 = "D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP1_TRUE_MSA_PIPJAVA/execs/5.exec/output"
os.chdir(d5)
trueMSA_len_5 = []
for i in range(0,100):
    file = open('sim-'+str(i)+'_MSA.fasta')
    t=file.read().replace('\n', '') #remove the new lines in all 
    trueMSA_len_5.append((len(t)-24)/8) """Greater than T1,T2..."""
    file.close()

d_mJATI = 'D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP2_TEST_MSA_MiniJATAI/miniJATI_out_msa'
os.chdir(d_mJATI)

inf_msa_len_0 = []
inf_msa_len_1 = []
inf_msa_len_2 = []
inf_msa_len_3 = []
inf_msa_len_4 = []
inf_msa_len_5 = []
l = [inf_msa_len_0,inf_msa_len_1,inf_msa_len_2,inf_msa_len_3,inf_msa_len_4,inf_msa_len_5]

for i in range(0,6):
    for j in range(0,100):
        f = open('msa_out'+str(i)+'_'+str(j)+'.fa','r')
        t=f.read().replace('\n', '')
        l[i].append((len(t)-24)/8)
        f.close()
        
True_MSA_len = pd.DataFrame({'b_I10':trueMSA_len_0,'b_I100':trueMSA_len_1,'b_I200':trueMSA_len_2,
                             'unb_I10':trueMSA_len_3,'unb_I100':trueMSA_len_4,'unb_I200':trueMSA_len_5})

Inf_MSA_len = pd.DataFrame({'b_I10':inf_msa_len_0,'b_I100':inf_msa_len_1,'b_I200':inf_msa_len_2,
                             'unb_I10':inf_msa_len_3,'unb_I100':inf_msa_len_4,'unb_I200':inf_msa_len_5})
plt.subplot(1,2,1)
ax = True_MSA_len.boxplot()
ax.set_ylabel("Length")
ax.set_title("True MSA")

plt.ylim((1000,1800))

plt.subplot(1,2,2)
ax2 = Inf_MSA_len.boxplot()
ax2.set_title("Inferred MSA")

plt.ylim((1000,1800))
plt.show()
