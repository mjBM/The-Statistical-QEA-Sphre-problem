function result=sphere_quantum(sphere,H,iteration,teta,help_observe,lambda)
    local_group_size=5;
    local_migration_condition=30;
    global_migration_condition=70;

    best_global_fitness=-Inf;
    size_sphere_qind = size(sphere.qind) ;      %length of chromosom
    dip = size_sphere_qind(3) ;
%     ind_size=size_sphere_qind(2);     %length of chromosom  
    path.minis = zeros(1,size_sphere_qind(1)*size_sphere_qind(2)) ; %length of chromosome(N*shpere length)
    path.minis = logical(path.minis) ;
    path.means = path.minis ;
    path.maxis = path.minis ;
    pathfree = path ;

%I) First initialize-------------------------------
    sphere.qind(:,:,:) = pi / 4 ;
%II) _ IV)-----------------------------------------
    sphere.obsr = sphere_observe(sphere.qind);
    fitness = sphere_fitness(sphere.obsr,help_observe) ;    %calculate fitness of each P array    
    best_agent_fitness = fitness ;          %calculate best agent fitness of each iteration
    sphere.best = sphere.obsr ;    %B(i) is best observe of each iteration(best local Observe)
%V) _ VI)-----------------------------------------------
iteration_fitness = zeros(1,iteration) ;
for i=1:iteration
    sphere.obsr = sphere_observe(sphere.qind);
    [Max I] = max(best_agent_fitness) ;
    fitness = sphere_fitness(sphere.obsr,help_observe) ;
%Q Gate-------------------------------------------------
    q_gate_condition = fitness > best_agent_fitness ;   %Q(i) must Converge to 0 , if P(i)=0
    temp = zeros(size(sphere.obsr)) ;
    for j=1:dip     % Agent
    temp(:,:,j) = ( q_gate_condition(j) .* sphere.obsr(:,:,j)) + ...
                  (~q_gate_condition(j) .* sphere.best(:,:,j)) ;           %and Converge to 1 , if P(i)=1
    end ;
    help = (2.*(sin(sphere.qind).*cos(sphere.qind)>0)-1).*(2*temp-1).*teta ;
                       %*************************************************
    sphere.qind = sphere.qind+help ;
%     temp_gate=(sphere.qind>pi/2).*pi/2+(~(sphere.qind>pi/2)&(~(sphere.qind<0))).*sphere.qind;
%     sphere.qind = temp_gate;

        sphere.qind=min(sphere.qind,acos(sqrt(H  )));
        sphere.qind=max(sphere.qind,acos(sqrt(1-H)));
    %VIII) _ IX)---------------------------------------
    sphere.best = temp ;
    best_agent_fitness =  q_gate_condition .* fitness + ...
                         ~q_gate_condition .* best_agent_fitness ;

        [Max I] = max(best_agent_fitness) ;                     %calculate maximum fitness of individuals
    if Max>best_global_fitness                    %global Compartion
        best_global_observe = sphere.best(:,:,I) ;
        best_global_fitness = Max ;
    end
    iteration_fitness(i)=best_global_fitness;     %global fitness array
%       iteration_fitness(i)=mean(decimal(:,I));
    %X)-------------------------------------------------------
    
    local_migration=false;
    global_migration=false;
    if mod(i,local_migration_condition)==0
        local_migration=true;
    end
    if mod(i,global_migration_condition)==0
        global_migration=true;
    end
    if global_migration                      %global migration
        for j=1:dip
          sphere.best(:,:,j) = best_global_observe ;              %exchange individual Best observe with best global observe
        end
        best_agent_fitness(:) = best_global_fitness ; %exchange individual Best fitness with best global fitness
    elseif local_migration                      %local migration
        local_groups_no=floor(dip/local_group_size);
        for j=1:local_groups_no
            del=best_agent_fitness((j-1)*local_group_size+1:j*local_group_size);
            [Best_local_fitness I]=min(del);
            Best_local=sphere.best(:,:,I);
            for k=(j-1)*local_group_size+1:j*local_group_size
                sphere.best(:,:,k)=Best_local;                        %exchange individual Best observe with best local observe
                best_agent_fitness(k)=Best_local_fitness;   %exchange individual Best fitness with best local observe
            end
        end
    end

    
%     .....................................................................
    path = add_info(path,sphere.best,dip,best_agent_fitness);
        if isconvergence(size_sphere_qind,sphere.qind,0.98,H)  % Global M
            statistics = get_statistics(path,lambda) ;
            factor = compare_statistics(statistics) ;
            path= pathfree ;
            helpII = zeros(size_sphere_qind(2),size_sphere_qind(1));
            helpII(:) = (pi/4) + factor ;
            for kk=1:dip
                sphere.qind(:,:,kk) = helpII' ;
            end
            
        end
   
end       % iteration end
result=iteration_fitness;
end
%--------------------------------------------------------------------------