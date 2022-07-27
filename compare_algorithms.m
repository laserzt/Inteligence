function res=compare_algorithms(N,with_field,with_correlation)
if nargin<1
    N=100;
end
if nargin<2
    with_field=0;
end
if nargin<3
    with_correlation=0;
end
[J,H]=get_data(N,with_correlation,with_field);
S=greedy(J,H);
res(1)=get_value(J,H,S);
S2=recursive_algorithm(J,H,14);
res(2)=get_value(J,H,S2);