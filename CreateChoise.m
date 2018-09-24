function choise= CreateChoise(FileNumber,ClusterNumber )
field1='vector';
value1=zeros(1,FileNumber);
field2='ClusterTMCE'; 
value2=zeros(1,ClusterNumber);
field3='MeanTMCE'; 
value3=zeros(1);

Choise=struct(field1,value1,field2,value2,field3,value3);


choise(1)=Choise;

choise.vector=randi([1,ClusterNumber],1,FileNumber);


end