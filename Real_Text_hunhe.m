function [ NOX_text ] = Real_Text_hunhe( NOX_real,NOX_real_P,Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2 )
% 求混合分布下设计频率P下的X
%   包含组队求值
n = length (NOX_real);      %读取系列长度
NOX_text = (n);             %建立输出矩阵
for i = 1 : n
    NOX_text(i) = hunhe_rensult_X(Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,NOX_real_P(i) );
end
end

