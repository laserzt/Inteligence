function subset=find_correlative_subset(J,N)
v=size(J,1);
subset=zeros(1,v);
subset(randi(v))=1;
while sum(subset)<N
    rest=find(1-subset);
    [improvement, index]=max(sum(abs(J(find(subset),rest)),1)-sum(abs(J(rest,rest)),1));
    if improvement>0
        subset(rest(index))=1;
    else
        subset(rest(randi(length(rest))))=1;
    end
end