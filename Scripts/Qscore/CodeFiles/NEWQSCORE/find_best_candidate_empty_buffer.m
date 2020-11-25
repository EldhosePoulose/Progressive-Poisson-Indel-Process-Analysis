function [mat2,idx2,mat4,last_pos_2,I,flag_empty_buffer]=find_best_candidate_empty_buffer(x,mat1,mat2,idx2,mat4,last_pos_2,I,flag_empty_buffer)

for i=1:length(x)
    
    pos2=x(i);
    
    if pos2 < last_pos_2+1
        
        error('ERROR')
        
    elseif pos2 == last_pos_2+1
        
        mat4(:,last_pos_2+1)=mat2(:,pos2);
        last_pos_2=last_pos_2+1;
        
        return;
        
    elseif pos2 > last_pos_2+1
        
        [bool,type]=gapsBetweenTwoCols(mat2,last_pos_2+1,pos2);
        
        if bool
            
            if type==1
                
                %----------------------------------------%
                mat2=swapcolumns(mat2,pos2,last_pos_2+1);
                idx2=swapcolumns(idx2,pos2,last_pos_2+1);
                %----------------------------------------%
                
            elseif type==2
                
                %----------------------------------------%
                a=last_pos_2+1;
                b=pos2;
                for ii=b-1:-1:a
                    mat2=swapcolumns(mat2,ii,ii+1);
                    idx2=swapcolumns(idx2,ii,ii+1);
                end
                %----------------------------------------%
                
            end
            
            mat4(:,last_pos_2+1)=mat2(:,last_pos_2+1);
            last_pos_2=last_pos_2+1;
            I=equalMatrix(mat1,mat2);
            
            return;
        else
            
            a=last_pos_2+1;
            b=pos2;
            
            [mat2,idx2,mat4,I,a,flag]=swapLeftRightColumn(mat1,mat2,idx2,mat4,I,a,b);
            
            if flag
                last_pos_2=a;
                return;
            end
            
        end
        
    end
    
end

flag_empty_buffer=false;


