function S=get_best_result(J,H)
v=size(J,1);
S=de2bi(0:2^v-1,v)*2-1;
res=zeros(1,v);
for i=1:size(S,1)
    res(i)=get_value(J,H,S(i,:));
end
[~,ind]=min(res);
S=S(ind,:);