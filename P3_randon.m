function [ z ] = P3_randon( Ex,Cv,Cs,m )
%   生成m个P3随机数
%   此处显示详细说明

a0 = Ex * (1-2*Cv/Cs) ;
Beta = 2 / (Ex * Cv * Cs) ;
Alpha = 4 / Cs^2 ;
n = floor(Alpha);
p = Alpha - n ;
for l = 1 : 200
for i = 1:m
    for j = 1 : n
        u(j) = rand ;
    end
    for j = 1 : n
        u(j) = log(u(j));
    end
    y = -sum(u) ;
    s1 = 0 ;
    s2 = 0 ;
    while ((s1 + s2)<=1)
        n1 = rand ;
        n2 = rand ;
        n3 = rand ;
        s1 = n1^p ;
        s2 = n2^p ;
    end
    t = s1 / (s1+s2) ;
    x = -t * log(n3) ;
    z(i,l) = x + y ;
    z(i,l) = z(i,l) / Beta + a0 ;
end
end
xlswrite('C:\Users\LHX\Desktop\p3\new.xls', z);
end

