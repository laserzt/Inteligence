function best_S = hill_climbing_with_random_skips(J, H, n, steps, time)
if nargin<5
    time=60;
end
if nargin<4
    steps=10e3;
end
if nargin<3
    n=2;
end
v=size(J,1);
if nargin<2
    H=zeros(1,v);
end
S=get_random_solution(v,1);
best_S=S;
S_value = get_value(J, H, S);
best_value=S_value;
t0 = clock;
step=0;
while etime(clock, t0) < time
    step=step+1;
    current_S = mutate(S,n);
    current_value = get_value(J,H,current_S);
    if current_value < S_value
        S = current_S;
        S_value=current_value;
        if S_value<best_value
            best_S=S;
            best_value=S_value;
        end
    end        
    if step==steps
        S=get_random_solution(v,1);
        S_value = get_value(J,H,S);
        step=0;
        if S_value<best_value
            best_S=S;
            best_value=S_value;
        end
    end
end