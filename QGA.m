function QGA
tic ;
run = 30;                         %run   
iteration=1000;     %generation
agent_number=25;
teta=0.01*pi;       %Q gate
H_gate=0;        %epsilon
sphere_len = 8;
N = 100 ;
sphere.qind = zeros(N,sphere_len,agent_number) ;
sphere.obsr = logical(sphere.qind(:,:,:)) ;
sphere.best = sphere.obsr ;
mean_fitness=zeros(run,iteration);
x_percent_vector=[];
y_percent_vector=[];
x=1:iteration ;
% colors = 'krmbgcyw' ;

help_observe=sphere_B2Dmatrix(sphere.obsr);     %**************************
for lambda=0:5:100
    for i=1:run
        mean_fitness(i,:)=sphere_quantum(sphere,H_gate,iteration,teta,help_observe,lambda);
        disp(['End of run ',num2str(i),' th.']) ;
    end
    % mean_fitness(1,:)=[];
    y = mean(mean_fitness,1) ;
    y_percent_vector=[y_percent_vector,y(iteration)];
    x_percent_vector=[x_percent_vector,lambda];
end
h= figure ;
hold on ;
plot(x_percent_vector,y_percent_vector,'k-')  ;
disp('res=');
disp(y(iteration));
axis auto ;
xlabel('All Iterations') ;
ylabel('Fitness Mean') ;
title('All Quantum Genetic Algorithm') ;
disp('Allruntime=')      ;
qgatime  = toc ;        % Run Time          % Set QGA Time
disp(mat2str(qgatime))   ;
dlmwrite('new\time.txt',qgatime);
hgsave(h,'new\fig');
end
%--------------------------------------------------------------------------