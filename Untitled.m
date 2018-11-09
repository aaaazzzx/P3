function [ output_args ] = Untitled( x , y )
%UNTITLED Copula
%   采用的P-3线型，PWM参数估计方法

% x,y为两水文序列
n = length(x);            %求出资料序列的长度n

%先为其排序额 从大到小
x_series = sort(x,'descend');   %fuyang_series 阜阳
y_series = sort(y,'descend');   %luohe_series  漯河

%确定随机变量的参数分布类型

%本处采用 P-3型分布

%求三参数:Ex,Cv,Cs
%采用
x_Ex_Cv_Cs = WF_U(x_series) ;   % Ex: 1684.7  Cv: 0.5376  Cs: 0.3039
y_Ex_Cv_Cs = WF_U(y_series) ;   % Ex: 1567.2  Cv: 0.6855  Cs: 0.8254

u = 1-P_3_rensult_P( x_Ex_Cv_Cs(1),x_Ex_Cv_Cs(2),x_Ex_Cv_Cs(3),x ) ;
v = 1-P_3_rensult_P( y_Ex_Cv_Cs(1),y_Ex_Cv_Cs(2),y_Ex_Cv_Cs(3),y ) ;
%此时已求得两边缘分布

%U_p3 =  P_3_rensult_P( Ex,Cv,Cs,x )

% 先计算Kendall系数
Kendall = corr( x , y , 'type' , 'Kendall')    %coeff_peak=0.9985

%计算Gumbel Copula的参数Alpha
Alpha = 1 / ( 1 - Kendall ) ;                   %

% %对经验累积频率与理论累积频率进行比较
% 
% F_Theory = copulacdf ('Gumbel',[u(:),v(:)],Alpha)      %理论累积频率
% for k=1:n
%     F_emp(k) = ( (n-find(x_series==x(k))+1) * (n-find(y_series==y(k))+1) )/(n*n+1);      %经验累积频率
% end
% 
% scatter(F_Theory,F_emp,'.')     %绘制Q-Q图

%Q-Q图
Q_Q(x,y)

[Udata,Vdata] = meshgrid(sort(x),sort(y));     %绘图需要参数的网格数据
u2 = 1-P_3_rensult_P( x_Ex_Cv_Cs(1),x_Ex_Cv_Cs(2),x_Ex_Cv_Cs(3),Udata ) ;
v2 = 1-P_3_rensult_P( y_Ex_Cv_Cs(1),y_Ex_Cv_Cs(2),y_Ex_Cv_Cs(3),Vdata ) ;
Ccdf_norm = copulacdf('Gumbel',[u2(:),v2(:)],Alpha); % 调用copulacdf函数求参数值为Alpha的二元阿基米德Copula的分布函数
% % 调用copulacdf函数求参数值为Alpha的二元阿基米德Copula的密度函数
% Cpdf_norm = copulapdf('Gumbel',[u2(:),v2(:)],Alpha);
%
% figure;
% surf(Udata,Vdata,reshape(Cpdf_norm,size(u2)));
figure;
surf(Udata,Vdata,reshape(Ccdf_norm,size(Udata)));


% [u1,v1]=meshgrid(linspace(0,1,31));
% mesh_c=exp(-((-log(u1)).^Alpha+(-log(v1)).^Alpha).^(1/Alpha));
% surf(x_p,y_p,mesh_c)


%输入设计频率
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
x_test= P_3_rensult_X( x_Ex_Cv_Cs(1),x_Ex_Cv_Cs(2),x_Ex_Cv_Cs(2),P_test' );%求给定频率下的P3对应的设计值X
% y_test= P_3_rensult_X( y_Ex_Cv_Cs(1),y_Ex_Cv_Cs(2),y_Ex_Cv_Cs(2),P_test' );
% y=0.1%时下的条件频率  
p_cont=zeros(38,1);
p_conu2=exp(-((-log(0.999)).^Alpha+(-log(v_con)).^Alpha).^(1/Alpha))  %Q>q0.1%
a=repmat(0.999,38,1);
p_conu1=copulacdf('Gumbel',[a(:),v_con(:)],Alpha)
p_conu=zeros(38,1);
length(p_conu1)
length(v_con)
% p_conu(:,1)=(1-0.999-v_con+p_conu1)/(1-0.999);     


end

