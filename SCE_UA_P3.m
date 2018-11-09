
%UNTITLED3 P3参数拟合，采用SCE-UA和MAE拟优绝对值准则法
%   此处显示详细说明

global X_real;
X_real = VarName3;
n = length ( X_real ) ; %读取序列长度

%=====使用SCEUA=====
!copy SCE_UA_function.m functn.m

bl=[0 0]; bu=[10 10]; x0=[1 1];      %设置参数上下限及初值

maxn=10000;
kstop=10;
pcento=0.1;
peps=0.001;
iseed=-1;
iniflg=0;
ngs=2;
[bestx,bestf] = sceua(x0,bl,bu,maxn,kstop,pcento,peps,ngs,iseed,iniflg)




