function [ output_args ] = Hysen_Pareto( real,p,K,SIGMA,THETA )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%输入，绘制实测数据
n = length(real);            %求出流量资料X序列的长度n
NOX_real_p=norminv(p/100,0,1);      %求出经验频率p对应的位置坐标xp
plot(NOX_real_p,real,'.')
hold on 

%依据帕累托公式求值1
x=6500:10:25000;           %纵坐标
P=gpcdf( x,K(1),SIGMA(1),THETA(1) );     %计算理论频率P
XP=norminv(1-P,0,1);              %计算理论频率P所对应的坐标XP

%绘制帕累托曲线
plot(XP,x,'m--')

%依据帕累托公式求值2
x=6500:10:25000;           %纵坐标
P=gpcdf( x,K(2),SIGMA(2),THETA(2) );     %计算理论频率P
XP=norminv(1-P,0,1);              %计算理论频率P所对应的坐标XP

%绘制帕累托曲线
plot(XP,x,'r-.')


%依据帕累托公式求值3
x=6500:10:25000;           %纵坐标
P=gpcdf( x,K(3),SIGMA(3),THETA(3) );     %计算理论频率P
XP=norminv(1-P,0,1);              %计算理论频率P所对应的坐标XP

%绘制帕累托曲线
plot(XP,x,'-')

%依据帕累托公式求值4
x=6500:10:25000;           %纵坐标
P=gpcdf( x,K(4),SIGMA(4),THETA(4) );     %计算理论频率P
XP=norminv(1-P,0,1);              %计算理论频率P所对应的坐标XP

%绘制帕累托曲线
plot(XP,x,'-')

%依据帕累托公式求值5
x=6500:10:25000;           %纵坐标
P=gpcdf( x,K(5),SIGMA(5),THETA(5) );     %计算理论频率P
XP=norminv(1-P,0,1);              %计算理论频率P所对应的坐标XP

%绘制帕累托曲线
plot(XP,x,'-')

%依据帕累托公式求值6
x=6500:10:25000;           %纵坐标
P=gpcdf( x,K(6),SIGMA(6),THETA(6) );     %计算理论频率P
XP=norminv(1-P,0,1);              %计算理论频率P所对应的坐标XP

%绘制帕累托曲线
plot(XP,x,'-')

%绘制海森机率格纸
legend('经验点','Cs=Cv','Cs=2Cv','Cs=3Cv','Cs=4Cv')
%设置海森机率格纸的坐标轴
PL=[0.01 0.05 0.5 1 2 5 10 20 30 40 50 60 70 80 90 95 98 99 99.9 99.99]
%PL为频率，显示在海森机率格纸的横坐标轴
xx=norminv(PL/100,0,1);     %PL所对应的海森机率格纸的横坐标
yy=[6500:1500:25000];          %纵坐标的间隔设置
axis([min(xx),max(xx),min(yy),max(yy)])        %设置坐标轴的范围
set(gca,'xtick',[xx],'ytick',[yy])              %设置坐标轴的刻度
set(gca,'xticklabel',[PL],'yticklabel',[yy])
grid on
% title('某站最大流量累积频率曲线');
xlabel('频率P(%)')
ylabel('年最枯一月流量(m3/s)')
hold off


end

