function [ independence_test ] = independence ( NOX )
%   �����Լ���
%   0.05������ˮƽ

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
c(m+1) = (-1-1.96*sqrt(n-1))/(n);       %cΪ����
d(m+1) = (-1+1.96*sqrt(n-1))/(n);       %dΪ����

c(:,1)=[];
d(:,1)=[];
%ɾ����һ�У���Ϊ��һ�бض�������r��һ����Ϊ1��

c = r-c;
d = d-r;
independence_test = '�����';
for i = 1:m
    if c(i)>0
        independence_test = '�����';
    else if d(i)<0
            independence_test = '�����';
        end
    end
end


%xlswrite('G:\Copula\shuchu.xlsx', r);
% xlswrite('G:\Copula\shuchu.xlsx', c,2);
% xlswrite('G:\Copula\shuchu.xlsx', d,3);
end

