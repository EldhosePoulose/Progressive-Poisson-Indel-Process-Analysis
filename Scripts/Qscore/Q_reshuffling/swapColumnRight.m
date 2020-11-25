function [mat,idx,index,flag]=swapColumnRight(mat,idx,col_index_1,col_index_2)

flag=false;
index=[];
for i=col_index_1:col_index_2-1
    
    if gapsBetweenTwoCols(mat,i,i+1)
        index=i+1;
        mat=swapcolumns(mat,i,i+1);
        idx=swapcolumns(idx,i,i+1);
        flag=true;
    end
    
end
