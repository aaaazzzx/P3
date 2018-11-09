function pre_treatment( Y,D,Q )
%	对数据进行预处理
%   以Q流量为基准，删除流量为0的数据

n = length ( Q ) ;      %序列长度

for i = n : -1 : 1   %从后往前检索
    if Q(i)==0
        Y(i,:)=[];      %删除空白
        D(i,:)=[];
        Q(i,:)=[];
    end
end

output_args = [ Y , D , Q ];
xlswrite('G:\Copula\shuchu.xlsx', output_args);

end

