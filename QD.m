function [ QD ] = QD( NOX_real,NOX_text )
%   QD����ȷ����ϵ�����鷨
%   �˴���ʾ��ϸ˵��
n = length (NOX_real);              %��ȡϵ�г���
NOX_real_M = mean (NOX_real) ;      %ʵ���ֵ
a = 0 ;                             %aΪPPCC�з���
b = 0 ;                             %bΪPPCC�з���
for i = 1 : n                       %�������
    a = a + ( NOX_real(i) - NOX_text(i) )^2;
end
for i = 1 : n                       %���ĸ
    b = b + ( NOX_real(i) - NOX_real_M )^2;
end
QD = 1 - a / b ;
end

