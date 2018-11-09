function [ output_args ] = Hysen_Pareto( real,p,K,SIGMA,THETA )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%���룬����ʵ������
n = length(real);            %�����������X���еĳ���n
NOX_real_p=norminv(p/100,0,1);      %�������Ƶ��p��Ӧ��λ������xp
plot(NOX_real_p,real,'.')
hold on 

%���������й�ʽ��ֵ1
x=6500:10:25000;           %������
P=gpcdf( x,K(1),SIGMA(1),THETA(1) );     %��������Ƶ��P
XP=norminv(1-P,0,1);              %��������Ƶ��P����Ӧ������XP

%��������������
plot(XP,x,'m--')

%���������й�ʽ��ֵ2
x=6500:10:25000;           %������
P=gpcdf( x,K(2),SIGMA(2),THETA(2) );     %��������Ƶ��P
XP=norminv(1-P,0,1);              %��������Ƶ��P����Ӧ������XP

%��������������
plot(XP,x,'r-.')


%���������й�ʽ��ֵ3
x=6500:10:25000;           %������
P=gpcdf( x,K(3),SIGMA(3),THETA(3) );     %��������Ƶ��P
XP=norminv(1-P,0,1);              %��������Ƶ��P����Ӧ������XP

%��������������
plot(XP,x,'-')

%���������й�ʽ��ֵ4
x=6500:10:25000;           %������
P=gpcdf( x,K(4),SIGMA(4),THETA(4) );     %��������Ƶ��P
XP=norminv(1-P,0,1);              %��������Ƶ��P����Ӧ������XP

%��������������
plot(XP,x,'-')

%���������й�ʽ��ֵ5
x=6500:10:25000;           %������
P=gpcdf( x,K(5),SIGMA(5),THETA(5) );     %��������Ƶ��P
XP=norminv(1-P,0,1);              %��������Ƶ��P����Ӧ������XP

%��������������
plot(XP,x,'-')

%���������й�ʽ��ֵ6
x=6500:10:25000;           %������
P=gpcdf( x,K(6),SIGMA(6),THETA(6) );     %��������Ƶ��P
XP=norminv(1-P,0,1);              %��������Ƶ��P����Ӧ������XP

%��������������
plot(XP,x,'-')

%���ƺ�ɭ���ʸ�ֽ
legend('�����','Cs=Cv','Cs=2Cv','Cs=3Cv','Cs=4Cv')
%���ú�ɭ���ʸ�ֽ��������
PL=[0.01 0.05 0.5 1 2 5 10 20 30 40 50 60 70 80 90 95 98 99 99.9 99.99]
%PLΪƵ�ʣ���ʾ�ں�ɭ���ʸ�ֽ�ĺ�������
xx=norminv(PL/100,0,1);     %PL����Ӧ�ĺ�ɭ���ʸ�ֽ�ĺ�����
yy=[6500:1500:25000];          %������ļ������
axis([min(xx),max(xx),min(yy),max(yy)])        %����������ķ�Χ
set(gca,'xtick',[xx],'ytick',[yy])              %����������Ŀ̶�
set(gca,'xticklabel',[PL],'yticklabel',[yy])
grid on
% title('ĳվ��������ۻ�Ƶ������');
xlabel('Ƶ��P(%)')
ylabel('�����һ������(m3/s)')
hold off


end

