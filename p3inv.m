function y_p3=p3inv(p_s,ex0,cv0,cs0,n)
%�����Ƶ���µ�P3��Ӧ�����ֵX��Ex��Cv��Cs��
%��֪p��x

% %=======================ԭ����=========================
% p=zeros(1,38);
% cs=zeros(1,88);
% fai=zeros(88,38);
% p=xlsread('e:\�����ļ�\p.xls');
% cs=xlsread('e:\�����ļ�\cs.xls');
% fai=xlsread('e:\�����ļ�\fai.xls');
% 
% fai_jy=zeros(n,1);
% for i=1:n
%     for j=1:87
%         if cs0>=cs(1,j) && cs0<=cs(1,j+1)
%             for k=1:37
%                 if p_s(i,1)>=p(1,k) && p_s(i,1)<=p(1,k+1)
%                     fai_jy(i,1)=interp2(cs(1,j:j+1),p(1,k:k+1),fai(j:j+1,k:k+1),cs0,p_s(i,1));
%                 end
%             end       
%         end           
%     end            
% 
% end  
% y_p3=zeros(n,1);
% y_p3=ex0*(1.000000+cv0.*fai_jy);
y_p3=zeros(n,1);
for i=1:n
    y_p3(i)=P_3_rensult_X( ex0,cv0,cs0,p_s );
end

