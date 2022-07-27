function [success, deviation]=sanity_check(loops)
if nargin<1
    loops=20;
end
success=zeros(18,4);
deviation=zeros(18,4);
for N=3:20
    for with_correlation=0:1
        for with_field=0:1
            for loop=1:loops
                [J,H]=get_data(N,with_correlation,with_field);                
                S=greedy(J,H);
                greedy_score=get_value(J,H,S);
                S2=get_best_result(J,H);
                best_score=get_value(J,H,S2);
                if greedy_score==best_score
                    success(N-2,with_correlation+with_field*2+1)=success(N-2,with_correlation+with_field*2+1)+1;
                end
                deviation(N-2,with_correlation+with_field*2+1)=deviation(N-2,with_correlation+with_field*2+1)+(best_score-greedy_score)/best_score;
            end
            success(N-2,with_correlation+with_field*2+1)=success(N-2,with_correlation+with_field*2+1)/loops;
            deviation(N-2,with_correlation+with_field*2+1)=deviation(N-2,with_correlation+with_field*2+1)/loops;
        end
    end
end