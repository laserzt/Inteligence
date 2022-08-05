function S=greedy(J,H)
v=size(J,1);
S=zeros(1,v);
while any(S==0)
    [newS,J,H]=solve_by_large_field(J,H);
    S(newS~=0)=newS(newS~=0);
    if ~any(S==0)
        return;
    end
    if all(all(J==0))
        ind=find(S==0);
        S(ind)=-sign(H(ind));
        return;
    end
    [~,maxIndex]=max(abs(J(:)));
    [s1,s2]=ind2sub(size(J),maxIndex);
    maxJSign=sign(J(s1,s2));
    if abs(H(s2))>abs(H(s1))
        s3=s1;
        s1=s2;
        s2=s3;
    end
    maxHSign=sign(H(s1));
    if maxHSign==0
        maxHSign=1;
    end
    S(s1)=-maxHSign;
    S(s2)=maxJSign*maxHSign;
    indices=[s1 s2];
    [J,H]=update_problem(J,H,indices,S(indices));
end
end

