function find_3DAY( Y,D,Q )
%	找出年最大三日流量
%   success

for year=1951:2012
    number = find(Y==year) ;       %找出Y中各年份的位置
    n = 0 ;
    for i = number(1):number(end-2)
        if D(i) == (D(i+1)+D(i+2)-3)/2      %查找相邻的日期
            n = n+1;                    %计算连续三日个数
            Q_3DAY(n) = Q(i)+Q(i+1)+Q(i+2);
        end
    end
    number = 0 ;
    Q_MAX(year-1950) = max(Q_3DAY);
    Q_3DAY = 0 ;
end
xlswrite('G:\Copula\shuchu.xlsx', Q_MAX);
end

