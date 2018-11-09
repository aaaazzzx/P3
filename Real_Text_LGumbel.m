function [ NOX_text ] = Real_Text_LGumbel( NOX_real,NOX_real_P,Ex_log,Cv_log,Cs_log )
%   ��Gumbel�������Ƶ��P�µ�X
%   ���������ֵ
n = length (NOX_real);      %��ȡϵ�г���
NOX_text = (n);             %�����������
for i = 1 : n
    NOX_text(i) = Gumbel_rensult_X(NOX_real_P(i),Ex_log,Cv_log );
end
for i = 1 : n
    NOX_text(i) = 2.7182818^ (NOX_text(i));
end
end