import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import scipy
import scipy.stats as stats
#A4: Difference between the indel lengths in the the true MSAs and the inferred MSAs
""" 0: b_I10
    1: b_I100
    2: b_I200
    3: unb_I10
    4: unb_I100
    5: unb_I200"""
dat_list = ['b_I10','b_I100','b_I200','unb_I10','unb_I100','unb_I200']
#d="D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP1_TRUE_MSA_PIPJAVA/execs/0.exec/output/"

d_list= []
for i in range(0,6):
    d_list.append("D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP1_TRUE_MSA_PIPJAVA/execs/"+str(i)+".exec/output/")

Tindel_0 = []
Tindel_1 = []
Tindel_2 = []
Tindel_3 = []
Tindel_4 = []
Tindel_5 = []
a = [Tindel_0,Tindel_1,Tindel_2,Tindel_3,Tindel_4,Tindel_5]

Tcount0 = []
Tcount1 = []
Tcount2 = []
Tcount3 = []
Tcount4 = []
Tcount5 = []
T_freq = [Tcount0,Tcount1,Tcount2,Tcount3,Tcount4,Tcount5]

count = 0

for i in range(0,6):
    os.chdir(d_list[i])

    for j in range(0,100):
        file = open('sim-'+str(j)+'_MSA.fasta')
        
        for line in file:
            for c in line:
                if c == '-':
                    count += 1
                if c != '-':
                    if count != 0:
                        a[i].append(count)
                        count = 0
            if count != 0:
                a[i].append(count)
                count = 0
        file.close()
       # if j == 19:
        #   break
        

            

'''True_indels = pd.DataFrame({'b_I10':Tindel_0,'b_I100':Tindel_1,'b_I200':Tindel_2,
                             'unb_I10':Tindel_3,'unb_I100':Tindel_4,'unb_I200':Tindel_5})'''

d_mJATI = 'D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP2_TEST_MSA_MiniJATAI/miniJATI_out_msa'
Inf_indel0 = []
Inf_indel1 = []
Inf_indel2 = []
Inf_indel3 = []
Inf_indel4 = []
Inf_indel5 = []
b = [Inf_indel0,Inf_indel1,Inf_indel2,Inf_indel3,Inf_indel4,Inf_indel5]

Icount0 = []
Icount1 = []
Icount2 = []
Icount3 = []
Icount4 = []
Icount5 = []
I_freq = [Icount0,Icount1,Icount2,Icount3,Icount4,Icount5]

os.chdir(d_mJATI)
count = 0

for i in range(0,6):
    for j in range(0,100):
        f = open('msa_out'+str(i)+'_'+str(j)+'.fa','r')
        t=f.read().replace('\n', '')
        l = int((len(t)-24)/8)
        for x in range(1,9):
            c = t.index('>t'+str(x))
            start = c+3
            
            for y in range(start,start+l):
                if t[y] == '-':
                    count += 1
                if t[y] != '-':
                    if count != 0:
                        b[i].append(count)
                        count = 0
            if count != 0:
                    b[i].append(count)
                    count = 0
        f.close()
        #if j == 19:
         #   break

for i in range(0,6):
    x = sorted(list(set(a[i])))
    y = sorted(list(set(b[i])))
    if x != y:
        for c in x:
            if c not in y:
                y.append(c)
                y.sort()
    if x != y:
        for c in y:
            if c not in x:
                x.append(c)
                x.sort()
        
    print(x,y)
    for k in range(len(x)):
        T_freq[i].append(a[i].count(x[k]))
        I_freq[i].append(b[i].count(y[k]))
    print(T_freq[i],I_freq[i])
        


'''Inf_indels = pd.DataFrame({'b_I10':Inf_indel0,'b_I100':Inf_indel1,'b_I200':Inf_indel2,
                             'unb_I10':Inf_indel3,'unb_I100':Inf_indel4,'unb_I200':Inf_indel5})'''

'''a_mod = a
b_mod = b
diff = []
#to check len of indel lists and calc their differences
for i in range(0,6):
    print(len(a[i]))
    print(len(b[i]))
    diff.append(abs(len(a[i])-len(b[i])))

# make the lists equal length by appending zeros
for i in range(0,6):
    if len(a[i])> len(b[i]):
        l = [0]*diff[i]
        b_mod[i].extend(l)
    elif len(b[i])> len(a[i]):
        l = [0]*diff[i]
        a_mod[i].extend(l)'''

print('Inf_MSA vs True_MSA\n')
for i in range(0,6):
    print('Chi-Square goodness of fit test'+dat_list[i])
    observed_values=scipy.array(I_freq[i])
    expected_values=scipy.array(T_freq[i])
    print(stats.chisquare(observed_values, f_exp=expected_values))
    print('\n')

""" print('Inf_MSA vs True_MSA\n')
for i in range(0,6):
    print('Kolmogorov–Smirnov test: '+dat_list[i])
    observed_values=scipy.array(I_freq[i])
    expected_values=scipy.array(T_freq[i])
    print(stats.ks_2samp(observed_values, expected_values))
    print('\n')"""

"""for i in range(0,6):
    print('Chi-square test of Independence: '+dat_list[i])
    print(stats.chi2_contingency(np.array([b_mod[i],a_mod[i]])))
    print('\n')"""
    

