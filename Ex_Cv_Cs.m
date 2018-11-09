function [ Ex_Cv_Cs ] = Ex_Cv_Cs( NOX_real,WF_Q,WF_W )
%	求P-3求参数
%   MOM WF_U WF PWM

n = length (NOX_real) ;

    
MOM_Ex_Cv_Cs = MOM( NOX_real ) ;
 for i = 1 : 3
     Ex_Cv_Cs (1,i) = MOM_Ex_Cv_Cs(i);
 end
 
WF_U_Ex_Cv_Cs = WF_U( NOX_real ) ;
for i = 1 : 3
     Ex_Cv_Cs (2,i) = WF_U_Ex_Cv_Cs(i);
end

WF_Ex_Cv_Cs = WF( NOX_real,WF_Q,WF_W ) ;
 for i = 1 : 3
     Ex_Cv_Cs (3,i) = WF_Ex_Cv_Cs(i);
 end

PWM_Ex_Cv_Cs = PWM( NOX_real ) ;
for i = 1 : 3
     Ex_Cv_Cs (4,i) = PWM_Ex_Cv_Cs(i);
end
  
xlswrite('C:\Users\LHX\Desktop\p3\new.xls', Ex_Cv_Cs);
end