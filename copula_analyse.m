clc
clear
disp 'ע�Ᵽ�����ĸ������������������ʱӦ�����¸��ĳ���ĸ�ʽ'
disp '����Ҫע��ͼ����x��y��ķ�Χ������������Ҫ���¶���'
X = xlsread('E:\lhx\Copula\���վ����վ��������ֵ.xls');
%��׼��kendallϵ��Ϊ0.66(0.67,kendall=3.0934)
time=X(:,1);    %ʱ������
x1 = X(:,2);    %����վ�����������
x3 = X(:,3);    %���������
x7 = X(:,4);    %���������
n=length(time);
%=========�����������������ݽ��з���==================
x = x1;
y = x3;


[ex,cvx,csx]=f_lm(x,n,n,n,0);  %��׼����7070��0.44��1.03
[ey,cvy,csy]=f_lm(y,n,n,n,0) ; %��׼����15.5��0.45��1.17
t=corr(x,x3,'type','kendall');
theta_gumbel=1/(1-t)
%��gumbel�������м���
disp 'K-S����'
ks_gumbel(x,y,theta_gumbel,ex,cvx,csx,ey,cvy,csy)
disp 'Enter���������м���'
pause
disp 'Genest-Rivest ����'    %???????????????������鷽�����������⣬��һ��
gr_gumbel(x,y,theta_gumbel)
disp 'Enter���������м���'
pause
disp '���ƽ���ͼ���'
ols_gumbel(x,y,theta_gumbel,ex,cvx,csx,ey,cvy,csy)%�����Ϸֲ�����F��q��W7��
u=1-p3cdf(x,ex,cvx,csx,n);
v=1-p3cdf(y,ey,cvy,csy,n);
c_gumbel=exp(-((-log(u)).^theta_gumbel+(-log(v)).^theta_gumbel).^(1/theta_gumbel));

disp '���Ϸֲ�'
disp 'Ҫע���ֵ�ߵ�x��y��ķ�Χ������������Ҫ���¶���'
pause

p_con=zeros(1,38);u_con=zeros(38,1);v_con=zeros(38,1);x_con=zeros(38,1);y_con=zeros(38,1);
p_con=xlsread('e:\�����ļ�\p.xls');
u_con=1-p_con';v_con=1-p_con';
x_con=p3inv(p_con',ex,cvx,csx,38);y_con=p3inv(p_con',ey,cvy,csy,38);
%x_p=zeros(n,n);y_p=zeros(n,n);u1=zeros(n,n);v1=zeros(n,n);mesh_c=zeros(n,n);
[x_p,y_p]=meshgrid(sort(x_con),sort(y_con));
%[u1,v1]=meshgrid(sort(u),sort(v));
[u1,v1]=meshgrid(sort(u_con),sort(v_con));
mesh_c=exp(-((-log(u1)).^theta_gumbel+(-log(v1)).^theta_gumbel).^(1/theta_gumbel));
surf(x_p,y_p,mesh_c)
title('���Q�ͺ���W_3�����Ϸֲ�')
xlabel('Q[10^4m^3/s]')
ylabel('W_3[10^8m^3]')
zlabel('F(q,W^3)')
axis([0 max(x_con)+1 0  max(y_con)+1 0 1.01])


disp '�����ֲ�1��P[X>x or Y>y]��������������'
pause
%�����ֲ�1��P[X>x or Y>y]
t_o=zeros(size(mesh_c));
t_o=1./(1-mesh_c);
surf(x_p,y_p,t_o)
title('���Q�ͺ���W_3������������T_o��άͼ')
xlabel('Q[10^4m^3/s]')
ylabel('W_3[10^8m^3]')
zlabel('����������T_o')
axis([0 max(x_con)+1 0  max(y_con)+1 0 max(max(t_o))])



disp '�����ֲ�2��P[X>x,Y>y]����ͬ��������'
pause
%�����ֲ�2��P[X>x,Y>y]
t_a=zeros(size(mesh_c));
t_a=1./(1-u1-v1+mesh_c);
surf(x_p,y_p,t_a)
title('���Q�ͺ���W_3��ͬ��������T_a��άͼ')
xlabel('Q[10^4m^3/s]')
ylabel('W_3[10^8m^3]')
zlabel('ͬ��������T_a')
axis([0 max(x_con)+1 0  max(y_con)+1 0 max(max(t_a))])


disp '��������Ƶ�����ֵ1��Q>q0.1%��q1%ʱ�µ�����Ƶ��'
disp '��������Ƶ�����ֵ1��W>W0.1%��W1%ʱ�µ�����Ƶ��,���ߵĸ�����һ���Ͳ������¼�����'
pause
%��������Ƶ�����ֵ1��Q>q0.1%��q1%ʱ�µ�����Ƶ��
%p_con=zeros(1,38);u_con=zeros(38,1);v_con=zeros(38,1);x_con=zeros(38,1);y_con=zeros(38,1);
p_conu1=zeros(38,1);p_conu2=zeros(38,1);
%p_con=xlsread('C:\Documents and Settings\Administrator\����\�����ļ�\p.xls');
%u_con=1-p_con';v_con=1-p_con';
%x_con=p3inv(p_con',ex,cvx,csx,38);y_con=p3inv(p_con',ey,cvy,csy,38);
p_conu=zeros(38,2);
% q0.1%ʱ�µ�����Ƶ��  
p_conu1=exp(-((-log(0.999)).^theta_gumbel+(-log(v_con)).^theta_gumbel).^(1/theta_gumbel));%Q>q0.1%
p_conu(:,1)=(1-0.999-v_con+p_conu1)/(1-0.999);          
%q1%ʱ�µ�����Ƶ��  
p_conu2=exp(-((-log(0.99)).^theta_gumbel+(-log(v_con)).^theta_gumbel).^(1/theta_gumbel));%Q>q0.1%
p_conu(:,2)=(1-0.99-v_con+p_conu2)/(1-0.99);        
%��������Ƶ�����ֵ1��W>W0.1%��W1%ʱ�µ�����Ƶ��,���ߵĸ�����һ���Ͳ������¼�����

disp '�������������ں�ͬ��������'
pause
%�������������ں�ͬ��������
t_con1=zeros(38,1);t_con2=zeros(38,1);p_cont=zeros(38,1);
p_cont=exp(-((-log(u_con)).^theta_gumbel+(-log(v_con)).^theta_gumbel).^(1/theta_gumbel));
t_con1=1./(1-p_cont);  %����������
t_con2=1./(1-u_con-v_con+p_cont);%ͬ��������

disp '�����������������'
pause
%������
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
disp '�������'
