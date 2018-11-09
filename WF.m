function [ WF_Ex_Cv_Cs ] = WF( NOX_real_X,WF_Q,WF_W )
%       权函数法求三参数
%       Cs过分偏大

n = length (NOX_real_X);                          %读取系列长度

Ex = 0 ;                                          %先求均值
for i = 1 : n                             
    Ex = Ex + NOX_real_X(i) * WF_Q(i) ;
end
Ex = Ex / WF_W(1) ;
WF_Ex_Cv_Cs (1) = Ex ;                            %储存Ex 

C = 0 ;                                           %求C
for i = 1 : n
    C = C + (NOX_real_X(i) - Ex )^2 * WF_Q(i) ;
end
C = C / WF_W(1) ;
C = sqrt(C) ;

E1 = 0 ;                                          %求E1
for i = 1 : n
    E1 = E1 + (Ex -NOX_real_X(i)) * WF_1( Ex,NOX_real_X(i) ) * WF_Q(i) ;
end
E1 = E1 / WF_W(1) ;

E2 = 0 ;                                          %求E2
for i = 1 : n
    E2 = E2 + ( Ex - NOX_real_X(i)) * WF_2( Ex,C,NOX_real_X(i) ) * WF_Q(i) ;
end
E2 = E2 / WF_W(1) ;

U = 0 ;                                           %求U
for i = 1 : n 
    U =  U + WF_1( Ex,NOX_real_X(i) ) * WF_Q(i) ;
end
U = U / ( Ex * WF_W(1) ) ;

V = 0 ;                                           %求V
for i = 1 : n
    V = V + ( Ex - NOX_real_X(i) )^2 * WF_2( Ex,C,NOX_real_X(i) ) * WF_Q(i) ;
end
V = V / ( C^2 * WF_W(1) ) ;

Cv = ( C / Ex ) * sqrt ( ( E1 * ( Ex * V + E2 ) ) / ( Ex * C^2 * V * U - E1 * E2 ) ) ;
WF_Ex_Cv_Cs (2) = Cv ;

B = 2 * Ex^2 * E2 * ( C^2 * U + E1 ) / ( C^2 * E1 * ( Ex * V ) + E2 ) ;
Cs = B * Cv ;
WF_Ex_Cv_Cs (3) = Cs ;

end

