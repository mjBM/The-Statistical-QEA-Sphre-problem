function state = isconvergence(size_sphere_qind,Q,threshold,hgate)
%ISCONVERGENCE.M Sort the enter problem ( Knapsack 0/1 ).
%   comments:
%       Input1      : Quantum Individuals           Must be Exist
%       Input2      : Threshold for problem         Must be Exist
%       Output1     : State of Sorted in Items      Must be Exist
%       Output2     : Mean of Current Convergence   Can  be Exist
%
%   Class Support:      ISCONVERGENCE.M
%   Example             ISCONVERGENCE.M
%   See also ISCONVERGENCE.
  
%   Copyright 1987-2009 The JSN&MBM, Ir.
%   $Revision: 1.0.0.0 $  $Date: 2009/01/01 00:00:00 $
l = false ;
convergence = abs(1 - (2*(cos(Q).^2)));
jmean = sum(sum(sum(convergence)))  ;
jmean = jmean /(size_sphere_qind(1)*size_sphere_qind(2)*size_sphere_qind(3)) ;
if jmean >= threshold*(1-2*hgate)
    l = true ;
end
state = l ;
end
%--------------------------------------------------------------------------