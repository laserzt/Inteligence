function subset=find_correlative_subset(J,N)
v=size(J,1);
subset=zeros(1,v);
subset(randi(v))=1;
while sum(subset)<N
    rest=find(1-subset);
    [~,ind]=max(sum(abs(J(find(subset),rest)),1));
    subset(rest(ind))=1;
end