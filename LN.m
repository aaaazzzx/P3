function [ output_args ] = LN( NOX_real,NOX_real_P )
%   LN参数估计 Cv

Ex = mean(NOX_real);
for i = 1 : 1
    NOX_text = Real_Text_LN (NOX_real,NOX_real_P,Ex,i/1000);
    r(i) = QD( NOX_real,NOX_text );
end

k = find(r == max(r)); % 最大值的位置
output_args = r ;
end
