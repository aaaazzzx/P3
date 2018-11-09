function ol=ols_gumbel(x,y,gumbel_theta,ex,cvx,csx,ey,cvy,csy)
n=length(x);
%plot(x,y,'.')
%lsline
%refline(0,10)
%t_kendall=corr(x,y,'type','kendall');
%gumbel_theta=1/(1-t_kendall);
%OLS检验
x1=sort(x);
y1=sort(y);
u=zeros(n,1);
v=zeros(n,1);
u=1-p3cdf(x1,ex,cvx,csy,n);
v=1-p3cdf(y1,ey,cvy,csy,n);
ck=zeros(n,1);
ck=exp(-((-log(u)).^gumbel_theta+(-log(v)).^gumbel_theta).^(1/gumbel_theta)); %理论的C求出来了
cex=zeros(n,n);
ce=zeros(n,1);
cex=fcexp(x,y);
ce=diag(cex);
plot(ck,ce,'+')
refline(1,0)
title('OLS拟合优度检验')
xlabel('理论估计  Ct')
ylabel('经验估计  Ce')
axis([0 1 0 1])
grid on
ols1=zeros(n,1);
ols1=(ce-ck).^2;
ols1=cumsum(ols1);
ols=sqrt(ols1(n)/n)