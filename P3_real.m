function [ NOX_real ] = P3_real( NOX )
%   对实测值排序
%   此处显示详细说明

n = length (NOX);              %读取系列长度

NOX = sort(NOX);

for i = 1 : n
    NOX_real(i) = NOX(n-i+1);
end


end

