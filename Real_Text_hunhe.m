function [ NOX_text ] = Real_Text_hunhe( NOX_real,NOX_real_P,Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2 )
% ���Ϸֲ������Ƶ��P�µ�X
%   ���������ֵ
n = length (NOX_real);      %��ȡϵ�г���
NOX_text = (n);             %�����������
for i = 1 : n
    NOX_text(i) = hunhe_rensult_X(Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,NOX_real_P(i) );
end
end

