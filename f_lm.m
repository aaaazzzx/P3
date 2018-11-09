function[exlm,cvlm,cslm]=f_lm(x,nlag,nlit,n,ia)
%线性矩法球参数，采用PWM代替之

% %=======================原函数=====================
% %ex0=100;cv0=0.3;cs0=0.9;
% %nlag=250;nlit=60;ia=1;
% %生成p_III分布随机数
% %fun_p3(ex0,cv0,cs0,nlag,nlit,ia);
% 
% %ave0=mean(x);
% %s=std(x);
% %cv0=s/ave0;
% %cs0=skewness(x);
% c=sort(x);
% %[n,mmmmm]=size(x);
% 
% %b0=ave0;
% %s1=0;s2=0;
%  %for i = 1 : n
%  %s1 = s1 + (i - 1) / (n - 1) * c(i);
% %s2 = s2 + c(i) * ((i - 1) * (i - 2)) / ((n - 1) * (n - 2));
%  %end
% %b11=s1/n;
% %b22=s2/n;
% m0=0;yd1=0;yd2=0;
% nma=n-ia;ngma=nlag-ia;
% for i=1 :nma
%     e=c(i);
%     m0=m0+e;
%     e=e*(i-1);
%     yd1=yd1+e;
%     yd2=yd2+e*(i-2);
% end
% e=ngma/nma;
% d=(ngma-1)/(nlag-1);
% my1=yd1*e*d/(nma-1);
% my2=yd2*e*d/(nma-1)/(nma-2)*(ngma-2)/(nlag-2);
% d=(ngma+1)/(nlag+1);
% m0=m0*e;
% yd1=0;yd2=0;
% if ia==0
%     e=1/nlag;
%     my1=(my1+yd1)*e;
%     my2=(my2+yd2)*e;
%     m0=m0*e;
% else
%     for i=nma+1:n
%         e=c(1);
%         m0=m0+e;
%         e=(nlag-n+i-1)/(nlag-1)*e;
%         yd1=yd1+e;
%         yd2=yd2+e*(nlag-n+i-2)/(nlag-2);
%     end
%     e=1/nlag;
%     my1=(my1+yd1)*e;
%     my2=(my2+yd2)*e;
%     m0=m0*e;
% end    
%     
%    b0=m0;
%    b1=my1;
%    b2=my2;
%     
% l1 = b0;
% l2 = 2 * b1 - b0;
% l3 = 6 * b2 - 6 * b1 + b0;
% t2=l2/l1;
% t3=l3/l2;
% if abs(t3)>0 & abs(t3)<(1/3) 
%     z=3*pi*t3*t3;
%     alfa=(1 + 0.2906 * z) / (z + 0.1882 * z * z + 0.0442 * z * z * z);
% elseif  abs(t3)>=(1/3) & abs(t3)<1 
%      z = 1 - abs(t3);
%      alfa = (0.36067 * z - 0.59567 * z * z + 0.25361 * z * z * z) / (1 - 2.78861 * z + 2.56096 * z * z - 0.77045 * z * z * z);
% end
% cslm=2/sqrt(alfa)*(t3/abs(t3));
% if alfa<20 
%    cvlm=l2*sqrt(pi)*sqrt(alfa)*gamma(alfa)/l1/gamma(alfa+0.5);   
% else if alfa>10^8
%         alfa=1.000001*10^8;
%         ba=(alfa-1.00000000000)/(alfa-0.5);
%         nn=fix(alfa);
%         if abs(nn-alfa)>10^(-7)
%             for i=2:nn
%               ba=ba*(alfa-i)/(alfa+0.5-i);
%             end
%            a1=alfa-nn;
%            a2=a1+0.5;
%            ba=ba*gamma(a1)/gamma(a2);
%         else
%             for i=1:nn-1
%                 ba=ba*(alfa-i)/(alfa+0.5-i);
%             end
%          ba=ba/(alfa+0.5-nn)/gamma(alfa+0.5-nn);
%          
%         end
%     else
%         ba=(alfa-1.00000000000)/(alfa-0.5);
%         nn=fix(alfa);
%         if abs(nn-alfa)>10^(-7)
%             for i=2:nn
%               ba=ba*(alfa-i)/(alfa+0.5-i);
%             end
%            a1=alfa-nn;
%            a2=a1+0.5;
%            ba=ba*gamma(a1)/gamma(a2);
%         else
%             for i=1:nn-1
%                 ba=ba*(alfa-i)/(alfa+0.5-i);
%             end
%          ba=ba/(alfa+0.5-nn)/gamma(alfa+0.5-nn);
%         end
%        cvlm=l2*sqrt(pi)*sqrt(alfa)*ba/l1;   
%     end
%     if cslm<2*cvlm
%         cslm=2*cvlm;   %不知道这项合不合理
%         
%    end
%     
% end   
% exlm=b0;

PWM_Ex_Cv_Cs  = PWM( x );
exlm =  PWM_Ex_Cv_Cs(1);
cvlm = PWM_Ex_Cv_Cs(2);
cslm = PWM_Ex_Cv_Cs(3);

