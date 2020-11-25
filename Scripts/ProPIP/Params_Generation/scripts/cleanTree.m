function cleanTree(node)

if node.isLeaf
    
    node.txt=[];
    node.prob=[];
    
else
    
    cleanTree(node.Left);
    cleanTree(node.Right);
    
    node.txt=[];
    node.prob=[];
    
end