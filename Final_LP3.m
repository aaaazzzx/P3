function [ nothing ] = Final_LP3( NOX_real,NOX_real_P,Ex_log,Cv_log,Cs_log )
%       LP3参数评价
%       顺序依次为PPCC  QD  RMSE  MAE



%   第一组数据

NOX_text = Real_Text_LP3 (NOX_real,NOX_real_P,Ex_log(1),Cv_log(1),Cs_log(1));

nothing(1,1) = PPCC( NOX_real,NOX_text );
nothing(1,2) = QD( NOX_real,NOX_text );
nothing(1,3) = RMSE( NOX_real,NOX_text );
nothing(1,4) = MAE( NOX_real,NOX_text );

%   第二组数据

NOX_text = Real_Text_LP3 (NOX_real,NOX_real_P,Ex_log(2),Cv_log(2),Cs_log(2));

nothing(2,1) = PPCC( NOX_real,NOX_text );
nothing(2,2) = QD( NOX_real,NOX_text );
nothing(2,3) = RMSE( NOX_real,NOX_text );
nothing(2,4) = MAE( NOX_real,NOX_text );

%   第三组数据

NOX_text = Real_Text_LP3 (NOX_real,NOX_real_P,Ex_log(3),Cv_log(3),Cs_log(3));

nothing(3,1) = PPCC( NOX_real,NOX_text );
nothing(3,2) = QD( NOX_real,NOX_text );
nothing(3,3) = RMSE( NOX_real,NOX_text );
nothing(3,4) = MAE( NOX_real,NOX_text );

%   第四组数据

NOX_text = Real_Text_LP3 (NOX_real,NOX_real_P,Ex_log(4),Cv_log(4),Cs_log(4));

nothing(4,1) = PPCC( NOX_real,NOX_text );
nothing(4,2) = QD( NOX_real,NOX_text );
nothing(4,3) = RMSE( NOX_real,NOX_text );
nothing(4,4) = MAE( NOX_real,NOX_text );

%   第五组数据

NOX_text = Real_Text_LP3 (NOX_real,NOX_real_P,Ex_log(5),Cv_log(5),Cs_log(5));

nothing(5,1) = PPCC( NOX_real,NOX_text );
nothing(5,2) = QD( NOX_real,NOX_text );
nothing(5,3) = RMSE( NOX_real,NOX_text );
nothing(5,4) = MAE( NOX_real,NOX_text );

xlswrite('C:\Users\LHX\Desktop\p3\new.xls', nothing);
end
