function [ NOX_text ] = Real_Text_N( NOX_real,NOX_real_P,Ex,Cv )
%   ����̬�ֲ������Ƶ��P�µ�X
%   ���������ֵ
n = length (NOX_real);      %��ȡϵ�г���
NOX_text = (n);             %�����������

for i = 1 : n
    NOX_text(i) = N_rensult_X(  NOX_real_P(i),Ex,Cv  );
end

end