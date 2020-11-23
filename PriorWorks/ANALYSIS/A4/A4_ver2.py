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
        #    break



d_mJATI = 'D:/ZHAW/1_SEMESTER1/TRACK 2/CLUSTER/PROGRESS/STEP2_TEST_MSA_MiniJATAI/miniJATI_out_msa'
Inf_indel0 = []
Inf_indel1 = []
Inf_indel2 = []
Inf_indel3 = []
Inf_indel4 = []
Inf_indel5 = []
b = [Inf_indel0,Inf_indel1,Inf_indel2,Inf_indel3,Inf_indel4,Inf_indel5]

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
       # if j == 19:
        #    break
b_mod = b
a_mod = a
diff = []
#to check len of indel lists and calc their differences
for i in range(0,6):
    print(len(a[i]))
    print(len(b[i]))
    diff.append(len(a[i])-len(b[i]))

# make the lists equal length
for i in range(0,6):
    if len(a[i])> len(b[i]):
        l = [0]*diff[i]
        b_mod[i].extend(l)
    elif len(b[i])> len(a[i]):
        l = [0]*diff[i]
        a_mod[i].extend(l)

print('Inf_MSA vs True_MSA\n')
for i in range(0,6):
    print('Chi-squared goodness-of-fit test: '+dat_list[i])
    observed_values=scipy.array(b_mod[i])
    expected_values=scipy.array(a_mod[i])
    print(scipy.stats.chisquare(observed_values, f_exp=expected_values))
    print('\n\n')

for i in range(0,6):
    print('Chi_square test of Independence: '+dat_list[i])
    print(stats.chi2_contingency(np.array([b_mod[i],a_mod[i]])))
    print('\n')
    
