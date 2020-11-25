function [mat,idx,index,flag]=swapColumnLeft(mat,idx,col_index_1,col_index_2)

flag=false;
index = [];
%%
flag_all=true;
tmp_mat=mat(:,col_index_1:col_index_2);
tmp_idx=idx(:,col_index_1:col_index_2);
a=1;
b=col_index_2-col_index_1+1;
for i=b-1:-1:a
    
    bool = gapsBetweenTwoCols(tmp_mat,i,i+1);
    if bool
        tmp_mat=swapcolumns(tmp_mat,i,i+1);
        tmp_idx=swapcolumns(tmp_idx,i,i+1);
    end
    
    flag_all = flag_all & bool;
    
end
%%
if flag_all
    
    flag=true;
    index=col_index_1;
    
    mat(:,col_index_1:col_index_2)=tmp_mat;
    idx(:,col_index_1:col_index_2)=tmp_idx;
    
end
