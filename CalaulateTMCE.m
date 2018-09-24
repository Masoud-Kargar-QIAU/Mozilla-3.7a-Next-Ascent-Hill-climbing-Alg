 
function choise=CalaulateTMCE(GraphDependency,choise,ClusterNumber)


mat=zeros(1,ClusterNumber);



 for j=1:ClusterNumber
    ClusterIndex=find(choise.vector==j);
    [~,B]=size(ClusterIndex);
    mat(j,1:B)=ClusterIndex;
 end





    for j=1:ClusterNumber
        x= reshape (mat(j,:),1,[]);
        SubGraphMatrixIndex=(x~=0);
        G1=GraphDependency(SubGraphMatrixIndex,SubGraphMatrixIndex);
        InternalLinkSum=sum(G1(:))/2;

        G2=GraphDependency;
        G2(SubGraphMatrixIndex,SubGraphMatrixIndex)=0;
        G3=G2(SubGraphMatrixIndex,:);
        ExtenalLinkSum=sum(G3(:));
        
        choise.ClusterTMCE(j)=(2*InternalLinkSum)/(2*InternalLinkSum + ExtenalLinkSum);
    
    end
    choise.SumTMCE=sum(choise.ClusterTMCE(:)); 
end



  











