
%UNTITLED3 P3������ϣ�����SCE-UA��MAE���ž���ֵ׼��
%   �˴���ʾ��ϸ˵��

global X_real;
X_real = VarName3;
n = length ( X_real ) ; %��ȡ���г���

%=====ʹ��SCEUA=====
!copy SCE_UA_function.m functn.m

bl=[0 0]; bu=[10 10]; x0=[1 1];      %���ò��������޼���ֵ

maxn=10000;
kstop=10;
pcento=0.1;
peps=0.001;
iseed=-1;
iniflg=0;
ngs=2;
[bestx,bestf] = sceua(x0,bl,bu,maxn,kstop,pcento,peps,ngs,iseed,iniflg)




