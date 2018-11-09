function [ NOX_text ] = Real_Text_P3( NOX_real,NOX_real_P,Ex,Cv,Cs )
%   求P3曲线下设计频率P下的X
%   包含组队求值
n = length (NOX_real);      %读取系列长度
NOX_text = (n);             %建立输出矩阵
for i = 1 : n
    NOX_text(i) = P_3_rensult_X(Ex,Cv,Cs,NOX_real_P(i) );
end
end