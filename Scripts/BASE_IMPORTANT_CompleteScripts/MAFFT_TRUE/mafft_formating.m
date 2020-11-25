clc
clear all

%%
nIter=1;
% Trees
treePath= '/Users/pouloeld/Desktop';
treefiles= dir(fullfile(treePath,'*.nwk'));
alltreeNames= {treefiles.name};
tk= regexp(alltreeNames,'((?<=tree_8_0.)\d*)','match');
[~,tii]= sortrows(str2double(cat(1,tk{:})));
alltreeNames= alltreeNames(tii);

% Sequences
SeqPath= '/Users/pouloeld/Desktop';
Seqfiles= dir(fullfile(SeqPath,'*.fasta'));
allSeqNames= {Seqfiles.name};
mk= regexp(allSeqNames,'((?<=out_)\d*)|((?<=_TRUE1))','match');
[~,mii]= sortrows(str2double(cat(1,mk{:})));
allSeqNames= allSeqNames(mii);

%%

for k=1:nIter
    %% Transform Tree Labels
    
    filenameTREE= char(alltreeNames(k));
    fid_tree= fopen(filenameTREE,'r');
    tr2= fgets(fid_tree);    
    seqLabels= {'leaf_0','leaf_1','leaf_2','leaf_3','leaf_4','leaf_5','leaf_6','leaf_7'};
    leafLabels= {'t1','t2','t3','t4','t5','t6','t7','t8'};
    new_leafLabels= {'1','2','3','4','5','6','7','8'};
    %nodeLables= {'internal_0','internal_1','internal_2','internal_3','internal_4','internal_5','root'};
    
    for i=1:length(leafLabels)
        tr2= strrep(tr2,leafLabels{i},new_leafLabels{i});
    end
    fid_T= fopen("tree_8_0.10.newick",'w');
    fprintf(fid_T,tr2);
    fclose(fid_T);
    fclose(fid_tree);
    
    %% Transform Sequence Labels
    
    f_Seq= fastaread(char(allSeqNames(k)));
    
    for i=1:8
        for t=1:8
            if strcmp(f_Seq(i,1).Header,seqLabels{t})
                disp(f_Seq(i,1).Header)
                f_Seq(i,1).Header=new_leafLabels{t};
                disp(f_Seq(i,1).Header)
            end
        end
    end
    fastawrite("out_0_TRUE.fasta",f_Seq)


end





