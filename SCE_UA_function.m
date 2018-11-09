function f=functn(nopt,x)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明

global X_real;

Cv = x(1);
Cs = x(2);
Ex = mean(X_real);

NOX_real_P  = P3_P( X_real );
NOX_real_P = fliplr(NOX_real_P);        %将频率从1至1/（n+1)排列
X = sort(X_real);                       %将数据从小到大排列
NOX_text = Real_Text_P3 (X,NOX_real_P,Ex,Cv,Cs);
f = MAE( X,NOX_text);


end

