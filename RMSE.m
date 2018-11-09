function [ RMSE ] = RMSE( NOX_real,NOX_text )
%   拟优平方和准则法
%   此处显示详细说明
n = length (NOX_real);              %读取系列长度
a = 0 ;
for i = 1 : n
    a = a + (NOX_real(i) - NOX_text(i))^2;
end
RMSE = sqrt ( a / n );
end

