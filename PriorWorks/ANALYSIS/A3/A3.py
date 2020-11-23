import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
#A3: Difference between the number of gaps in the the true MSAs and the inferred MSAs
""" 0: b_I10
    1: b_I100
    2: b_I200
    3: unb_I10
    4: unb_I100
    5: unb_I200"""

#d="C:/jithis_drive/zhaw/ACLS/Genomics_track2/simulation_PIPjava/PIPjava/state/execs/0.exec/output/"

d_list= []
for i in range(0,6):
    d_list.append("C:/jithis_drive/zhaw/ACLS/Genomics_track2/simulation_PIPjava/PIPjava/state/execs/"+str(i)+".exec/output/")
Tgap_0 = []
Tgap_1 = []
Tgap_2 = []
Tgap_3 = []
Tgap_4 = []
Tgap_5 = []
a = [Tgap_0,Tgap_1,Tgap_2,Tgap_3,Tgap_4,Tgap_5]

for i in range(0,6):
    os.chdir(d_list[i])
    for j in range(0,100):
        file = open('sim-'+str(j)+'_MSA.fasta')
        t=file.read().replace('\n', '')
        freq = t.count('-')
        a[i].append(freq/8)
        file.close()

True_gaps = pd.DataFrame({'b_I10':Tgap_0,'b_I100':Tgap_1,'b_I200':Tgap_2,
                             'unb_I10':Tgap_3,'unb_I100':Tgap_4,'unb_I200':Tgap_5})


d_mJATI = 'C:\jithis_drive\zhaw\ACLS\Genomics_track2\miniJATI\cluster_output\mJATI_output'
os.chdir(d_mJATI)

Igap_0 = []
Igap_1 = []
Igap_2 = []
Igap_3 = []
Igap_4 = []
Igap_5 = []

b = [Igap_0,Igap_1,Igap_2,Igap_3,Igap_4,Igap_5]

for i in range(0,6):
    for j in range(0,100):
        f = open('msa_out'+str(i)+'_'+str(j)+'.fa','r')
        t=f.read().replace('\n', '')
        freq = t.count('-')
        b[i].append(freq/8)
        f.close()
Inf_gaps = pd.DataFrame({'b_I10':Igap_0,'b_I100':Igap_1,'b_I200':Igap_2,
                             'unb_I10':Igap_3,'unb_I100':Igap_4,'unb_I200':Igap_5})

#following method doesn't work for yerr:

#arr = np.array([Tgap_0,Igap_0,Tgap_1,Igap_1,Tgap_2,Igap_2,Tgap_3,Igap_3,Tgap_4,Igap_4,Tgap_5,Igap_5])
#yerr = np.std(arr,axis = 1)

## To make boxplots
"""plt.subplot(1,2,1)
True_gaps.boxplot()
plt.title('True MSA')
plt.ylabel('No: of gaps')

plt.subplot(1,2,2)
Inf_gaps.boxplot()
plt.title('Inferred MSA')
#plt.ylabel('No: of gaps')
plt.show()"""

#True_gaps.plot(kind = 'bar',legend = True,title = 'True MSA')
#plt.show()

#bar plots with std as error bars
d = {'True_MSA': True_gaps.mean(),'True_std':True_gaps.std(),'Inf_MSA':Inf_gaps.mean(),'Inf_std':Inf_gaps.std()}
index = ['b_I10','b_I100','b_I200','unb_I10','unb_I100','unb_I200']
df = pd.DataFrame(d,index=index)

#yerr = [True_gaps.std(),Inf_gaps.std()] #or
yerr = df['True_std'],df['Inf_std']

A3 = df[['True_MSA','Inf_MSA']]
A3.plot.bar(title = 'A3: Difference between the number of gaps',
            yerr = yerr ,rot = 0,grid = True,capsize = 4)
plt.ylabel('No: of gaps')
plt.show()






    
                




