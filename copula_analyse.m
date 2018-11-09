clc
clear
disp '注意保存结果的个数，在作具体的问题时应该重新更改程序的格式'
disp '尤其要注意图形中x，y轴的范围，具体问题需要重新定义'
X = xlsread('E:\lhx\Copula\漯河站阜阳站三类序列值.xls');
%标准的kendall系数为0.66(0.67,kendall=3.0934)
time=X(:,1);    %时间序列
x1 = X(:,2);    %阜阳站年最大洪峰流量
x3 = X(:,3);    %年最大三日
x7 = X(:,4);    %年最大七日
n=length(time);
%=========决定采用哪两组数据进行分析==================
x = x1;
y = x3;


[ex,cvx,csx]=f_lm(x,n,n,n,0);  %标准的是7070，0.44，1.03
[ey,cvy,csy]=f_lm(y,n,n,n,0) ; %标准的是15.5，0.45，1.17
t=corr(x,x3,'type','kendall');
theta_gumbel=1/(1-t)
%对gumbel函数进行检验
disp 'K-S检验'
ks_gumbel(x,y,theta_gumbel,ex,cvx,csx,ey,cvy,csy)
disp 'Enter键继续进行检验'
pause
disp 'Genest-Rivest 检验'    %???????????????这个检验方法还是有问题，该一下
gr_gumbel(x,y,theta_gumbel)
disp 'Enter键继续进行检验'
pause
disp '离差平方和检验'
ols_gumbel(x,y,theta_gumbel,ex,cvx,csx,ey,cvy,csy)%求联合分布函数F（q，W7）
u=1-p3cdf(x,ex,cvx,csx,n);
v=1-p3cdf(y,ey,cvy,csy,n);
c_gumbel=exp(-((-log(u)).^theta_gumbel+(-log(v)).^theta_gumbel).^(1/theta_gumbel));

disp '联合分布'
disp '要注意等值线的x，y轴的范围，具体问题需要重新定义'
pause

p_con=zeros(1,38);u_con=zeros(38,1);v_con=zeros(38,1);x_con=zeros(38,1);y_con=zeros(38,1);
p_con=xlsread('e:\程序文件\p.xls');
u_con=1-p_con';v_con=1-p_con';
x_con=p3inv(p_con',ex,cvx,csx,38);y_con=p3inv(p_con',ey,cvy,csy,38);
%x_p=zeros(n,n);y_p=zeros(n,n);u1=zeros(n,n);v1=zeros(n,n);mesh_c=zeros(n,n);
[x_p,y_p]=meshgrid(sort(x_con),sort(y_con));
%[u1,v1]=meshgrid(sort(u),sort(v));
[u1,v1]=meshgrid(sort(u_con),sort(v_con));
mesh_c=exp(-((-log(u1)).^theta_gumbel+(-log(v1)).^theta_gumbel).^(1/theta_gumbel));
surf(x_p,y_p,mesh_c)
title('洪峰Q和洪量W_3的联合分布')
xlabel('Q[10^4m^3/s]')
ylabel('W_3[10^8m^3]')
zlabel('F(q,W^3)')
axis([0 max(x_con)+1 0  max(y_con)+1 0 1.01])


disp '条件分布1：P[X>x or Y>y]－－联合重现期'
pause
%条件分布1：P[X>x or Y>y]
t_o=zeros(size(mesh_c));
t_o=1./(1-mesh_c);
surf(x_p,y_p,t_o)
title('洪峰Q和洪量W_3的联合重现期T_o三维图')
xlabel('Q[10^4m^3/s]')
ylabel('W_3[10^8m^3]')
zlabel('联合重现期T_o')
axis([0 max(x_con)+1 0  max(y_con)+1 0 max(max(t_o))])



disp '条件分布2：P[X>x,Y>y]－－同现重现期'
pause
%条件分布2：P[X>x,Y>y]
t_a=zeros(size(mesh_c));
t_a=1./(1-u1-v1+mesh_c);
surf(x_p,y_p,t_a)
title('洪峰Q和洪量W_3的同现重现期T_a三维图')
xlabel('Q[10^4m^3/s]')
ylabel('W_3[10^8m^3]')
zlabel('同现重现期T_a')
axis([0 max(x_con)+1 0  max(y_con)+1 0 max(max(t_a))])


