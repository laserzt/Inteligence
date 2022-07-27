function S=greedy(J,H)
v=size(J,1);
S=zeros(1,v);
while any(S==0)
    if all(all(J==0))
        ind=find(S==0);
        S(ind)=-sign(H(ind));
        return;
    end
    [~,maxIndex]=max(abs(J(:)));
    [s1,s2]=ind2sub(size(J),maxIndex);
    maxJSign=sign(J(s1,s2));
    S(s1)=1;
    S(s2)=-maxJSign;
    indices=[s1 s2];
    [J,H]=update_problem(J,H,indices,S(indices));
    [newS,J,H]=solve_by_large_field(J,H);
    S(newS~=0)=newS(newS~=0);
end
end

