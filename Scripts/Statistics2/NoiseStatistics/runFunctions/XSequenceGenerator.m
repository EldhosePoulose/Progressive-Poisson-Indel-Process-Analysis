function [Sequence]= XSequenceGenerator(Sequence)
AA= {'A','R','N','D','C','Q','G','E','H','I','L','K','M','F','P','S','T','W','Y','V'};

for i=1:length(AA)
    Sequence= strrep(Sequence,AA(i),'X');
    
end