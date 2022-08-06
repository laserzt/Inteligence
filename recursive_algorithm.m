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
if size(J,1)<=N
    S=get_best_result(J,H);
else
    subset=find_correlative_subset(J,N);
    set1=find(subset);
    set2=find(1-subset);
    [J1, H1]=get_subset_problem(J, H, set1);
    [J2, H2]=get_subset_problem(J, H, set2);
    S(set1)=get_best_result(J1,H1);
    S(set2)=recursive_algorithm(J2,H2,N);
end
if any(savedS)
    savedS(savedS==0)=S;
    S=savedS;
end