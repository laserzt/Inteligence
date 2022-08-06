function best_solution=genetic_algorithm(J,H,population_size,n,time)
v=size(J,1);
S=(randi(2,population_size,v)-1)*2-1;
best_fitness=inf;
best_solution=S(1,:);
subset=find_correlative_subset(J,floor(v/2));
set1=find(subset);
set2=find(1-subset);
parent_choices=nchoosek(1:ceil(population_size/2),2);
t0 = clock;
while etime(clock, t0) < time
    fitness=zeros(1,size(S,1));
    for j=1:size(S,1)
        fitness(j)=get_value(J,H,S(j,:));
    end
    [cur_best_fitness,cur_best_solution]=min(fitness);
    if cur_best_fitness<best_fitness
        best_fitness=cur_best_fitness;
        best_solution=S(cur_best_solution,:);
    end
    [~,inds]=mink(fitness,ceil(length(fitness)/2));
    selected_S=S(inds,:);
    for j=1:size(S,1)
    	choice=randi(size(parent_choices,1),1);
    	first_parent=selected_S(parent_choices(choice,1),:);
    	second_parent=selected_S(parent_choices(choice,2),:);
        S(j,:)=mutate(recombine(first_parent,second_parent,set1,set2,J,H),n);
    end
end
end

function child=recombine(first_parent,second_parent,set1,set2,J,H)
child1=zeros(1,length(first_parent));
child1(set1)=first_parent(set1);
child1(set2)=second_parent(set2);
child2=zeros(1,length(first_parent));
child2(set1)=second_parent(set1);
child2(set2)=first_parent(set2);
val1=get_value(J,H,child1);
val2=get_value(J,H,child2);
if val1<val2
    child=child1;
else
    child=child2;
end
end
