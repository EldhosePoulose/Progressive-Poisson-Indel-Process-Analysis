clc
clear all
%%
main_path='/cfs/earth/scratch/maio/bias';
bin='/cfs/earth/scratch/maio/bin/minijati/miniJATI';

type='Protein'; 
%type='DNA'; 

base_filename='run';

% log_dir='log_DNA';
% out_dir='log_DNA';
log_dir='log';
out_dir='log';

main_result_dir='results';
N=1; %Number or Iterations or Files
tree_path=strcat(main_path,'/tree/');

shdir=strcat('sh_',type); %FOlder Name 
paramsdir=strcat('params_',type); %Folder Name

%% Number of columns in MSA ie the Length of MSA (E)
cols={...
    '200'
    };
%% Intensity,I
intensities={...
    '200'
    };
%% Branch Length. Here, is it possible to add Exponential brL.. Is this file One for One tree
bl={...
    '0.10'
    };
%% Number of Taxa
leaves={...
    '8'
    };
%% Scaling Factor
factors={...
    '1'
    };
%% This Genererate the bash Script

counter=1;
for w=1:length(factors)
    
    filename=strcat(base_filename,'_',num2str(counter),'.sh');
    
    fid=fopen(filename,'w');
    fprintf(fid,'#!/bin/bash\n\n');
    for k=1:length(leaves)
        for i=1:length(bl)
            for j=1:length(cols)
                
                for z=0:N-1
                    fprintf(fid,'sbatch --partition=single --qos=single ./%s/run_%s_%s_%s_%s_%s_%s.sh\n',shdir,leaves{k},bl{i},cols{j},intensities{j},factors{w},num2str(z));
                    fprintf(fid,'sleep 0.2\n');
                end
            end
        end
    end
    
    fclose(fid);
    
    counter=counter+1;
    
end

%% Generate bash script

for k=1:length(leaves)
    for i=1:length(bl)
        for j=1:length(cols)
            for w=1:length(factors)
                for z=0:N-1
                    filename=strcat('./',shdir,'/run_',leaves{k},'_',bl{i},'_',cols{j},'_',intensities{j},'_',factors{w},'_',num2str(z),'.sh');
                    fid=fopen(filename,'w');
                    
                    fprintf(fid,'#!/bin/bash\n\n');
                    fprintf(fid,'#SBATCH --job-name=j_%s_%s_%s_%s_%s_%s\n',leaves{k},bl{i},cols{j},intensities{j},factors{w},num2str(z));
                    fprintf(fid,'#SBATCH --output=%s/%s/o_%s_%s_%s_%s_%s_%s\n',main_path,out_dir,leaves{k},bl{i},cols{j},intensities{j},factors{w},num2str(z));
                    fprintf(fid,'#SBATCH --chdir=%s/%s\n',main_path,log_dir);
                    fprintf(fid,'#SBATCH --nodes=1\n');
                    fprintf(fid,'#SBATCH --ntasks=1\n');
                   
                    if isequal(cols{j},'1000')
                        fprintf(fid,'#SBATCH --cpus-per-task=4\n');
                    elseif isequal(cols{j},'800')
                        fprintf(fid,'#SBATCH --cpus-per-task=4\n');
                    elseif isequal(cols{j},'707.11')
                        fprintf(fid,'#SBATCH --cpus-per-task=3\n');
                    elseif isequal(cols{j},'600')
                        fprintf(fid,'#SBATCH --cpus-per-task=2\n');
                    elseif isequal(cols{j},'500')
                        fprintf(fid,'#SBATCH --cpus-per-task=2\n');
                    elseif isequal(cols{j},'447.21')
                        fprintf(fid,'#SBATCH --cpus-per-task=1\n');
                    elseif isequal(cols{j},'400')
                        fprintf(fid,'#SBATCH --cpus-per-task=1\n');
                    elseif isequal(cols{j},'316.23')
                        fprintf(fid,'#SBATCH --cpus-per-task=1\n');
                    elseif isequal(cols{j},'223.61')
                        fprintf(fid,'#SBATCH --cpus-per-task=1\n');
                    elseif isequal(cols{j},'200')
                        fprintf(fid,'#SBATCH --cpus-per-task=1\n');
                    elseif isequal(cols{j},'100')
                        fprintf(fid,'#SBATCH --cpus-per-task=1\n');
                    elseif isequal(cols{j},'50')
                        fprintf(fid,'#SBATCH --cpus-per-task=1\n');
                    end
                    
                    if isequal(cols{j},'1000')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    elseif isequal(cols{j},'800')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    elseif isequal(cols{j},'707.11')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    elseif isequal(cols{j},'600')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    elseif isequal(cols{j},'500')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    elseif isequal(cols{j},'447.21')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    elseif isequal(cols{j},'400')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    elseif isequal(cols{j},'316.23')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    elseif isequal(cols{j},'223.61')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    elseif isequal(cols{j},'200')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    elseif isequal(cols{j},'100')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    elseif isequal(cols{j},'50')
                        fprintf(fid,'#SBATCH --time=0:10:00\n');
                    end
                    
                    fprintf(fid,'#SBATCH --partition=single\n');
                    fprintf(fid,'#SBATCH --qos=single\n\n');
                    fprintf(fid,'module load slurm\n\n');
                    fprintf(fid,'srun %s params=%s/%s/p_%s_%s_%s_%s_%s_%s\n',bin,main_path,paramsdir,leaves{k},bl{i},cols{j},intensities{j},factors{w},num2str(z));
                    
                    fclose(fid);
                end
            end
        end
    end
