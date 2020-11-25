function recflag(node)

if node.isLeaf
    
    if node.ch == '-'
        node.allgap=1;
    else
        node.allgap=0;
    end
    
else
    
    recflag(node.Left);
    recflag(node.Right);
    
    if node.Left.allgap==1 && node.Right.allgap==1
        node.allgap=1;
    else
        node.allgap=0;
    end
end



