function [ output_args ] = Gumbel( NOX_real,NOX_real_Gumbel_P )
%   Gumbel参数估计 Cv

Ex = mean(NOX_real)
for i = 1 : 1000
    NOX_text = Real_Text_Gumbel (NOX_real,NOX_real_Gumbel_P,Ex,i/1000,0);
    r(i) = QD( NOX_real,NOX_text );
end

k = find(r == max(r)); % 最大值的位置
output_args = k ;
end

