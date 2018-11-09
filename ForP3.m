function [ output_args ] = ForP3( X_real )
%UNTITLED2 对时间序列进行预处理，适用武汉大学水文频率拟合软件
%   输入一组时间序列，输出一个EXCEL格式文件

n = length ( X_real ) ; %读取序列长度
A = 1:1:n ;
N = P3_P (X_real) ; %计算对应频率
X_real = sort(X_real,'descend');                  %sort是把流量从小到大排列
wenzi = ['序数频'];


xlswrite('F:/毛俊水库水文工作/分期洪水/Q10_2.xls',wenzi,'sheet1','A1');
% xlswrite('F:/毛俊水库水文工作/分期洪水/Q9.xls',A','sheet1','A2');
% xlswrite('F:/毛俊水库水文工作/分期洪水/Q9.xls',N','sheet1','C2');
% xlswrite('F:/毛俊水库水文工作/分期洪水/Q9.xls',X_real','sheet1','B2');



end

