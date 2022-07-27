function [S,J,H]=solve_by_large_field(J,H)
S=zeros(1,size(J,1));
while 1
    indices=find(S==0);
    [maxH,index]=max(abs(H(indices)));
    index=indices(index);
    medianJ=median(nonzeros(abs(J(:))));
    if maxH > medianJ
        S(index)=-sign(H(index));
        [J,H]=update_problem(J,H,index,S(index));
    else
        return;
    end
end
end