function [ P_3_rensult_X ] = P_3_rensult_X( Ex,Cv,Cs,P )
%   ��P3���������Ƶ��P�µ�X
%   �˴���ʾ��ϸ˵��
x = 0 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );              %��ʼpΪ1
while (p>P)                                   %p��1�ƽ�P
    x = x + 1000 ;                            %����Ϊ1000
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 1000 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
while (p>P)                                   %p��1�ƽ�P
    x = x + 100 ;                             %����Ϊ100
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 100 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
while (p>P)                                   %p��1�ƽ�P
    x = x + 10 ;                              %����Ϊ10
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 10 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
while (p>P)                                   %p��1�ƽ�P
    x = x + 1 ;                               %����Ϊ1
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 1 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
while (p>P)                                   %p��1�ƽ�P
    x = x + 0.1 ;                             %����Ϊ0.1
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 0.1 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
while (p>P)                                   %p��1�ƽ�P
    x = x + 0.01 ;                            %����Ϊ0.1
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 0.01 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
P_3_rensult_X = x ;                           %�ó�����
end
