function [ NOX_real ] = P3_real( NOX )
%   ��ʵ��ֵ����
%   �˴���ʾ��ϸ˵��

n = length (NOX);              %��ȡϵ�г���

NOX = sort(NOX);

for i = 1 : n
    NOX_real(i) = NOX(n-i+1);
end


end

