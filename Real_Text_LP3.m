function [ NOX_text ] = Real_Text_LP3( NOX_real,NOX_real_P,Ex_log,Cv_log,Cs_log )
%   ��LP3���������Ƶ��P�µ�X
%   ���������ֵ
n = length (NOX_real);      %��ȡϵ�г���
NOX_text = (n);             %�����������
for i = 1 : n
    NOX_text(i) = P_3_rensult_X(Ex_log,Cv_log,Cs_log,NOX_real_P(i) );
end
for i = 1 : n
    NOX_text(i) = 2.7182818^ (NOX_text(i));
end

end