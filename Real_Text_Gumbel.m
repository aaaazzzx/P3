function [ NOX_text ] = Real_Text_Gumbel( NOX_real,NOX_real_P,Ex,Cv,Cs )
%   求Gumbel曲线设计频率P下的X
%   包含组队求值
n = length (NOX_real);      %读取系列长度
NOX_text = (n);             %建立输出矩阵
for i = 1 : n
    NOX_text(i) = Gumbel_rensult_X(NOX_real_P(i),Ex,Cv );
end
end