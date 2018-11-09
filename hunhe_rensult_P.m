function [ hunhe_rensult_P ] = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x )
%   混合分布已知X求P.
%   此处显示详细说明
alfa1=4/(Cs1^2);
beta1=(Ex1*Cv1*Cs1)/2;
a1=Ex1-2*Cv1*Ex1/Cs1;
P_3_rensult_P_1=1-gamcdf(x-a1,alfa1,beta1);     %计算理论频率P

alfa2=4/(Cs2^2);
beta2=(Ex2*Cv2*Cs2)/2;
a2=Ex2-2*Cv2*Ex2/Cs2;
P_3_rensult_P_2=1-gamcdf(x-a2,alfa2,beta2);     %计算理论频率P

hunhe_rensult_P = Alpha * P_3_rensult_P_1 + (1-Alpha) * P_3_rensult_P_2 ;

end