clc
clear all
close all
%%
N=50;
leaves='MSA8';
intensity='I5';
br_lenJ='t0.10';
br_len='t0.1';
%%
cols={...
    '300_v1'
    };
%%
factors={...
    '1.00'
    };
%%
for k=1:length(cols)
    
    for i=1:length(factors)
        
        filenameS = strcat('./scores/score_',leaves,'_',intensity,'_',br_len,'_',cols{k},'_',factors{i});
        
        fid=fopen(filenameS,'w');
        
        for j=0:N-1
            filename1=strcat('../javaPIP/',leaves,'/',intensity,'/',br_lenJ,'/',cols{k},'/output/sim-',num2str(j),'_MSA.fasta');
            filename2=strcat('../castor/',leaves,'/',intensity,'/',br_len,'/',cols{k},'/',factors{i},'/fasta/msa_',num2str(j),'.fa');
            correct=myScoreMSA(filename1,filename2);
            fprintf(fid,'%f\n',correct);
        end

        fclose(fid);
        
    end
    
end






