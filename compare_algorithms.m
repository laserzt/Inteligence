function [winners,single_winners,errors]=compare_algorithms(N,loops,with_field,with_correlation)
if nargin<1
    N=100;
end
if nargin<2
    loops=1;
end
if nargin<3
    with_field=0;
end
if nargin<4
    with_correlation=0;
end
values=zeros(1,8);
t=zeros(1,2);
winners=zeros(1,8);
single_winners=zeros(1,8);
errors=zeros(1,8);
for loop=1:loops
    [J,H]=get_data(N,with_correlation,with_field);
    before = clock;
    S1=greedy(J,H);
    t(1)=etime(clock, before);
    values(1)=get_value(J,H,S1);
    min_group_size=14;
    before = clock;
    S2=recursive_algorithm(J,H,min_group_size);
    t(2)=etime(clock, before);
    [~,i]=min(values(1:2));
    time=t(i)*1.1;
    values(2)=get_value(J,H,S2);
    mutations=2;
    genetic_population=20;
    S3=genetic_algorithm(J,H,genetic_population,mutations,time);
    values(3)=get_value(J,H,S3);
    S4=hill_climbing(J, H, mutations, time);
    values(4)=get_value(J,H,S4);
    steps=10000;
    S5=hill_climbing_with_random_skips(J, H, mutations, steps, time);
    values(5)=get_value(J,H,S5);
    S6=simulated_annealing(J, H, mutations, steps, time);
    values(6)=get_value(J,H,S6);
    S7=hill_climbing(J, H, mutations, time-t(1), S1);
    values(7)=get_value(J,H,S7);
    S8=random_algorithm(J, H, time);
    values(8)=get_value(J,H,S8);
    w=(values==min(values));
    winners(w)=winners(w)+1;
    if sum(w)==1
        single_winners(w)=single_winners(w)+1;
    end
    errors=errors+(min(values)-values)/min(values);
end
winners=winners/loops;
errors=errors/loops;
single_winners=single_winners/loops;