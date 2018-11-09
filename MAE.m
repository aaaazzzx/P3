function [ MAE ] = MAE( NOX_real,NOX_text )
%   拟优绝对值准则法
%   此处显示详细说明
n = length (NOX_real);              %读取系列长度
MAE = 0 ;
for i = 1 : n
    MAE = MAE + abs(NOX_real(i) - NOX_text(i));
end
MAE = MAE / n ;
end

