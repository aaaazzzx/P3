function P_fit(X)
X=sort(X);              %sort是把流量从小到大排列
X=fliplr(X);            %把流量x从大到小排列
n=length(X);            %求出流量资料X序列的长度n

%计算经验频率，并算出相应的位置坐标，并绘出经验点
p=[[1:n]/(n+1)];        %求经验频率p
xp=norminv(p,0,1);      %求出经验频率p对应的位置坐标xp
%横坐标：x=norminv(p,mu,sigma),标准正态分布时，mu=0,sigma=1)
plot(xp,X,'.')
hold on 

%绘制海森机率格纸
x=0:10:40000;           %纵坐标
m=mean(X)               %计算样本X的均值
K=X/m;                  %计算模比系数K
Cv=sqrt((1/(n-1)).*sum((K-1).^2));      %计算变差系数Cv（利用的是课本51页样本的无偏估计）
%Cs=(sum((K-1).^3))/(Cv^3)/(n-3);        %计算偏态系数Cs
Cs=Cv;
alfa=4/(Cs^2);
beta=(m*Cv*Cs)/2;
a0=m-2*Cv*m/Cs;
P=1-gamcdf(x-a0,alfa,beta);     %计算理论频率P
XP=norminv(P,0,1);              %计算理论频率P所对应的坐标XP
plot(XP,x,'r-.')
gtext('Cs=Cv','FontSize',8)
Cs=2*Cv;
alfa=4/(Cs^2);
beta=(m*Cv*Cs)/2;
a0=m-2*Cv*m/Cs;
P=1-gamcdf(x-a0,alfa,beta);     %计算理论频率P
XP=norminv(P,0,1);              %计算理论频率P所对应的坐标XP
plot(XP,x,'m--')
gtext('Cs=2Cv','FontSize',8)
Cs=3*Cv;
alfa=4/(Cs^2);
beta=(m*Cv*Cs)/2;
a0=m-2*Cv*m/Cs;
P=1-gamcdf(x-a0,alfa,beta);     %计算理论频率P
XP=norminv(P,0,1);              %计算理论频率P所对应的坐标XP
plot(XP,x,'-')
gtext('Cs=3Cv','FontSize',8)
Cs=4*Cv;
alfa=4/(Cs^2);
beta=(m*Cv*Cs)/2;
a0=m-2*Cv*m/Cs;
P=1-gamcdf(x-a0,alfa,beta);     %计算理论频率P
XP=norminv(P,0,1);              %计算理论频率P所对应的坐标XP
plot(XP,x,'c:')
gtext('Cs=4Cv','FontSize',8)
legend('经验点','Cs=Cv','Cs=2Cv','Cs=3Cv','Cs=4Cv')
%设置海森机率格纸的坐标轴
PL=[0.01 0.05 0.5 1 2 5 10 20 30 40 50 60 70 80 90 95 98 99 99.9 99.99]
%PL为频率，显示在海森机率格纸的横坐标轴
xx=norminv(PL/100,0,1);     %PL所对应的海森机率格纸的横坐标
yy=[0:5000:40000];          %纵坐标的间隔设置
axis([min(xx),max(xx),min(yy),max(yy)])        %设置坐标轴的范围
set(gca,'xtick',[xx],'ytick',[yy])              %设置坐标轴的刻度
set(gca,'xticklabel',[PL],'yticklabel',[yy])
grid on
title('某站最大流量累积频率曲线');
xlabel('频率P(%)')
ylabel('最大流量Q(m3/s)')
hold off





