function [ output_args ] = Hysen ( real,p)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

n = length(real);            %�����������X���еĳ���n
NOX_real_p=norminv(p/100,0,1);      %�������Ƶ��p��Ӧ��λ������xp
plot(NOX_real_p,real,'.')
hold on 


%���ƺ�ɭ���ʸ�ֽ
legend('�����','Cs=Cv','Cs=2Cv','Cs=3Cv','Cs=4Cv')
%���ú�ɭ���ʸ�ֽ��������
PL=[0.01 0.05 0.5 1 2 5 10 20 30 40 50 60 70 80 90 95 98 99 99.9 99.99]
%PLΪƵ�ʣ���ʾ�ں�ɭ���ʸ�ֽ�ĺ�������
xx=norminv(PL/100,0,1);     %PL����Ӧ�ĺ�ɭ���ʸ�ֽ�ĺ�����
yy=[7000:1000:25000];          %������ļ������
axis([min(xx),max(xx),min(yy),max(yy)])        %����������ķ�Χ
set(gca,'xtick',[xx],'ytick',[yy])              %����������Ŀ̶�
set(gca,'xticklabel',[PL],'yticklabel',[yy])
grid on
% title('ĳվ��������ۻ�Ƶ������');
xlabel('Ƶ��P(%)')
ylabel('�����һ������(m3/s)')
hold off

end

