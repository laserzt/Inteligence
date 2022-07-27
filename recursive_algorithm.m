function S=recursive_algorithm(J,H,N)
[S,J,H]=solve_by_large_field(J,H);
savedS=S;
if any(S)
    if all(S~=0)
        return;
    end
    [J, H]=get_subset_problem(J, H, find(S==0));
    S(S~=0)=[];
end
if size(J,1)>N
    subset=find_subset(J,N);
end
if size(J,1)<=N || all(subset) 
    S=get_best_result(J,H);
else
    set1=find(subset);
    set2=find(1-subset);
    [J1, H1]=get_subset_problem(J, H, set1);
    [J2, H2]=get_subset_problem(J, H, set2);
    S(set1)=recursive_algorithm(J1,H1,N);
    S(set2)=recursive_algorithm(J2,H2,N);
end
if any(savedS)
    savedS(savedS==0)=S;
    S=savedS;
end
end

function subset=find_subset(J,N)
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
end