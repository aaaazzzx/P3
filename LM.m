function [ LM_Ex_Cv_Cs ] = LM( NOX_real_X )
%       线性矩法
%       采用概率权重矩法
%       Cv出现问题(不再使用)

n = length (NOX_real_X);

%先求三个M
M0 = 0 ;
for i = 1 : n 
    M0 = M0 + NOX_real_X(i) ;
end
M0 = M0 / n ;

M1 = 0 ;
for i = 1 : n
    M1 = M1 + (i-1) * NOX_real_X(i) / (n-1);
end 
M1 = M1 / n ;

M2 = 0 ;
for i = 1 : n 
    M2 = M2 + (i-1)*(i-2)/((n-2)*(n-1)) * NOX_real_X(i);
end

M2 = M2 / n ;

lambda_1 = M0 ;
lambda_2 = 2*M1 - M0 ;
lambda_3 = 6*M2 - 6*M1 + M0 ;

tau2 = lambda_2/lambda_1 ;
tau3 = lambda_3/lambda_2 ;

if abs(tau3)<1/3
    Z = 3*pi ;
    alpha = (1+0.2906*Z)/(Z + 0.1882*Z^2 + 0.0442*Z^3) ;
else
    Z = 1 - abs(tau3) ;
    alpha = (0.36067*Z - 0.59567*Z^2 + 0.25361*Z^3)/(1-2.78861*Z + 2.56096*Z^2 - 0.77045*Z^3) 
end

Ex = lambda_1 ;
Cv = lambda_2*pi^0.5*alpha^0.5*gamma(alpha)/(gamma(alpha + 1/2)) ;
Cs = 2*alpha^(-1/2)*sign(tau3) ;
LM_Ex_Cv_Cs(1) = Ex ;
LM_Ex_Cv_Cs(2) = Cv ;
LM_Ex_Cv_Cs(3) = Cs ;


end

