function [ QD ] = QD( NOX_real,NOX_text )
%   QD拟优确定性系数检验法
%   此处显示详细说明
n = length (NOX_real);              %读取系列长度
NOX_real_M = mean (NOX_real) ;      %实测均值
a = 0 ;                             %a为PPCC中分子
b = 0 ;                             %b为PPCC中分子
for i = 1 : n                       %先求分子
    a = a + ( NOX_real(i) - NOX_text(i) )^2;
end
for i = 1 : n                       %求分母
    b = b + ( NOX_real(i) - NOX_real_M )^2;
end
QD = 1 - a / b ;
end

