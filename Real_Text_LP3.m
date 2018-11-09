function [ NOX_text ] = Real_Text_LP3( NOX_real,NOX_real_P,Ex_log,Cv_log,Cs_log )
%   求LP3曲线下设计频率P下的X
%   包含组队求值
n = length (NOX_real);      %读取系列长度
NOX_text = (n);             %建立输出矩阵
for i = 1 : n
    NOX_text(i) = P_3_rensult_X(Ex_log,Cv_log,Cs_log,NOX_real_P(i) );
end
for i = 1 : n
    NOX_text(i) = 2.7182818^ (NOX_text(i));
end

end