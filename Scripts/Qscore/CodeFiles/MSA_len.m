
%% Length of TRUE MSAs 

%INDELible
for namesI=1:nIter_I
    True_I_MSA= fastaread(True_I_Names(namesI));
    TrueL_I(namesI)= length(True_I_MSA(1,1).Sequence);
end
%PIPJava
for namesP=1:nIter_P
    True_P_MSA= fastaread(True_P_Names(namesP));
    TrueL_P(namesP)= length(True_P_MSA(1,1).Sequence);
end
%real
for namesr=1:nIter_r
    True_r_MSA= fastaread(True_r_Names(namesr));
    TrueL_r(namesr)= length(True_r_MSA(1,1).Sequence);
end


%% Length of MAFFT Inferred MSAs 

%INDELible
for namesIi=1:nIter_Ii
    Inf_I_MSA= fastaread(Inf_I_Names(namesIi));
    InfL_I(namesIi)= length(Inf_I_MSA(1,1).Sequence);
end
%PIPJava
for namesPp=1:nIter_Pp
    Inf_P_MSA= fastaread(Inf_P_Names(namesPp));
    InfL_P(namesPp)= length(Inf_P_MSA(1,1).Sequence);
end
%real
for namesrr=1:nIter_rr
    Inf_r_MSA= fastaread(Inf_r_Names(namesrr));
    InfL_r(namesrr)= length(Inf_r_MSA(1,1).Sequence);
end

%% Length of Average TRUE Gaps / MSA

%INDELible
for namesI=1:nIter_I
    True_I_Gap= fastaread(True_I_Names(namesI));
    
%     TrueL_I_Gap(namesI)= length(True_I_Gap(1,1).Sequence);
end
%PIPJava
for namesP=1:nIter_P
    True_P_Gap= fastaread(True_P_Names(namesP));
%     TrueL_P_Gap(namesP)= length(True_P_Gap(1,1).Sequence);
end
%real
for namesr=1:nIter_r
    True_r_Gap= fastaread(True_r_Names(namesr));
%     TrueL_r_Gap(namesr)= length(True_r_Gap(1,1).Sequence);
end


%% Length of MAFFT Inferred Gaps / MSA

%INDELible
for namesIi=1:nIter_Ii
    Inf_I_Gap= fastaread(Inf_I_Names(namesIi));
%     InfL_I_Gap(namesIi)= length(Inf_I_Gap(1,1).Sequence);
end
%PIPJava
for namesPp=1:nIter_Pp
    Inf_P_Gap= fastaread(Inf_P_Names(namesPp));
%     InfL_P_Gap(namesPp)= length(Inf_P_Gap(1,1).Sequence);
end
%real
for namesrr=1:nIter_rr
    Inf_r_Gap= fastaread(Inf_r_Names(namesrr));
%     InfL_r_Gap(namesrr)= length(Inf_r_Gap(1,1).Sequence);
end



