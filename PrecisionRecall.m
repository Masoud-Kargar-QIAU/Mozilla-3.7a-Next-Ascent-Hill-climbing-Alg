function  [precision, Recall, Fm]=PrecisionRecall( )
load('D:\Mozilla\accessible\output\PreRecall\BestPop_NAHCD_1');
load('D:\Mozilla\accessible\Data\special\bestclusterAccessible');
s=gpop.chromozone;
p=bestcluster;
[precision, Recall, Fm] = ClusterPreRecall( s,p );


end

