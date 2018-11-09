function  gr=gr_gumbel(x,y,gumbel_theta)
%标准的kendall系数为0.66

n=length(x);
%plot(x,y,'.')
%lsline
%refline(0,10)
%t_kendall=corr(x,y,'type','kendall');
%gumbel_theta=1/(1-t_kendall);
%gumbel_theta=11.9
%gumbel_copula的Genest—Rivest检验
t_j=[0:0.05:1];
m=length(t_j);
t_j(1)=0.01;t_j(m)=0.99;
kc=zeros(size(t_j));
kc=t_j-((t_j).*log(t_j)/gumbel_theta);
ke=f_ke(x,y,t_j);
plot(kc,ke,'+')
refline(1,0)
title('Genset-Rivest拟合优度检验')
xlabel('理论估计  Kt')
ylabel('经验估计  Ke')
axis([0 1 0 1])
grid on