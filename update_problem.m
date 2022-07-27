function [J,H]=update_problem(J,H,indices,values)
H=H+values*J(indices,:);
H(indices)=0;
J(indices,:)=0;
J(:,indices)=0;
end