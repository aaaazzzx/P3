function [ output_args ] = N( NOX_real,NOX_real_P )
%   Gumbel参数估计 Cv

Ex = mean(NOX_real);
for i = 1 : 1000
    NOX_text = Real_Text_N (NOX_real,NOX_real_P,Ex,i/1000);
    r(i) = QD( NOX_real,NOX_text );
end

k = find(r == max(r)); % 最大值的位置
output_args = k ;
end
