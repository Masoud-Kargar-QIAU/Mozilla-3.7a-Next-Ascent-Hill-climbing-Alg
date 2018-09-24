clear
close all



%% set Parameters

% FileNumber=179;
% ClusterNumber=8;
load('D:\Mozilla\accessible\data\accessible');
ClusterNumber=8;

maxiter=3000;      % max of iteration
ConstIteration=100;


OutputNumber=8;
DirName='d:\Mozilla\accessible\output\';
OutputMoJo=strcat(DirName,'MoJo\Mozilla_accessible_NAHCD_',num2str(OutputNumber),'.rsf');
OutputPreRecall=strcat(DirName,'PreRecall\BestPop_NAHCD_',num2str(OutputNumber));


FigureDir=strcat(DirName,'Figure\NAHCD\',num2str(OutputNumber));
mkdir(FigureDir);


%% initialization

BEST=zeros(maxiter,1);
MEAN=zeros(maxiter,1);
ClusterValue=zeros(maxiter,ClusterNumber);


field1='vector';
value1=zeros(1,FileNumber);
field2='ClusterTMCE'; 
value2=zeros(1,ClusterNumber);
field3='SumTMCE'; 
value3=zeros(1);


Choise=struct(field1,value1,field2,value2,field3,value3);
select(1)=Choise;

%% create population 
choise=CreateChoise(FileNumber,ClusterNumber);

%% main loop

choise=CalaulateTMCE(GraphDependency,choise,ClusterNumber);

for iter=1:maxiter

    choise1=SelectNewChoise(GraphDependency,choise,FileNumber,ClusterNumber);
%     choise1.MeanTMCE
    if choise1.SumTMCE == choise.SumTMCE
        break;
    else
        choise=choise1;
    end

    
 BEST(iter)=choise.SumTMCE;
 MEAN(iter)=mean([choise.SumTMCE]);
 ClusterValue(iter,:)=ShowClusterCount(choise1.vector,ClusterNumber);

 disp([ ' Iter = '  num2str(iter)  ' BEST = '  num2str(BEST(iter))]);
 %disp(ShowClusterCount( gpop.chromozone ,ClusterNumber));
 
end
%%
iter=iter-1;
field1='chromozone';
value1=zeros(1,FileNumber);
field2='chromozonefitness'; 
value2=zeros(1);


gpop=struct(field1,value1,field2,value2);

gpop.chromozone=choise.vector;
gpop.chromozonefitness=choise.SumTMCE;

%% results
save(OutputPreRecall,'gpop'); 




%%
%%create mojo file 
 
 fileID=fopen(OutputMoJo,'w');
 for i=1 :FileNumber
     d= choise.vector(i);
  fprintf(fileID,'contain %d    %s \r\n',d ,FileNames{i});   
     
     
 end
fclose(fileID);



%%





disp(' ')
disp([ ' Best par = '  num2str(gpop.chromozone)])
disp([ ' Best fitness = '  num2str(gpop.chromozonefitness)])

FileName=char(strcat(FigureDir,'\BestChromozone.txt'));
v1=gpop.chromozone;
v2=gpop.chromozonefitness;
save(FileName,'v1','v2','ClusterNumber','-ascii'); 

%

h=figure(1);
plot(BEST(1:iter),'r','LineWidth',2)
hold on
plot(MEAN(1:iter),'b','LineWidth',2)

xlabel('Iteration')
ylabel(' Fitness')
legend('BEST','MEAN')
title('GA for Dependency Analysis')

FileName=char(strcat(FigureDir,'\ClusterBest'));
saveas(h,FileName,'jpg');
set(h, 'Visible', 'off');


Color1=rand(ClusterNumber,3);

for i=1:ClusterNumber
h1=figure('visible','off');


plot(ClusterValue(1:iter,i),'Color', Color1(i,:),'LineWidth',1)
hold on
xlabel('Iteration')
ylabel(' Cluster number')

legend(strcat('Cluster', num2str(i)))


title('Cluster number in GA for Dependency Analysis')

FileName=char(strcat(FigureDir,'\Cluster',num2str(i)));
saveas(h1,FileName,'jpg');

[Adj,Ids]=NewShowFileIndexCount(GraphDependency, FileNames,gpop.chromozone ,i);
f= BioGraphViewer (Adj,Ids);
FileName1=char(strcat(FigureDir,'\ClusterIn',num2str(i),'.jpg'));
print(f, '-djpeg', FileName1);
end

