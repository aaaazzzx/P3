function [ N_rensult_X ] = N_rensult_X(  P,Ex,Cv  )
%   求正态分布下设计频率P下的X
%   SUCCESS 由P=1逼近
x = -5000 ;
p = N_rensult_P( x,Ex,Cv );              %初始p为1
while (p>P)                                   %p由1逼近P
    x = x + 1000 ;                            %进率为1000
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 1000 ;
p = N_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 100 ;                             %进率为100
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 100 ;
p = N_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 10 ;                              %进率为10
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 10 ;
p = N_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 1 ;                               %进率为1
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 1 ;
p = N_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 0.1 ;                             %进率为0.1
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 0.1 ;
p = N_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 0.01 ;                            %进率为0.1
    p = N_rensult_P( x,Ex,Cv );
end
x = x - 0.01 ;
p = N_rensult_P( x,Ex,Cv );
N_rensult_X = x ;                           %得出结论
end

