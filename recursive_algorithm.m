function S=recursive_algorithm(J,H,N)
if size(J,1)<=N
    S=get_best_result(J,H);
else
    subset=find_correlative_subset(J,N);
    set1=find(subset);
    set2=find(1-subset);
    [J1, H1]=get_subset_problem(J, H, set1);
    [J2, H2]=get_subset_problem(J, H, set2);
    S=zeros(1,size(J,1));
    S(set1)=get_best_result(J1,H1);
    S(set2)=recursive_algorithm(J2,H2,N);
end