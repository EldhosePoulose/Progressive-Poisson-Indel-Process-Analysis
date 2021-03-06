function right_coord_filter=multiresSTFT(ck_idx,right_coord_filter,range,sizeH,FIR,L,v1,v2,p1,p2,c1,c2,delta,numRefinement)

for i=1:size(ck_idx,1)
    
    %minck1=coords(i,1);
    %minck2=coords(i,2);
    minck1=range(right_coord_filter(i,1));
    minck2=range(right_coord_filter(i,2));
    
    sizeH2=sizeH;
    delta2=delta;
    ck = ck_idx(i);
    
    for j=1:numRefinement
        
        sizeH2 = sizeH2/2;
        delta2 = ceil(delta2/2);
        
        [w_ori,scale,~]=getSTFTfilter(FIR,L,sizeH2,delta);
                
        consecutive = 1;
        backstep = 0;
        
        cw1 = min([minck1+backstep,L]);
        cw2 = max([minck2-backstep,1]);
        
        if cw1>cw2
            cw1=minck1;
            cw2=minck2;
        end
        
        % LEFT boundary
        [minck1,~] = refine_coords_block(...
            cw1,...
            ck,...
            L,...
            v1,...
            v2,...
            p1,...
            p2,...
            c1,...
            c2,...
            sizeH2,...
            delta2,...
            consecutive,...
            w_ori,...
            scale);
        
        % RIGHT boundary
        [minck2,~] = refine_coords_block(...
            cw2,...
            ck,...
            L,...
            v1,...
            v2,...
            p1,...
            p2,...
            c1,...
            c2,...
            sizeH2,...
            delta2,...
            consecutive,...
            w_ori,...
            scale);
         
    end
    
    right_coord_filter(i,:)=[minck1,minck2];
    
end