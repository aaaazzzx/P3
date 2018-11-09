function P_fit(X)
X=sort(X);              %sort�ǰ�������С��������
X=fliplr(X);            %������x�Ӵ�С����
n=length(X);            %�����������X���еĳ���n

%���㾭��Ƶ�ʣ��������Ӧ��λ�����꣬����������
p=[[1:n]/(n+1)];        %����Ƶ��p
xp=norminv(p,0,1);      %�������Ƶ��p��Ӧ��λ������xp
%�����꣺x=norminv(p,mu,sigma),��׼��̬�ֲ�ʱ��mu=0,sigma=1)
plot(xp,X,'.')
hold on 

%���ƺ�ɭ���ʸ�ֽ
x=0:10:40000;           %������
m=mean(X)               %��������X�ľ�ֵ
K=X/m;                  %����ģ��ϵ��K
Cv=sqrt((1/(n-1)).*sum((K-1).^2));      %������ϵ��Cv�����õ��ǿα�51ҳ��������ƫ���ƣ�
%Cs=(sum((K-1).^3))/(Cv^3)/(n-3);        %����ƫ̬ϵ��Cs
Cs=Cv;
alfa=4/(Cs^2);
beta=(m*Cv*Cs)/2;
a0=m-2*Cv*m/Cs;
P=1-gamcdf(x-a0,alfa,beta);     %��������Ƶ��P
XP=norminv(P,0,1);              %��������Ƶ��P����Ӧ������XP
plot(XP,x,'r-.')
gtext('Cs=Cv','FontSize',8)
Cs=2*Cv;
alfa=4/(Cs^2);
beta=(m*Cv*Cs)/2;
a0=m-2*Cv*m/Cs;
P=1-gamcdf(x-a0,alfa,beta);     %��������Ƶ��P
XP=norminv(P,0,1);              %��������Ƶ��P����Ӧ������XP
plot(XP,x,'m--')
gtext('Cs=2Cv','FontSize',8)
Cs=3*Cv;
alfa=4/(Cs^2);
beta=(m*Cv*Cs)/2;
a0=m-2*Cv*m/Cs;
P=1-gamcdf(x-a0,alfa,beta);     %��������Ƶ��P
XP=norminv(P,0,1);              %��������Ƶ��P����Ӧ������XP
plot(XP,x,'-')
gtext('Cs=3Cv','FontSize',8)
Cs=4*Cv;
alfa=4/(Cs^2);
beta=(m*Cv*Cs)/2;
a0=m-2*Cv*m/Cs;
P=1-gamcdf(x-a0,alfa,beta);     %��������Ƶ��P
XP=norminv(P,0,1);              %��������Ƶ��P����Ӧ������XP
plot(XP,x,'c:')
gtext('Cs=4Cv','FontSize',8)
legend('�����','Cs=Cv','Cs=2Cv','Cs=3Cv','Cs=4Cv')
%���ú�ɭ���ʸ�ֽ��������
PL=[0.01 0.05 0.5 1 2 5 10 20 30 40 50 60 70 80 90 95 98 99 99.9 99.99]
%PLΪƵ�ʣ���ʾ�ں�ɭ���ʸ�ֽ�ĺ�������
xx=norminv(PL/100,0,1);     %PL����Ӧ�ĺ�ɭ���ʸ�ֽ�ĺ�����
yy=[0:5000:40000];          %������ļ������
axis([min(xx),max(xx),min(yy),max(yy)])        %����������ķ�Χ
set(gca,'xtick',[xx],'ytick',[yy])              %����������Ŀ̶�
set(gca,'xticklabel',[PL],'yticklabel',[yy])
grid on
title('ĳվ��������ۻ�Ƶ������');
xlabel('Ƶ��P(%)')
ylabel('�������Q(m3/s)')
hold off





