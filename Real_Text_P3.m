function [ NOX_text ] = Real_Text_P3( NOX_real,NOX_real_P,Ex,Cv,Cs )
%   ��P3���������Ƶ��P�µ�X
%   ���������ֵ
n = length (NOX_real);      %��ȡϵ�г���
NOX_text = (n);             %�����������
for i = 1 : n
    NOX_text(i) = P_3_rensult_X(Ex,Cv,Cs,NOX_real_P(i) );
end
end