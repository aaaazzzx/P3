function [ N_rensult_X ] = LN_rensult_X(  P,Ex,Cv  )
%   求对数正态分布下设计频率P下的X
%   SUCCESS 由P=0逼近
x = -5000 ;
p = LN_rensult_P( x,Ex,Cv );              %初始p为0
while (p>P)                                   %p由0逼近P
    x = x + 1000 ;                            %进率为1000
    p = LN_rensult_P( x,Ex,Cv );
end
x = x - 1000 ;
p = LN_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 100 ;                             %进率为100
    p = LN_rensult_P( x,Ex,Cv );
end
x = x - 100 ;
p = LN_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 10 ;                              %进率为10
    p = LN_rensult_P( x,Ex,Cv );
end
x = x - 10 ;
p = LN_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 1 ;                               %进率为1
    p = LN_rensult_P( x,Ex,Cv );
end
x = x - 1 ;
p = LN_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 0.1 ;                             %进率为0.1
    p = LN_rensult_P( x,Ex,Cv );
end
x = x - 0.1 ;
p = LN_rensult_P( x,Ex,Cv );
while (p>P)                                   %p由1逼近P
    x = x + 0.01 ;                            %进率为0.1
    p = LN_rensult_P( x,Ex,Cv );
end
x = x - 0.01 ;
p = LN_rensult_P( x,Ex,Cv );
N_rensult_X = x ;                           %得出结论
end

