function [ r ] = PPCC( NOX_real,NOX_text )
%   PPCC
n = length (NOX_real);              %读取系列长度
NOX_real_M = mean (NOX_real) ;      %实测均值
NOX_text_M = mean (NOX_text) ;      %理论均值
a = 0 ;                             %a为PPCC中分子
b1 = 0 ;                            %b为PPCC中分母1
b2 = 0 ;                            %b为PPCC中分母2
for i = 1 : n                       %先求分子
    a = a + ( NOX_real(i) - NOX_real_M ) * ( NOX_text(i) - NOX_text_M );
end
for i = 1 : n                       %先求分子
    b1 = b1 + ( NOX_real(i) - NOX_real_M ) * ( NOX_real(i) - NOX_real_M );
end
for i = 1 : n                       %先求分子
    b2 = b2 + ( NOX_text(i) - NOX_text_M ) * ( NOX_text(i) - NOX_text_M );
end
r = a/(sqrt(b1*b2));
end

