
import os
import io
import math
os.chdir("C:/jithis_drive/zhaw/ACLS/Master_thesis/job/earth_cluster/mJATI_sims/mu=0.0707/bal_8taxa/batch/params/")

#creating lambda,mu values
lamda_ = []
mu_ = []

I_start = 0.5
E_start = 100
for e in range(100,2100,100):
    I = I_start * (e/E_start)
    lamda = e * math.sqrt(I/e)
    mu = math.sqrt(I/e)
    lamda_.append(lamda)
    mu_.append(mu)

E = [100,200,300,400,500,600,700,800,900,1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,2500,3000]
#f = io.open('file.txt', 'w', newline='\n')
i = 0
for e in range(100,2100,100):
    for j in range(0,50):
        f = io.open("paramsE"+str(e)+"_"+str(j),"w",newline='\n')
        f.write("alphabet=DNA\nalignment=true\n")
        f.write("init.tree=user\ninput.sequence.sites_to_use=all\n")
        
        f.write("model=PIP(model=K80(kappa=4.0),lambda="+str(lamda_[i])+",mu="+str(mu_[i])+")\n")
        
        f.write("rate_distribution=Constant\n")
        f.write("optimization=ND-BFGS(derivatives=BFGS)\n")
        f.write("optimization.ignore_parameters=BrLen,Model\n")
        f.write("optimization.reparametrization=false\n")
        f.write("optimization.alignment=false\n")
        f.write("optimization.topology=false\n")
        f.write("input.sequence.file=/cfs/earth/scratch/peec/mJATI_sims/mu=0.0707/bal_8taxa/execs/E"+str(e)+"/output/sim-"+str(j)+"_sequence.txt\n")
        f.write("input.tree.file=/cfs/earth/scratch/peec/mJATI_sims/mu=0.0707/bal_8taxa/trees/ultrametric_tree_b0.1.nwk\n")
                
        f.write("output.msa.file=/cfs/earth/scratch/peec/mJATI_sims/mu=0.0707/bal_8taxa/m_output/msa_outE"+str(e)+"_"+str(j)+".fa\n")
        f.write("output.tree.file=/cfs/earth/scratch/peec/mJATI_sims/mu=0.0707/bal_8taxa/m_output/trees/tree_outE"+str(e)+"_"+str(j)+".nwk\n")
        f.write("output.estimates=/cfs/earth/scratch/peec/mJATI_sims/mu=0.0707/bal_8taxa/m_output/log_files/logE"+str(e)+"_"+str(j)+"\n")
        f.write("output.lk.file=/cfs/earth/scratch/peec/mJATI_sims/mu=0.0707/bal_8taxa/m_output/lk/lk_E"+str(e)+"_"+str(j)+".dat")
        f.close()
    i += 1
    
        

