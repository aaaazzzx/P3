function [ Gumbel_rensult_X ] = Gumbel_rensult_X(  P,Ex,Cv  )
%   ����̬�ֲ������Ƶ��P�µ�X
%   SUCCESS ��P=1�ƽ�
x = 0 ;
p = Gumbel_rensult_P( x,Ex,Cv );              %��ʼpΪ1
while (p>P)                                   %p��1�ƽ�P
    x = x + 1000 ;                            %����Ϊ1000
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 1000 ;
p = Gumbel_rensult_P( x,Ex,Cv );
while (p>P)                                   %p��1�ƽ�P
    x = x + 100 ;                             %����Ϊ100
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 100 ;
p = Gumbel_rensult_P( x,Ex,Cv );
while (p>P)                                   %p��1�ƽ�P
    x = x + 10 ;                              %����Ϊ10
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 10 ;
p = Gumbel_rensult_P( x,Ex,Cv );
while (p>P)                                   %p��1�ƽ�P
    x = x + 1 ;                               %����Ϊ1
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 1 ;
p = Gumbel_rensult_P( x,Ex,Cv );
while (p>P)                                   %p��1�ƽ�P
    x = x + 0.1 ;                             %����Ϊ0.1
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 0.1 ;
p = Gumbel_rensult_P( x,Ex,Cv );
while (p>P)                                   %p��1�ƽ�P
    x = x + 0.01 ;                            %����Ϊ0.1
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 0.01 ;
p = Gumbel_rensult_P( x,Ex,Cv );
Gumbel_rensult_X = x ;                           %�ó�����
end

