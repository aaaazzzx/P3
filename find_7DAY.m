function find_7DAY( Y,D,Q )
%	找出年最大七日流量
%   success

for year=1951:2012
    number = find(Y==year) ;       %找出Y中各年份的位置
    n = 0 ;
    for i = number(1):number(end-6)
        if D(i) == (D(i+1)-1+D(i+2)-2+D(i+3)-3+D(i+4)-4+D(i+5)-5+D(i+6)-6)/6      %查找相邻的日期
            n = n+1;                    %计算连续三日个数
            Q_7DAY(n) = Q(i)+Q(i+1)+Q(i+2)+Q(i+3)+Q(i+4)+Q(i+5)+Q(i+6);
        end
    end
    number = 0 ;
    Q_MAX(year-1950) = max(Q_7DAY);
    Q_7DAY = 0 ;
end
xlswrite('G:\Copula\shuchu.xlsx', Q_MAX);
end

