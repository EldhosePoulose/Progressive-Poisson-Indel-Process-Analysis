function [Inf_I_count1,stat1,Inf_I_pcount1,stat2]= IndelLengthdistNoiseout(path,fileName)
    Inf_I_Path1= path; 
    addpath(Inf_I_Path1)
    %% Readin all Inferred MSAs
    % MSAs
    Inf_I_files1= dir(fullfile(Inf_I_Path1,'*.fasta'));
    Inf_I_Names1= {Inf_I_files1.name};
    tk_i1= regexp(Inf_I_Names1,fileName,'match');
    % strcat('((?<=',fileName1,')\d*)','|((?<=',fileName2,'))')
    [~,ti1]= sortrows(str2double(cat(1,tk_i1{:})));
    Inf_I_Names1= Inf_I_Names1(ti1); 
    nIter_I1= length(Inf_I_Names1);
    
    %% Indel Length Distribution
    count=0;
    pcount=0;
    Inf_I_count1= [];
    Inf_I_pcount1= [];
    for namesI1=1:nIter_I1
      Inf_I_MSA1= fastaread(Inf_I_Names1(namesI1));
      for nTaxa=1:length(Inf_I_MSA1)
          % char is returned as cell so we re transform it here in next
          % line of code 
          Inf_I_MSA1(nTaxa).Sequence= char(XSequenceGenerator(Inf_I_MSA1(nTaxa).Sequence));
          for seqL=1:length(Inf_I_MSA1(nTaxa).Sequence)-1
              if Inf_I_MSA1(nTaxa).Sequence(seqL) ~= Inf_I_MSA1(nTaxa).Sequence(seqL+1)
                  if count==0
                      if Inf_I_MSA1(nTaxa).Sequence(seqL)=='-'
                          count=count+1;
                      end
                  else
                      if Inf_I_MSA1(nTaxa).Sequence(seqL)=='-'
                          count=count+1;
                      else
                          pcount= pcount+1;
                      end
                  end
              else
                  if count==0
                      if Inf_I_MSA1(nTaxa).Sequence(seqL)=='-'
                          count=count+1;
                      end
                  elseif Inf_I_MSA1(nTaxa).Sequence(seqL)~='-'
                      Inf_I_count1= [Inf_I_count1,count];
                      Inf_I_pcount1= [Inf_I_pcount1,pcount];
                      pcount=0;
                      count=0;
                  elseif Inf_I_MSA1(nTaxa).Sequence(seqL)=='-'
                      count=count+1;
                  end
              end
          end
          if Inf_I_MSA1(nTaxa).Sequence(seqL+1)~='-'
              if count~=0
                  Inf_I_count1= [Inf_I_count1,count];
                  Inf_I_pcount1= [Inf_I_pcount1,pcount];
                  pcount=0;
                  count=0;
              end
          elseif Inf_I_MSA1(nTaxa).Sequence(seqL+1)=='-'
              count=count+1;
              Inf_I_count1= [Inf_I_count1,count];
              Inf_I_pcount1= [Inf_I_pcount1,pcount]; 
              pcount=0;
              count=0;
          end
      end
      fprintf("XIndel,Noise length Extraction...now:%d\n",namesI1)
    end
    stat1{1}= [length(Inf_I_count1),max(Inf_I_count1),mean(Inf_I_count1),median(Inf_I_count1),std(Inf_I_count1)];
    stat2{1}= [length(Inf_I_pcount1),max(Inf_I_pcount1),mean(Inf_I_pcount1),median(Inf_I_pcount1),std(Inf_I_pcount1)];
end

