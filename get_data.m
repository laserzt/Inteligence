function [J,H]=get_data(N,with_correlation,with_field)
if nargin<2
    with_correlation=0;
end
if nargin<3
    with_field=0;
end
if with_correlation
    corr=rand(N,N);
    corr=corr*corr';
else 
    corr=eye(N);
end
J=triu(mvnrnd_(zeros(1,N),corr,N));
J=J-diag(diag(J));
J=J'+J;
if with_field
    H=(rand(1,N)-0.5)*0.01;
else
    H=zeros(1,N);
end