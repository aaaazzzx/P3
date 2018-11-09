function [ r ] = PPCC( NOX_real,NOX_text )
%   PPCC
n = length (NOX_real);              %��ȡϵ�г���
NOX_real_M = mean (NOX_real) ;      %ʵ���ֵ
NOX_text_M = mean (NOX_text) ;      %���۾�ֵ
a = 0 ;                             %aΪPPCC�з���
b1 = 0 ;                            %bΪPPCC�з�ĸ1
b2 = 0 ;                            %bΪPPCC�з�ĸ2
for i = 1 : n                       %�������
    a = a + ( NOX_real(i) - NOX_real_M ) * ( NOX_text(i) - NOX_text_M );
end
for i = 1 : n                       %�������
    b1 = b1 + ( NOX_real(i) - NOX_real_M ) * ( NOX_real(i) - NOX_real_M );
end
for i = 1 : n                       %�������
    b2 = b2 + ( NOX_text(i) - NOX_text_M ) * ( NOX_text(i) - NOX_text_M );
end
r = a/(sqrt(b1*b2));
end

