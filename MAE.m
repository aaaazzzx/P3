function [ MAE ] = MAE( NOX_real,NOX_text )
%   ���ž���ֵ׼��
%   �˴���ʾ��ϸ˵��
n = length (NOX_real);              %��ȡϵ�г���
MAE = 0 ;
for i = 1 : n
    MAE = MAE + abs(NOX_real(i) - NOX_text(i));
end
MAE = MAE / n ;
end

