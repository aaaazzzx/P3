function  p3c=p3cdf(x,ex0,cv0,cs0,n)
%��p3�ۻ��ֲ�����


% %=========================ԭ����=========================
% %ex0=15.5;cv0=0.45;cs0=1.17
% %x=[34.433,17.5,10.1]'
% %n=length(x)
% 
% 
% p=zeros(1,38);
% cs=zeros(1,88);
% fai=zeros(88,38);
% p=xlsread('e:\�����ļ�\p.xls');
% cs=xlsread('e:\�����ļ�\cs.xls');
% fai=xlsread('e:\�����ļ�\fai.xls');
% 
% p_jy=zeros(n,1);
% fai_jy=zeros(n,1);
% ex1=ones(size(x)).*ex0;
% cv1=ones(size(x)).*cv0;
% fai_jy=(x-ex1)./(ex1.*cv1);
% %fai_jy
% for i=1:n
%     for j=1:87
%         
%         if cs0>=cs(1,j) & cs0<=cs(1,j+1)
%             for k=1:37 
%                                                     %���ֵ�Ħ�ֵһ��Ҫ������                 
%          if fai_jy(i)<=max(max(fai(j:j+1,k:k+1))) & fai_jy(i)>=min(min(fai(j:j+1,k:k+1)))  %��ע�⦵ֵ���ǿ���ԽС�����ﲻ��Ӧ�ö�ά��ֵ
%                                                                 %���ֵ�Ħ�ֵһ��Ҫ������            
%                      
%                       fai1=interp1(cs(1,j:j+1),fai(j:j+1,k),cs0);
%                     fai2=interp1(cs(1,j:j+1),fai(j:j+1,k+1),cs0);
%                     if  fai_jy(i)>=fai2 &  fai_jy(i)<=fai1
%                     p_jy(i)=interp1([fai1,fai2],p(1,k:k+1),fai_jy(i));
%                     else
%                         p_jy(i)=interp1([max(max(fai(j:j+1,k:k+1))),min(min(fai(j:j+1,k:k+1)))],p(1,k:k+1),fai_jy(i));
%                     end
%             end
%             end       
%         end           
%     end            
% 
% end  
% p3c=p_jy;

p3c=zeros(n,1);
for i=1:n
    p3c(i)=P_3_rensult_P( ex0,cv0,cs0,x(i) );
end