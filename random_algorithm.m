function best_S = random_algorithm(J, H, time)
if nargin<3
    time=60;
end
v=size(J,1);
if nargin<2
    H=zeros(1,v);
end
S=get_random_solution(v,1);
best_value = get_value(J, H, S);
best_S=S;
t0 = clock;
while etime(clock, t0) < time
    S=get_random_solution(v,1);
    S_value = get_value(J, H, S);
    if S_value < best_value
        best_S=S;
        best_value=S_value;
    end
end