function ke=f_ke(x,y,t_s)
%����������������Ҫע�⣬t��t_s
n=length(x);
x_order=sort(x);
y_order=sort(y);
t=zeros(n,1);
%��⾭���copula�ֲ��������Խ��������һ���Ļ���
for i=1:n
       count =0;
        for k=1:n
                if x(k)<=x_order(i) & y(k)<=y_order(i)
                     count=count+1;
                end
        end
        t(i)=count/(n-1);
end
  
%t_s=[0.1 0.5 0.9];
m=length(t_s);
for i=1:m
    count1=0;
     for j=1:n
         if t(j)<t_s(i)
             count1=count1+1;
         end
     ke1(i)=count1/n;
     end
end 
ke=ke1;