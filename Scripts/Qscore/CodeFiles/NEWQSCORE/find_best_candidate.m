function [mat2,idx2,mat4,last_pos_2,I,flag_empty_buffer]=find_best_candidate(x,mat1,mat2,idx_col1,idx2,mat4,pos1,last_pos_2,I,flag_empty_buffer)

num_equal_char=0*x;
idx_col1_nan=idx_col1;
idx_col1_nan(idx_col1_nan==0)=NaN;
for i=1:length(x)
    pos2=x(i);
    idx_col2=idx2(:,pos2);
    idx_col2_nan=idx_col2;
    idx_col2_nan(idx_col2_nan==0)=NaN;
    num_equal_char(i)=sum(idx_col1_nan == idx_col2_nan);
end

[val,index]=max(num_equal_char);

pos2=x(index);

if val>0
    if gapsBetweenTwoCols(mat2,last_pos_2+1,pos2)
        mat2=swapcolumns(mat2,pos2,last_pos_2+1);
        idx2=swapcolumns(idx2,pos2,last_pos_2+1);
        mat4(:,last_pos_2+1)=mat2(:,last_pos_2+1);
        last_pos_2=last_pos_2+1;
        I=equalMatrix(mat1,mat2);
        
        return
    else
        mat4(:,last_pos_2+1:pos2)=mat2(:,last_pos_2+1:pos2);
        last_pos_2=pos2;
        flag_empty_buffer=true;
    end
end 

