function treatment( Y,D,Q )
%   ��Ԥ�����������ٴ���
%   �ϲ�ͬ���ڵ�����

n = length(Y) ;     %��ϵ�г���
m = 1 ;

for i = (n-1) : -1 : 1   %�Ӻ���ǰ����
    if D(i+1)==D(i)
        Q(i) = Q(i) + Q(i+1) ;
        Y(i+1,:)=[];      %ɾ���հ�
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

