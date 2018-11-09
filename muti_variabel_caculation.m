clc
clear
disp '注意保存结果的个数，在作具体的问题时应该重新更改程序的格式'
%标准的kendall系数为0.66(0.67,kendall=3.0934)
x=[2560
1060
1745
2250
3120
2480
2850
2950
2180
520
1220
970
1500
2860
3020
3310
372
1520
1770
1670
740
2550
3060
1360
1070
3280
2190
812
818
2160
2080
712
3010
2270
2840
1980
277
788
1210
1940
1320
1480
324
355
779
1040
1300
578
1990
467
2690
1230
1350
2480
2550
1780
1480
2120
1440
550
2700
1200
1030
512
];
y=[1080
1050
3460
3760
2540
2680
3210
3340
2560
350
700
1630
1520
2450
2940
1800
257
966
2720
1620
301
2480
1490
2190
830
3950
1740
542
830
1640
1190
264
3600
2900
1750
1490
303
294
1760
1080
1020
728
184
308
1130
1620
1940
231
2160
660
3120
1700
1100
1880
2450
1030
290
1340
221
372
2860
1170
1200
332
];
n=length(x);
[ex,cvx,csx]=f_lm(x,n,n,n,0);  %标准的是7070，0.44，1.03
[ey,cvy,csy]=f_lm(y,n,n,n,0) ; %标准的是15.5，0.45，1.17
t=corr(x,y,'type','kendall');
theta_gumbel=1/(1-t)
%对gumbel函数进行检验
disp 'K-S检验'
%ks_gumbel(x,y,theta_gumbel,ex,cvx,csx,ey,cvy,csy)
disp 'Enter键继续进行检验'
pause
disp 'Genest-Rivest 检验'    %???????????????这个检验方法还是有问题，该一下
gr_gumbel(x,y,theta_gumbel)
disp 'Enter键继续进行检验'
pause
disp '离差平方和检验'
ols_gumbel(x,y,theta_gumbel,ex,cvx,csx,ey,cvy,csy)
%求联合分布函数F（q，W7）
u=1-p3cdf(x,ex,cvx,csx,n);
v=1-p3cdf(y,ey,cvy,csy,n);
c_gumbel=exp(-((-log(u)).^theta_gumbel+(-log(v)).^theta_gumbel).^(1/theta_gumbel));

%================================text1=============================

disp '联合分布'
pause
%联合分布作图
%x_p=zeros(n+5,n+5);y_p=zeros(n+5,n+5);u1=zeros(n+5,n+5);v1=zeros(n+5,n+5);mesh_c=zeros(n+5,n+5);
%dx=min(x)/5;x_p(2:5,1)=[1:4]*dx;x_p(6:n+5,1)=x; x_p(1)=10;y_p(1)=0.1;
%dy=min(y/5);y_p(2:5,1)=[1:4]*dy;y_p(6:n+5,1)=y;
%u1(1:5,1)=1-p3cdf(x_p(1:5,1),ex,cvx,csx,5);
%v1(1:5,1)=1-p3cdf(y_p(1:5,1),ey,cvy,csy,5);
%u1(6:n+5,1)=u;v1(6:n+5,1)=v;

x_p=zeros(n,n);y_p=zeros(n,n);u1=zeros(n,n);v1=zeros(n,n);mesh_c=zeros(n,n);
[x_p,y_p]=meshgrid(sort(x),sort(y));
[u1,v1]=meshgrid(sort(u),sort(v));
mesh_c=exp(-((-log(u1)).^theta_gumbel+(-log(v1)).^theta_gumbel).^(1/theta_gumbel));
mesh(x_p,y_p,mesh_c)
title('洪峰Q和洪量W_3的联合分布')
xlabel('Q[10^4m^3/s]')
ylabel('W_3[10^8m^3]')
zlabel('F(q,W^3)')

disp '条件分布1：P[X>x or Y>y]'
pause
%条件分布1：P[X>x or Y>y]
t_o=zeros(size(mesh_c));
t_o=1./(1-mesh_c);
surf(x_p,y_p,t_o)
title('洪峰Q和洪量W_3的联合重现期T_o三维图')
xlabel('Q[10^4m^3/s]')
ylabel('W_3[10^8m^3]')
zlabel('联合重现期T_o')

disp '条件分布2：P[X>x,Y>y]'
pause
%条件分布2：P[X>x,Y>y]
t_a=zeros(size(mesh_c));
t_a=1./(1-u1-v1+mesh_c);
surf(x_p,y_p,t_a)
title('洪峰Q和洪量W_3的同现重现期T_a三维图')
xlabel('Q[10^4m^3/s]')
ylabel('W_3[10^8m^3]')
zlabel('同现重现期T_a')

disp '计算条件频率设计值1：Q>q0.1%和q1%时下的条件频率'
disp '计算条件频率设计值1：W>W0.1%和W1%时下的条件频率,二者的概率是一样就不用重新计算了'
pause
%计算条件频率设计值1：Q>q0.1%和q1%时下的条件频率
p_con=zeros(1,38);u_con=zeros(38,1);v_con=zeros(38,1);x_con=zeros(38,1);y_con=zeros(38,1);
p_conu1=zeros(38,1);p_conu2=zeros(38,1);
p_con=xlsread('e:\程序文件\p.xls');     %输入设计频率
u_con=1-p_con';v_con=1-p_con';         
x_con=p3inv(p_con',ex,cvx,csx,38);y_con=p3inv(p_con',ey,cvy,csy,38); %求给定频率下的P3对应的设计值X
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
