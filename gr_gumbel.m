function  gr=gr_gumbel(x,y,gumbel_theta)
%��׼��kendallϵ��Ϊ0.66

n=length(x);
%plot(x,y,'.')
%lsline
%refline(0,10)
%t_kendall=corr(x,y,'type','kendall');
%gumbel_theta=1/(1-t_kendall);
%gumbel_theta=11.9
%gumbel_copula��Genest��Rivest����
t_j=[0:0.05:1];
m=length(t_j);
t_j(1)=0.01;t_j(m)=0.99;
kc=zeros(size(t_j));
kc=t_j-((t_j).*log(t_j)/gumbel_theta);
ke=f_ke(x,y,t_j);
plot(kc,ke,'+')
refline(1,0)
title('Genset-Rivest����Ŷȼ���')
xlabel('���۹���  Kt')
ylabel('�������  Ke')
axis([0 1 0 1])
grid on