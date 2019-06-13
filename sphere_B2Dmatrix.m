function [result] = sphere_B2Dmatrix(Ackley_obsr)
Ackley_size = size(Ackley_obsr) ;  % N * Length * Agents
help_observe = zeros(Ackley_size);
temp1=zeros(1,Ackley_size(2));      %   1*Length
for j=1:Ackley_size(2)      % Length
 temp1(j)=2^(Ackley_size(2)-j);    
end

for i=1:Ackley_size(1)  % N 
    for j=1:Ackley_size(3) % Agents
        help_observe(i,:,j)= temp1;
    end
end
result= help_observe;
end