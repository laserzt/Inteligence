function s=mutate(s,n)
mutations=unique(randi(length(s),n));
s(mutations)=-s(mutations);