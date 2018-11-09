function ks=ks_gumbel(x,y,gumbel_theta,ex,cvx,csx,ey,cvy,csy)
n=length(x);
%plot(x,y,'.')
%lsline
%refline(0,10)
%t=corr(x,y,'type','kendall');
%gumbel_theta=1/(1-t);
%gumbel_copula��K��S����
%��p-III�ֲ����ۻ�����
u_gumbel=p3cdf(x,ex,cvx,csx,n);
v_gumbel=p3cdf(y,ey,cvy,csy,n);
syms u v o;
f=sym('exp(-((-log(u))^o+(-log(v))^o)^(1/o))');
y1=diff(f,u,1);
o1=ones(n,1).*gumbel_theta;
f_test=subs(y1,{u,v,o},{u_gumbel,v_gumbel,o1});
[H,P,ksstat,CV]=kstest(f_test,[f_test unifcdf(f_test,0,1)],0.1);%H=0ͨ����kssatat<CV
H
ksstat
CV
if H==0
    disp "����ͨ��"
else     disp "����δͨ��"
end   

qqplot(x,y)