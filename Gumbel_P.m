function [ NOX_real_Gumbel_P ] = Gumbel_P( NOX_real )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

n = length (NOX_real);              %��ȡϵ�г���
for i = 1 : n
NOX_real_Gumbel_P(i) = (i-0.44)/(n+0.12);
end

end

