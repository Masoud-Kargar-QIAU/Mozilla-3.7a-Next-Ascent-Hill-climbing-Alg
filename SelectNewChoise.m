function choise1=SelectNewChoise(GraphDependency,choise,FileNumber,ClusterNumber)
field1='vector';
value1=zeros(1,FileNumber);
field2='ClusterTMCE'; 
value2=zeros(1,ClusterNumber);
field3='SumTMCE'; 
value3=zeros(1);

Choise=struct(field1,value1,field2,value2,field3,value3);
choise1(1)=Choise;
choise1.vector=choise.vector;

mat=zeros(1,2);
m=0;
for j=1:ClusterNumber
%     j
    choise1.vector=choise.vector;
    ClusterIndex1=find(choise.vector==j);
    ClusterIndex2=find(choise.vector~=j);

    G1=GraphDependency(ClusterIndex1,ClusterIndex2);

    [row,col,value]=find(G1);
    Index_Other_Cluster=unique(col);
%     [val index]=max(G1,[],2);
%      [val1 index1]=max(val);
%     selectNeighborhood=ClusterIndex2(index(index1));

     selectNeighborhood=ClusterIndex2(Index_Other_Cluster);
     [size1,size_Neighborhood]= size(selectNeighborhood);
     for i=1: size_Neighborhood
         choise1.vector=choise.vector;
          choise1.vector(selectNeighborhood(i))=j;
          choise1=CalaulateTMCE(GraphDependency,choise1,ClusterNumber);
          if choise1.SumTMCE>choise.SumTMCE
%            j
              m=1;
            break;   
          end
     end
     if m==1
         break;   
     end
end

if m~=1
choise1=choise;
end


end

