function [ P_3_rensult_P ] = P_3_rensult_P( Ex,Cv,Cs,x )
%   求P3函数已知X求P.
%   此处显示详细说明
alfa=4/(Cs^2);
beta=(Ex*Cv*Cs)/2;
a0=Ex-2*Cv*Ex/Cs;
P_3_rensult_P=1-gamcdf(x-a0,alfa,beta);     %计算理论频率P
end