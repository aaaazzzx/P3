function [ output_args ] = Untitled( x , y )
%UNTITLED Copula
%   ���õ�P-3���ͣ�PWM�������Ʒ���

% x,yΪ��ˮ������
n = length(x);            %����������еĳ���n

%��Ϊ������� �Ӵ�С
x_series = sort(x,'descend');   %fuyang_series ����
y_series = sort(y,'descend');   %luohe_series  ���

%ȷ����������Ĳ����ֲ�����

%�������� P-3�ͷֲ�

%��������:Ex,Cv,Cs
%����
x_Ex_Cv_Cs = WF_U(x_series) ;   % Ex: 1684.7  Cv: 0.5376  Cs: 0.3039
y_Ex_Cv_Cs = WF_U(y_series) ;   % Ex: 1567.2  Cv: 0.6855  Cs: 0.8254

u = 1-P_3_rensult_P( x_Ex_Cv_Cs(1),x_Ex_Cv_Cs(2),x_Ex_Cv_Cs(3),x ) ;
v = 1-P_3_rensult_P( y_Ex_Cv_Cs(1),y_Ex_Cv_Cs(2),y_Ex_Cv_Cs(3),y ) ;
%��ʱ���������Ե�ֲ�

%U_p3 =  P_3_rensult_P( Ex,Cv,Cs,x )

% �ȼ���Kendallϵ��
Kendall = corr( x , y , 'type' , 'Kendall')    %coeff_peak=0.9985

%����Gumbel Copula�Ĳ���Alpha
Alpha = 1 / ( 1 - Kendall ) ;                   %

% %�Ծ����ۻ�Ƶ���������ۻ�Ƶ�ʽ��бȽ�
% 
% F_Theory = copulacdf ('Gumbel',[u(:),v(:)],Alpha)      %�����ۻ�Ƶ��
% for k=1:n
%     F_emp(k) = ( (n-find(x_series==x(k))+1) * (n-find(y_series==y(k))+1) )/(n*n+1);      %�����ۻ�Ƶ��
% end
% 
% scatter(F_Theory,F_emp,'.')     %����Q-Qͼ

%Q-Qͼ
Q_Q(x,y)

[Udata,Vdata] = meshgrid(sort(x),sort(y));     %��ͼ��Ҫ��������������
u2 = 1-P_3_rensult_P( x_Ex_Cv_Cs(1),x_Ex_Cv_Cs(2),x_Ex_Cv_Cs(3),Udata ) ;
v2 = 1-P_3_rensult_P( y_Ex_Cv_Cs(1),y_Ex_Cv_Cs(2),y_Ex_Cv_Cs(3),Vdata ) ;
Ccdf_norm = copulacdf('Gumbel',[u2(:),v2(:)],Alpha); % ����copulacdf���������ֵΪAlpha�Ķ�Ԫ�����׵�Copula�ķֲ�����
% % ����copulacdf���������ֵΪAlpha�Ķ�Ԫ�����׵�Copula���ܶȺ���
% Cpdf_norm = copulapdf('Gumbel',[u2(:),v2(:)],Alpha);
%
% figure;
% surf(Udata,Vdata,reshape(Cpdf_norm,size(u2)));
figure;
surf(Udata,Vdata,reshape(Ccdf_norm,size(Udata)));


% [u1,v1]=meshgrid(linspace(0,1,31));
% mesh_c=exp(-((-log(u1)).^Alpha+(-log(v1)).^Alpha).^(1/Alpha));
% surf(x_p,y_p,mesh_c)


%�������Ƶ��
P_test = [0.001
0.002
0.005
0.01
0.02
0.03333
0.05
0.1
0.2
0.3333
0.5
1
2
3
3.3333
4
5
10
15
20
25
30
33.333
40
50
60
70
75
80
85
90
95
97
98
99
99.5
99.9
99.99];

u_test=1-P_test';v_con=1-P_test';
x_test= P_3_rensult_X( x_Ex_Cv_Cs(1),x_Ex_Cv_Cs(2),x_Ex_Cv_Cs(2),P_test' );%�����Ƶ���µ�P3��Ӧ�����ֵX
% y_test= P_3_rensult_X( y_Ex_Cv_Cs(1),y_Ex_Cv_Cs(2),y_Ex_Cv_Cs(2),P_test' );
% y=0.1%ʱ�µ�����Ƶ��  
p_cont=zeros(38,1);
p_conu2=exp(-((-log(0.999)).^Alpha+(-log(v_con)).^Alpha).^(1/Alpha))  %Q>q0.1%
a=repmat(0.999,38,1);
p_conu1=copulacdf('Gumbel',[a(:),v_con(:)],Alpha)
p_conu=zeros(38,1);
length(p_conu1)
length(v_con)
% p_conu(:,1)=(1-0.999-v_con+p_conu1)/(1-0.999);     


end

