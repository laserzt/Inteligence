function s=mutate(s,n)
mutations=unique(randi(length(s),1,n));
s(mutations)=-s(mutations);