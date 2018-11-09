function [ t ] = trend( NOX )
%       �����Լ���
%   �˴���ʾ��ϸ˵��

n = length ( NOX ) ;
p = 0 ;
for i = 1 : (n-1)
    for j = (i+1) : (n)
        if NOX(i)<NOX(j)
            p = p + 1 ;
        end
    end
end
tau = 4 * p / (n*(n-1)) - 1 ;
VAR = 2 * ( 2 * n + 5 ) / (9*n*(n-1));
u = tau / VAR^0.5 ;

if abs(u) > 1.96       %������ˮƽAlphaĬ��Ϊ0.05���ٽ�ֵΪ1.96
    trend_test = '����������';
    if p>(n*(n-1)/4)
        t = 1 ;
        trend_test = '����������,��������';
    else
        t = 2 ;
        trend_test = '����������,�½�����';
    end
else
    trend_test = '�����Բ�����';
    t = 0 ;
end


end