end
%% Parameter file generator

for k=1:length(leaves)
    for i=1:length(bl)
        for j=1:length(cols)
            
            E=str2double(cols{j});
            I=str2double(intensities{j});
            lambda=E*sqrt(I/E);
            mu=sqrt(I/E);
            
            for w=1:length(factors)
                
                f=str2double(factors{w});
                
                lambda_f=f*lambda;
                mu_f=f*mu;
                
                for z=0:N-1
                    
                    filename=strcat('./',paramsdir,'/p_',leaves{k},'_',bl{i},'_',cols{j},'_',intensities{j},'_',factors{w},'_',num2str(z));
                    fid=fopen(filename,'w');
                    
                    fprintf(fid,'alignment.version=ram\n');
                    fprintf(fid,'alphabet=%s\n',type);
                    fprintf(fid,'alignment=true\n');
                    fprintf(fid,'init.tree=user\n');
                    fprintf(fid,'input.sequence.sites_to_use=all\n');
                    
                    if strcmp(type,'Protein')
                        fprintf(fid,'model=PIP(model=WAG01,lambda=%f,mu=%f)\n',lambda_f,mu_f);
                    elseif strcmp(type,'DNA')
                        fprintf(fid,'model=PIP(model=K80(kappa=4.0),lambda=%f,mu=%f)\n',lambda_f,mu_f);
                    end
                    
                    fprintf(fid,'rate_distribution=Constant\n');
                    fprintf(fid,'optimization=ND-BFGS(derivatives=BFGS)\n');
                    fprintf(fid,'optimization.ignore_parameters=BrLen,Model\n');
                    fprintf(fid,'optimization.reparametrization=false\n');
                    fprintf(fid,'optimization.alignment=false\n');
                    fprintf(fid,'optimization.topology=false\n');
                    
                    seq_file=strcat(main_path,'/input/',type,'/','MSA_',leaves{k},'_',bl{i},'_',cols{j},'_',intensities{j},'/','sim-',num2str(z),'_sequence.txt');
                    in_tree_file=strcat(tree_path,'tree_',leaves{k},'_',bl{i},'.nwk');
                    
                    subdir_results=strcat(type,'/','output_',leaves{k},'_',bl{i},'_',cols{j},'_',intensities{j},'/',factors{w});
                    
                    msa_file=strcat('msa_',num2str(z),'.fa');
                    out_tree_file=strcat('tree_',num2str(z),'.nwk');
                    log_file=strcat('log_',num2str(z));
                    lk_file=strcat('lk_',num2str(z));
                    
                    fprintf(fid,'input.sequence.file=%s\n',seq_file);
                    
                    fprintf(fid,'input.tree.file=%s\n',in_tree_file);
                    
                    fprintf(fid,'output.msa.file=%s/%s/%s/fasta/%s\n',main_path,main_result_dir,subdir_results,msa_file);
                    fprintf(fid,'output.tree.file=%s/%s/%s/bidone/%s\n',main_path,main_result_dir,subdir_results,out_tree_file);
                    fprintf(fid,'output.estimates=%s/%s/%s/bidone/%s\n',main_path,main_result_dir,subdir_results,log_file);
                    fprintf(fid,'output.lk.file=%s/%s/%s/bidone/%s\n',main_path,main_result_dir,subdir_results,lk_file);
                    
                    fclose(fid);
                end
            end
        end
    end
end
