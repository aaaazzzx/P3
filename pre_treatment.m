function pre_treatment( Y,D,Q )
%	�����ݽ���Ԥ����
%   ��Q����Ϊ��׼��ɾ������Ϊ0������

n = length ( Q ) ;      %���г���

for i = n : -1 : 1   %�Ӻ���ǰ����
    if Q(i)==0
        Y(i,:)=[];      %ɾ���հ�
        D(i,:)=[];
        Q(i,:)=[];
    end
end

output_args = [ Y , D , Q ];
xlswrite('G:\Copula\shuchu.xlsx', output_args);

end

