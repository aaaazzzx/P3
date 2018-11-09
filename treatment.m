function treatment( Y,D,Q )
%   将预处理后的数据再处理
%   合并同日期的数据

n = length(Y) ;     %求系列长度
m = 1 ;

for i = (n-1) : -1 : 1   %从后往前检索
    if D(i+1)==D(i)
        Q(i) = Q(i) + Q(i+1) ;
        Y(i+1,:)=[];      %删除空白
        D(i+1,:)=[];
        Q(i+1,:)=[];
        m=m+1;
    else
        Q(i+1) = Q(i+1)/m;
        m = 1 ;
    end
end

output_args = [ Y , D , Q ];
xlswrite('G:\Copula\shuchu.xlsx', output_args);

end

