function result = sphere_observe(sphere_qind)
sphere_size = size(sphere_qind) ;
sphere_rand = rand(sphere_size) ;
sphere_sin2 = sin(sphere_qind) .^ 2 ;   %gggggggggggggggggggggggggggggggg
result = sphere_rand < sphere_sin2 ;
end
%--------------------------------------------------------------------------