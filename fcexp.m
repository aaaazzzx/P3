function jingyan=fcexp(x,y)
%�������ֲ���n+1����ʽ

n=length(x);
x_order=sort(x);
y_order=sort(y);
c=zeros(n,n);

%��⾭���copula�ֲ��������Խ��������һ���Ļ���
for i=1:n
    for j=1:n
       count =0;
        for k=1:n
            % for m=1:n
    
                if x(k)<=x_order(i) & y(k)<=y_order(j)
                     count=count+1;
                 end
             %end
        end
        c(i,j)=count/(n+1);
      
    end
end   
jingyan=c;

  