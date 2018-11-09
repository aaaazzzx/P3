function [ P_3_rensult_P ] = P_3_rensult_P( Ex,Cv,Cs,x )
%   ��P3������֪X��P.
%   �˴���ʾ��ϸ˵��
alfa=4/(Cs^2);
beta=(Ex*Cv*Cs)/2;
a0=Ex-2*Cv*Ex/Cs;
P_3_rensult_P=1-gamcdf(x-a0,alfa,beta);     %��������Ƶ��P
end