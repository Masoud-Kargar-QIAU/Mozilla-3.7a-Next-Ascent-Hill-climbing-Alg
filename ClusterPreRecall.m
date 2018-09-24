function [precision, Recall, Fm] = ClusterPreRecall( s,p )
[~,S1]=size(s);
[~,S2]=size(p);
if S1==S2

PairClusterExpert=zeros(S1,S1);
PairClusterMe=zeros(S1,S1);
for i=1:S1-1
    for j=i+1:S1
        if s(i)==s(j)
            PairClusterExpert(i,j)=1;
        end
    end   
end

% SumPairClusterExpert=sum(PairClusterExpert(:));



for i=1:S1-1
    for j=i+1:S1
        if p(i)==p(j)
            PairClusterMe(i,j)=1;
        end
    end   
end
% SumPairClusterMe=sum(PairClusterMe(:));
%%
A=0;
B=0;
C=0;
for i=1:S1-1
    for j=i+1:S1
        if PairClusterMe(i,j)==1 && PairClusterExpert(i,j)==1
            A=A+1;
        end
        
        if PairClusterMe(i,j)==0 && PairClusterExpert(i,j)==1
            B=B+1;
        end
        if PairClusterMe(i,j)==1 && PairClusterExpert(i,j)==0
            C=C+1;
        end
        
    end
end

precision=A/(A+C);
Recall=A/(A+B);
Fm=(2*precision*Recall)/(precision+Recall);
else
   pause; 
end





end

