function [ NOX_real_P ] = P3_P( NOX )
%	���ӣ�1/n+1����1�����Ӧ��Ƶ��
%   �˴���ʾ��ϸ˵��

n = length (NOX);              %��ȡϵ�г���
for i = 1 : n
NOX_real_P(i) = i/(n+1);
end

end

