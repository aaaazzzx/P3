function [ Log_Ex_Cv_Cs ] = Log_Ex_Cv_Cs( NOX_real,WF_Q,WF_W )
%	对数求参数
%   MOM WF_U WF PWM

n = length (NOX_real) ;
for i = 1:n 
    NOX_real_log(i) = log (NOX_real(i));
end
    
MOM_Ex_Cv_Cs = MOM( NOX_real_log ) ;
 for i = 1 : 3
     Log_Ex_Cv_Cs (1,i) = MOM_Ex_Cv_Cs(i);
 end
 
WF_U_Ex_Cv_Cs = WF_U( NOX_real_log ) ;
for i = 1 : 3
     Log_Ex_Cv_Cs (2,i) = WF_U_Ex_Cv_Cs(i);
end

WF_Ex_Cv_Cs = WF( NOX_real_log,WF_Q,WF_W ) ;
 for i = 1 : 3
     Log_Ex_Cv_Cs (3,i) = WF_Ex_Cv_Cs(i);
 end

PWM_Ex_Cv_Cs = PWM( NOX_real_log ) ;
for i = 1 : 3
     Log_Ex_Cv_Cs (4,i) = PWM_Ex_Cv_Cs(i);
end
  
xlswrite('C:\Users\LHX\Desktop\p3\new.xls', Log_Ex_Cv_Cs);
end

