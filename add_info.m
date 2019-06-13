function [path] = add_info(path,P,agents,fitness1)
% Add Informations About Last Generations.

fitness(:,1) = fitness1 ;         % Fitness
fitness(:,2) = 1:agents ;                       % Position
fitness = sortrows(fitness,1) ;
position_mini = fitness(1,2) ;
position_mean = fitness(floor(agents/2),2) ;
position_maxi = fitness(agents,2) ;
size_path_minis = size(path.minis) ;
if sum(path.minis(1,:)) == 0 && size_path_minis(1) == 1
    size_path_minis(1)= 0 ;                     % Path is Empty
end ;
% ................ convert 2dimension to 1dimension ..............
Psize = size(P);
Pconv = zeros(1,Psize(1)*Psize(2),Psize(3));
% for j=1:Psize(3)
%   for i=1:Psize(1)
%       Pconv((i-1)*Psize(2)+1:i*Psize(2),j) = P(i,:,j);
%   end
% end
Pconv = reshape(P,Psize(1)*Psize(2),Psize(3));
% ................................................................
new_row = size_path_minis(1) + 1 ;
path.minis(new_row,:) = Pconv(:,position_mini) ;
path.means(new_row,:) = Pconv(:,position_mean) ;
path.maxis(new_row,:) = Pconv(:,position_maxi) ;
end
%--------------------------------------------------------------------------