function [ PWM_Ex_Cv_Cs ] = PWM( NOX_real_X )
%       概率权重矩法
%       NOX_real_X从大到小
%       Success

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

%----------------------------------------------------
%   求R
R = (M2-M0/3) / (M1-M0/2);
if R < 1
    R = 1 + (1-R) ;
end   

%   求v 
v = (R-1)^2/(4/3-R)^0.14;

%   求U
u = (R-1)/(4/3-R)^0.12 ;

H = 3.545 + 29.85*v + 29.15 * v^2 +363.8 * v^3 + 6093 * v ^4 ;

Ex = M0 ;
Cs = abs(16.41*u - 13.51*u^2 + 10.72*u^3 + 94.54*u^4) ;
Cv = abs(H*(M1/M0-1/2)) ;
PWM_Ex_Cv_Cs(1) = Ex ;
PWM_Ex_Cv_Cs(2) = Cv ;
PWM_Ex_Cv_Cs(3) = Cs ;


end

