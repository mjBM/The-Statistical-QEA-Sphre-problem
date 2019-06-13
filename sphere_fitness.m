function [result] = sphere_fitness(sphere_obsr,help_observe)
sphere_size = size(sphere_obsr) ;
fitness = zeros(1,sphere_size(3)) ;     % Agent
tempdec = zeros(sphere_size(1),sphere_size(3)) ; % N *  Agent
decimal= sum(help_observe.*sphere_obsr,2);
decimal=decimal(:,:);
tempdec = (( ( decimal .* (200/2^8) ) - 100 ).^2 ) ;   %map to (-100,100)
fitness = sum(tempdec.^2) ;
result = -fitness ;
end
%--------------------------------------------------------------------------