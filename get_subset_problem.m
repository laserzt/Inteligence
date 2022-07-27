function [out_J, out_H]=get_subset_problem(J, H, subset)
v=size(J,1);
out_J=J(subset,subset);
removed_set=1:v;
removed_set(subset)=[];
out_H=H(subset)+sum(J(removed_set,subset),1);
end