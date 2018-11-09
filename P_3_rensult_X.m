function [ P_3_rensult_X ] = P_3_rensult_X( Ex,Cv,Cs,P )
%   求P3曲线下设计频率P下的X
%   此处显示详细说明
x = 0 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );              %初始p为1
while (p>P)                                   %p由1逼近P
    x = x + 1000 ;                            %进率为1000
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 1000 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
while (p>P)                                   %p由1逼近P
    x = x + 100 ;                             %进率为100
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 100 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
while (p>P)                                   %p由1逼近P
    x = x + 10 ;                              %进率为10
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 10 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
while (p>P)                                   %p由1逼近P
    x = x + 1 ;                               %进率为1
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 1 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
while (p>P)                                   %p由1逼近P
    x = x + 0.1 ;                             %进率为0.1
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 0.1 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
while (p>P)                                   %p由1逼近P
    x = x + 0.01 ;                            %进率为0.1
    p = P_3_rensult_P( Ex,Cv,Cs,x );
end
x = x - 0.01 ;
p = P_3_rensult_P( Ex,Cv,Cs,x );
P_3_rensult_X = x ;                           %得出结论
end
