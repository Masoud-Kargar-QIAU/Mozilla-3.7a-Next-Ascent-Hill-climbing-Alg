function [ s, p ] = ClusterCoordinate( s,p )
ss=unique(s);
for i=1:length(ss)
count_s(i)=sum (s==ss(i));
end

pp=unique(p);
for i=1:length(pp)
count_p(i)=sum (p==pp(i));
end
z(1,:)=s;
z(2,:)=p;
Co=zeros(8);
for i=1:179
    n=find(ismember(pp,z(2,i)));
    m=s(i);
   Co(n,m)=Co(n,m) +1; 
end

k=1;
for i=1:8
  for j=1:8
    if Co(i,j) ~=0
      Mat(1,k)=pp(i);
      Mat(2,k)=j;
      Mat(3,k)=Co(i,j);
      k= k+1;
    end
  end

end

[MM , ind]=sort(Mat(3,:),'descend');
Mat=Mat(:,ind);

CON=zeros(3,8);

[B,N,U]=unique(Mat(:,:),'first'); 

for j=1:length(pp)
      
    [V,I]=find(Mat(1,:)== pp(j));
 
  

    CON(1,j)=Mat(1,I(1));
    CON(2,j)=Mat(2,I(1));
    CON(3,j)=Mat(3,I(1));
    Mat(:,I)=[];
    [V,I]=find(Mat(2,:)==CON(2,j));
    Mat(:,I)=[];
  end
  k=1;
i=1;


end

