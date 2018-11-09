function [ t ] = trend( NOX )
%       趋势性检验
%   此处显示详细说明

n = length ( NOX ) ;
p = 0 ;
for i = 1 : (n-1)
    for j = (i+1) : (n)
        if NOX(i)<NOX(j)
            p = p + 1 ;
        end
    end
end
tau = 4 * p / (n*(n-1)) - 1 ;
VAR = 2 * ( 2 * n + 5 ) / (9*n*(n-1));
u = tau / VAR^0.5 ;

if abs(u) > 1.96       %显著性水平Alpha默认为0.05，临界值为1.96
    trend_test = '趋势性显著';
    if p>(n*(n-1)/4)
        t = 1 ;
        trend_test = '趋势性显著,上升趋势';
    else
        t = 2 ;
        trend_test = '趋势性显著,下降趋势';
    end
else
    trend_test = '趋势性不显著';
    t = 0 ;
end


end

