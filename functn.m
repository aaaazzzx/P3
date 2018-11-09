function f=functn(nopt,x)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明

global X_real;

Alpha = x(1);
Ex1 = x(2);
Cv1 = x(3);
Cs1 = x(4);
Ex2 = x(5);
Cv2 = x(6);
Cs2 = x(7);

NOX_real_P  = P3_P( X_real );
NOX_real_P = fliplr(NOX_real_P);        %将频率从1至1/（n+1)排列
X = sort(X_real);                       %将数据从小到大排列
NOX_text = Real_Text_hunhe (X,NOX_real_P,Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2);
f = MAE( X,NOX_text);


end

