function all_paths=tri_tree_traversal(path,all_paths,row,col,x,y)

if ((x == row) && (y == col)) 
  %path
  all_paths=[all_paths;{path}];
  return;
end

if (y == col)
  all_paths=tri_tree_traversal([path,2],all_paths,row,col,x+1,y);
  return;
end

if (x == row)
  all_paths=tri_tree_traversal([path,3],all_paths,row,col,x,y+1);
  return;
end

all_paths=tri_tree_traversal([path,1],all_paths,row,col,x+1,y+1);
all_paths=tri_tree_traversal([path,2],all_paths,row,col,x+1,y);
all_paths=tri_tree_traversal([path,3],all_paths,row,col,x,y+1);