function [ N_rensult_X ] = N_rensult_X(  P,Ex,Cv  )
%   ����̬�ֲ������Ƶ��P�µ�X
%   SUCCESS ��P=1�ƽ�
x = -5000 ;
p = N_rensult_P( x,Ex,Cv );              %��ʼpΪ1
while (p>P)                                   %p��1�ƽ�P
    x = x + 1000 ;                            %����Ϊ1000
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 1000 ;
p = N_rensult_P( x,Ex,Cv );
while (p>P)                                   %p��1�ƽ�P
    x = x + 100 ;                             %����Ϊ100
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 100 ;
p = N_rensult_P( x,Ex,Cv );
while (p>P)                                   %p��1�ƽ�P
    x = x + 10 ;                              %����Ϊ10
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 10 ;
p = N_rensult_P( x,Ex,Cv );
while (p>P)                                   %p��1�ƽ�P
    x = x + 1 ;                               %����Ϊ1
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 1 ;
p = N_rensult_P( x,Ex,Cv );
while (p>P)                                   %p��1�ƽ�P
    x = x + 0.1 ;                             %����Ϊ0.1
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 0.1 ;
p = N_rensult_P( x,Ex,Cv );
while (p>P)                                   %p��1�ƽ�P
    x = x + 0.01 ;                            %����Ϊ0.1
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 0.01 ;
p = N_rensult_P( x,Ex,Cv );
N_rensult_X = x ;                           %�ó�����
end

