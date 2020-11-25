function [mat2,idx2,mat4,I,a,flag]=swapLeftRightColumn(mat1,mat2,idx2,mat4,I,a,b)

col1=mat2(:,a);
col2=mat2(:,b);

c1=(col1~='-');
c2=(col2~='-');

common=(c1 & c2);

flag=false;
if sum(common)>0
    
    if isequal(col1(common),col2(common))
        
        [mat2,idx2,index,flagLeft]=swapColumnLeft(mat2,idx2,a,b);
        
        if flagLeft
            
            if index == a
                mat4(:,a)=mat2(:,a);
                flag=true;
            end
            
            I=equalMatrix(mat1,mat2);

%         else
%             
%             [mat2,idx2,index,flagRight]=swapColumnRight(mat2,idx2,a,b);
%             
%             if flagRight
%                 if index == a
%                     mat4(:,a)=mat2(:,a);
%                     flag=true;
%                 end
%                 I=equalMatrix(mat1,mat2);
%             end



        end
        
    end
end


