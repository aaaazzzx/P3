function [ nothing ] = Final_Gumbel( NOX_real,NOX_real_Gumbel_P,Ex,Cv )
%       Gumbel参数评价
%       顺序依次为PPCC  QD  RMSE  MAE



%   第一组数据

NOX_text = Real_Text_Gumbel (NOX_real,NOX_real_Gumbel_P,Ex,Cv,1.14);

nothing(1,1) = PPCC( NOX_real,NOX_text );
nothing(1,2) = QD( NOX_real,NOX_text );
nothing(1,3) = RMSE( NOX_real,NOX_text );
nothing(1,4) = MAE( NOX_real,NOX_text );

xlswrite('C:\Users\LHX\Desktop\p3\new.xls', nothing);
end

