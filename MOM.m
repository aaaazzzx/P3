function [ MOM_Ex_Cv_Cs ] = MOM( NOX_real_X )
%   �ط���3������ (�Ѿ�����Ϊ��ƫ����)
%   Success

n = length (NOX_real_X);              %��ȡϵ�г���
MOM_Ex_Cv_Cs = (3) ;                %�����������
%   ����Ex
MOM_Ex_Cv_Cs (1) = mean ( NOX_real_X ) ;
%   ��Cv 
a = 0 ;
for i = 1 : n
    a = a + (NOX_real_X(i)/MOM_Ex_Cv_Cs(1)-1)^2;
end
MOM_Ex_Cv_Cs (2) = sqrt (a/(n-1));
%   ��Cs
a = 0 ;
for i = 1 : n
    a = a + (NOX_real_X(i)/MOM_Ex_Cv_Cs(1)-1)^3 ;
end 
MOM_Ex_Cv_Cs (3) = a /((n-3)*MOM_Ex_Cv_Cs (2)^3);
end

