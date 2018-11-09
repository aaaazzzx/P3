function [ Gumbel_rensult_X ] = Gumbel_rensult_X(  P,Ex,Cv  )
%   求正态分布下设计频率P下的X
%   SUCCESS 由P=1逼近
x = 0 ;
p = Gumbel_rensult_P( x,Ex,Cv );              %初始p为1
while (p>P)                                   %p由1逼近P
    x = x + 1000 ;                            %进率为1000
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 1000 ;
p = Gumbel_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 100 ;                             %进率为100
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 100 ;
p = Gumbel_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 10 ;                              %进率为10
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 10 ;
p = Gumbel_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 1 ;                               %进率为1
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 1 ;
p = Gumbel_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 0.1 ;                             %进率为0.1
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 0.1 ;
p = Gumbel_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 0.01 ;                            %进率为0.1
    p = Gumbel_rensult_P( x,Ex,Cv );
end
x = x - 0.01 ;
p = Gumbel_rensult_P( x,Ex,Cv );
Gumbel_rensult_X = x ;                           %得出结论
end

