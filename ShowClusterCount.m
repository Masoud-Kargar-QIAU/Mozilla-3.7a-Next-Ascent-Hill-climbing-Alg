function   [CLusterCount]=ShowClusterCount( chromozone ,ClusterNumber)
for i=1:ClusterNumber
index= find(chromozone==i);
[~,CLusterCount(1,i)]=size(index);
end
end

