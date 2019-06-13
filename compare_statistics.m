function [factor] = compare_statistics(statistics)
% Compare between Mini & Mean & Maxi.

% Base
% factor = ((statistics.maxis - statistics.minis)*2) + (statistics.means*1);
% factor = ((statistics.maxis - statistics.minis)*2) + ((statistics.means*2)-1);

factor = statistics.maxis*2 - statistics.minis*3 + statistics.means*1;  % Tayarani
factor = factor .* (1 * (pi/16)) ;
end
%--------------------------------------------------------------------------