function S = hill_climbing(J, H, n, time, S)
if nargin<4
    time=60;
end
if nargin<3
    n=2;
end
v=size(J,1);
if nargin<2
    H=zeros(1,v);
end
if nargin<5
    S=get_random_solution(v,1);
end
S_value = get_value(J, H, S);
t0 = clock;
while etime(clock, t0) < time
    current_S=mutate(S,n);
    current_value=get_value(J,H,current_S);
    if current_value < S_value
        S = current_S;
        S_value=current_value;
    end
end