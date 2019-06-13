function [statistics] = get_statistics(path,lambda)
% Get the Statistic from Path.

size_path_minis = size(path.minis) ;
row = size_path_minis(1) ;
w=[];
temp=[];
i=1:size_path_minis(1);
w=[w,exp(-i/lambda)];
sum_w=sum(w,2);
w=fliplr(w);
path.minis=path.minis;
path.means=path.means;
path.maxis=path.maxis;
for j=1:size_path_minis(1)
   temp.minis(j,:)=path.minis(j,:).*w(j);
   temp.means(j,:)=path.means(j,:).*w(j);
   temp.maxis(j,:)=path.maxis(j,:).*w(j);
end
path.minis=temp.minis;
path.means=temp.means;
path.maxis=temp.maxis;
statistics.minis = (sum( path.minis ) / sum_w) ;
statistics.means = (sum( path.means ) / sum_w );
statistics.maxis = (sum( path.maxis ) / sum_w) ;
end
%--------------------------------------------------------------------------