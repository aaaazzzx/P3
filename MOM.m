function [ MOM_Ex_Cv_Cs ] = MOM( NOX_real_X )
%   矩法求3个参数 (已经修正为无偏估计)
%   Success

n = length (NOX_real_X);              %读取系列长度
MOM_Ex_Cv_Cs = (3) ;                %建立输出矩阵
%   先求Ex
MOM_Ex_Cv_Cs (1) = mean ( NOX_real_X ) ;
%   求Cv 
a = 0 ;
for i = 1 : n
    a = a + (NOX_real_X(i)/MOM_Ex_Cv_Cs(1)-1)^2;
end
MOM_Ex_Cv_Cs (2) = sqrt (a/(n-1));
%   求Cs
a = 0 ;
for i = 1 : n
    a = a + (NOX_real_X(i)/MOM_Ex_Cv_Cs(1)-1)^3 ;
end 
MOM_Ex_Cv_Cs (3) = a /((n-3)*MOM_Ex_Cv_Cs (2)^3);
end

