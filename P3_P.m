function [ NOX_real_P ] = P3_P( NOX )
%	按从（1/n+1）到1求出对应的频率
%   此处显示详细说明

n = length (NOX);              %读取系列长度
for i = 1 : n
NOX_real_P(i) = i/(n+1);
end

end

