function [ independence_test ] = independence ( NOX )
%   独立性检验
%   0.05显著性水平

n = length ( NOX ) ;
m = n/4 ;
m = floor(m);
Ex = mean(NOX) ;
for i = 1 : m
    a = 0 ;
    b = 0 ;
    for j = i : (n-m)
        a = a + (NOX(j)-Ex)*(NOX(j+i)-Ex) ;
    end
    for j = 1 : n 
        b = b + (NOX(j)-Ex)^2 ;
    end
    r(i) = a / b ;
    c(i) = (-1-1.96*sqrt(n-i-1))/(n-i);
    d(i) = (-1+1.96*sqrt(n-i-1))/(n-i);
end
c(m+1) = (-1-1.96*sqrt(n-1))/(n);       %c为下限
d(m+1) = (-1+1.96*sqrt(n-1))/(n);       %d为上限

c(:,1)=[];
d(:,1)=[];
%删除第一行，因为第一行必定不符（r第一个数为1）

c = r-c;
d = d-r;
independence_test = '不相关';
for i = 1:m
    if c(i)>0
        independence_test = '自相关';
    else if d(i)<0
            independence_test = '自相关';
        end
    end
end


%xlswrite('G:\Copula\shuchu.xlsx', r);
% xlswrite('G:\Copula\shuchu.xlsx', c,2);
% xlswrite('G:\Copula\shuchu.xlsx', d,3);
end

