function [mat3,mat4]=myScoreMSA(filename1,filename2)

msa1=fastaread(filename1);
msa2=fastaread(filename2);
%%
msa2=sortMSA(msa1,msa2);
mat1=msa2matrix(msa1);
mat2=msa2matrix(msa2);
%%
idx1=mat2idx(mat1);
idx2=mat2idx(mat2);
%%
[mat1,~]=reorderMSA(mat1,idx1)
[mat2,~]=reorderMSA(mat2,idx2)
%%
colX=repmat('X',[size(mat1,1),1]);
mat1=[colX,mat1,colX];
mat2=[colX,mat2,colX];
idx1=mat2idx(mat1);
idx2=mat2idx(mat2);
%%
len1=size(mat1,2);
%%
I=equalMatrix(mat1,mat2);
%%
mat3=char(zeros(size(mat1)));
mat4=char(zeros(size(mat2)));

flag_empty_buffer=true;
last_pos_2=0;
for pos1=1:len1
    
    r1=I(pos1,:);
    
    mat3(:,pos1)=mat1(:,pos1);
        
    x=find(r1==1);
    
    if isempty(x)
        flag_empty_buffer=false;
    else
        
        x(x <= last_pos_2)=[];
        
        if isempty(x)
            flag_empty_buffer=false;
        else
            
            if flag_empty_buffer
                [mat2,idx2,mat4,last_pos_2,I,flag_empty_buffer]=...
                    find_best_candidate_empty_buffer(x,mat1,mat2,idx2,mat4,last_pos_2,I,flag_empty_buffer);
            else
                idx_col1=idx1(:,pos1);
                [mat2,idx2,mat4,last_pos_2,I,flag_empty_buffer]=...
                    find_best_candidate(x,mat1,mat2,idx_col1,idx2,mat4,pos1,last_pos_2,I,flag_empty_buffer);
            end
                        
        end
        
    end
    
end

mat3=mat3(:,2:end-1);
mat4=mat4(:,2:end-1);

%[score,coordX,coordY]=scoreBlocks(mat3,mat4);
%correct=score/size(mat3,2);


