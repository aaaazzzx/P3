function [ NOX_real_Gumbel_P ] = Gumbel_P( NOX_real )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

n = length (NOX_real);              %读取系列长度
for i = 1 : n
NOX_real_Gumbel_P(i) = (i-0.44)/(n+0.12);
end

end