disp '计算条件频率设计值1：Q>q0.1%和q1%时下的条件频率'
disp '计算条件频率设计值1：W>W0.1%和W1%时下的条件频率,二者的概率是一样就不用重新计算了'
pause
%计算条件频率设计值1：Q>q0.1%和q1%时下的条件频率
%p_con=zeros(1,38);u_con=zeros(38,1);v_con=zeros(38,1);x_con=zeros(38,1);y_con=zeros(38,1);
p_conu1=zeros(38,1);p_conu2=zeros(38,1);
%p_con=xlsread('C:\Documents and Settings\Administrator\桌面\程序文件\p.xls');
%u_con=1-p_con';v_con=1-p_con';
%x_con=p3inv(p_con',ex,cvx,csx,38);y_con=p3inv(p_con',ey,cvy,csy,38);
p_conu=zeros(38,2);
% q0.1%时下的条件频率  
p_conu1=exp(-((-log(0.999)).^theta_gumbel+(-log(v_con)).^theta_gumbel).^(1/theta_gumbel));%Q>q0.1%
p_conu(:,1)=(1-0.999-v_con+p_conu1)/(1-0.999);          
%q1%时下的条件频率  
p_conu2=exp(-((-log(0.99)).^theta_gumbel+(-log(v_con)).^theta_gumbel).^(1/theta_gumbel));%Q>q0.1%
p_conu(:,2)=(1-0.99-v_con+p_conu2)/(1-0.99);        
%计算条件频率设计值1：W>W0.1%和W1%时下的条件频率,二者的概率是一样就不用重新计算了

disp '计算联合重现期和同现重现期'
pause
%计算联合重现期和同现重现期
t_con1=zeros(38,1);t_con2=zeros(38,1);p_cont=zeros(38,1);
p_cont=exp(-((-log(u_con)).^theta_gumbel+(-log(v_con)).^theta_gumbel).^(1/theta_gumbel));
t_con1=1./(1-p_cont);  %联合重现期
t_con2=1./(1-u_con-v_con+p_cont);%同现重现期

disp '保存计算结果…………'
pause
%保存结果
xlswrite('d:\multi_variabel result.xls',x,'sheet1','a4:a57');
xlswrite('d:\multi_variabel result.xls',y,'sheet1','b4:b57');
xlswrite('d:\multi_variabel result.xls',u,'sheet1','c4:c57');
xlswrite('d:\multi_variabel result.xls',v,'sheet1','d4:d57');
xlswrite('d:\multi_variabel result.xls',c_gumbel,'sheet1','e4:e57');
xlswrite('d:\multi_variabel result.xls',p_con'*100,'sheet1','h4:h41');
xlswrite('d:\multi_variabel result.xls',y_con,'sheet1','g4:g41');
xlswrite('d:\multi_variabel result.xls',p_conu(:,1)*100,'sheet1','i4:i41');
xlswrite('d:\multi_variabel result.xls',p_conu(:,2)*100,'sheet1','l4:l41');
xlswrite('d:\multi_variabel result.xls',p_con'*100,'sheet1','k4:k41');
xlswrite('d:\multi_variabel result.xls',y_con,'sheet1','j4:j41');
xlswrite('d:\multi_variabel result.xls',x_con,'sheet1','n4:n41');
xlswrite('d:\multi_variabel result.xls',p_con'*100,'sheet1','o4:o41');
xlswrite('d:\multi_variabel result.xls',p_con'*100,'sheet2','a4:a41');
xlswrite('d:\multi_variabel result.xls',1./p_con','sheet2','b4:b41');
xlswrite('d:\multi_variabel result.xls',x_con,'sheet2','c4:c41');
xlswrite('d:\multi_variabel result.xls',y_con,'sheet2','d4:d41');
xlswrite('d:\multi_variabel result.xls',t_con1,'sheet2','e4:e41');
xlswrite('d:\multi_variabel result.xls',t_con2,'sheet2','f4:f41');
disp '程序结束'
