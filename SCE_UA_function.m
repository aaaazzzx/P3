function f=functn(nopt,x)
%UNTITLED4 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

global X_real;

Cv = x(1);
Cs = x(2);
Ex = mean(X_real);

NOX_real_P  = P3_P( X_real );
NOX_real_P = fliplr(NOX_real_P);        %��Ƶ�ʴ�1��1/��n+1)����
X = sort(X_real);                       %�����ݴ�С��������
NOX_text = Real_Text_P3 (X,NOX_real_P,Ex,Cv,Cs);
f = MAE( X,NOX_text);


end

