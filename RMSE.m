function [ RMSE ] = RMSE( NOX_real,NOX_text )
%   ����ƽ����׼��
%   �˴���ʾ��ϸ˵��
n = length (NOX_real);              %��ȡϵ�г���
a = 0 ;
for i = 1 : n
    a = a + (NOX_real(i) - NOX_text(i))^2;
end
RMSE = sqrt ( a / n );
end

