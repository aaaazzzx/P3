function [ WF_U_Ex_Cv_Cs ] = WF_U( NOX_real_X )
%       �����Ȩ���������
%       Cs��ƫ��

n = length (NOX_real_X);
Ex = mean (NOX_real_X);
S = sqrt (var (NOX_real_X));

%����B
B = 0;
for i = 1 : n 
    B = B + (NOX_real_X(i) - Ex) * WF_2(Ex,S,NOX_real_X(i));
end

%����G
G = 0 ;
for i = 1 : n 
    G = G + (NOX_real_X(i) - Ex)^2 * WF_2(Ex,S,NOX_real_X(i));
end 

Cs = -4 * S * B / G ;
Cv = S / Ex ;
WF_U_Ex_Cv_Cs(1) = Ex ;
WF_U_Ex_Cv_Cs(2) = Cv ;
WF_U_Ex_Cv_Cs(3) = Cs ;

end

