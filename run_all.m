algorithms={'greedy','recursive','genetic','hill climbing', 'hill climbing with random skips', 'simulated annealing', 'greedy + hill climbing', 'random'};
columns=[{'size'} algorithms];
sizes=2.^(6:10);
loops=[1000,1000,500,100,10];
winners=zeros(length(sizes),length(algorithms));
single_winners=zeros(length(sizes),length(algorithms));
errors=zeros(length(sizes),length(algorithms));
disp('Comparing algorithms');
for j=1:4
tic
for i=1:length(sizes)
    [winners(i,:),single_winners(i,:),errors(i,:)]=compare_algorithms(sizes(i),loops(i),mod((j-1),2),floor((j-1)/2));
end
toc
write_csv(winners,columns,['winners' num2str(j) '.csv']);
write_csv(single_winners,columns,['single_winners' num2str(j) '.csv']);
write_csv(errors,columns,['errors' num2str(j) '.csv']);
end
disp('Running sanity check');
tic
[success, deviation]=sanity_check(100);
toc
sanity_columns={'size','%success no correlation no field', '%success with correlation no field', '%success no correlation with field', '%success with correlation and field',...
    '%error no correlation no field', '%error with correlation no field', '%error no correlation with field', '%error with correlation and field'};
sanity=[(5:20)' success deviation];
write_csv(sanity,sanity_columns,'sanity.csv');