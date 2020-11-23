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

#d0 = "D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP1_TRUE_MSA_PIPJAVA/execs/0.exec/output"
Tmsa_len0 = []
Tmsa_len1 = []
Tmsa_len2 = []
Tmsa_len3 = []
Tmsa_len4 = []
Tmsa_len5 = []
T_list = [Tmsa_len0,Tmsa_len1,Tmsa_len2,Tmsa_len3,Tmsa_len4,Tmsa_len5]

d_list= []
for i in range(0,6):
    d_list.append("D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP1_TRUE_MSA_PIPJAVA/execs/"+str(i)+".exec/output/")

for i in range(0,6):
    os.chdir(d_list[i])
    for j in range(0,100):
        file = open('sim-'+str(j)+'_MSA.fasta')
        t=file.read().replace('\n', '')
        T_list[i].append((len(t)-24)/8)
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
        
True_MSA_len = pd.DataFrame({'b_I10':Tmsa_len0,'b_I100':Tmsa_len1,'b_I200':Tmsa_len2,
                             'unb_I10':Tmsa_len3,'unb_I100':Tmsa_len4,'unb_I200':Tmsa_len5})

Inf_MSA_len = pd.DataFrame({'b_I10':inf_msa_len_0,'b_I100':inf_msa_len_1,'b_I200':inf_msa_len_2,
                             'unb_I10':inf_msa_len_3,'unb_I100':inf_msa_len_4,'unb_I200':inf_msa_len_5})

#to make boxplots
#uncomment following lines of code:
'''plt.subplot(1,2,1)
ax = True_MSA_len.boxplot()
ax.set_ylabel("Length")
ax.set_title("True MSA")

plt.subplot(1,2,2)
ax2 = Inf_MSA_len.boxplot()
ax2.set_title("Inferred MSA")

plt.show()'''

#bar plots with std as error bars
d = {'True_MSA': True_MSA_len.mean(),'True_std':True_MSA_len.std(),'Inf_MSA':Inf_MSA_len.mean(),'Inf_std':Inf_MSA_len.std()}
index = ['b_I10','b_I100','b_I200','unb_I10','unb_I100','unb_I200']
df = pd.DataFrame(d,index=index)

yerr = [True_MSA_len.std(),Inf_MSA_len.std()] #or
#yerr = df['True_std'],df['Inf_std']

A2 = df[['True_MSA','Inf_MSA']]
A2.plot.bar(title = 'A2: Difference between the length of MSAs',
            yerr = yerr ,rot = 0,grid = True,capsize = 4)
plt.ylabel('Length of MSA')
plt.show()

