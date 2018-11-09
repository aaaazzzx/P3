function [ u ] = jump( NOX )
%   跳跃性检验
%   此处显示详细说明

n = length ( NOX ) ;
Ex = mean ( NOX ) ;

for i = 1 : n 
    if NOX(i) > Ex
        a (i) = 1 ;
    else
        a (i) = 0 ;
    end 
end
r = 0 ;
for i = 1 : (n-1)
    r = abs( a(i)-a(i+1) ) + r ;
end

n1 = sum(a);
n2 = n - n1;
ur = 2 * n1 * n2 / n + 1 ;
Sigma = (2*n1*n2*(2*n1*n2-n)/(n*n*(n-1)))^0.5 ;
u = (r-ur)/Sigma;

end

