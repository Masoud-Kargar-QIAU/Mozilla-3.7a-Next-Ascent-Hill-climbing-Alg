function   [Adj,Ids]=NewShowFileIndexCount(SemanticGraph, AllFileNames,chromozone ,SpeceficCluster)


indexes=find(chromozone==SpeceficCluster);
[~,CountFile]=size(indexes);

Adj=zeros(CountFile,CountFile);

Newindexes=indexes(1,:) ;

Adj=SemanticGraph(Newindexes,Newindexes);
Ids=AllFileNames(Newindexes);
end


