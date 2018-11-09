function [ hunhe_rensult_X ] = hunhe_rensult_X( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,P )
%   求混合分布设计频率P下的X
%   此处显示详细说明
x = 0 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );              %初始p为1
while (p>P)                                   %p由1逼近P
    x = x + 1000 ;                            %进率为1000
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 1000 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
while (p>P)                                   %p由1逼近P
    x = x + 100 ;                             %进率为100
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 100 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
while (p>P)                                   %p由1逼近P
    x = x + 10 ;                              %进率为10
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 10 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
while (p>P)                                   %p由1逼近P
    x = x + 1 ;                               %进率为1
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 1 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
while (p>P)                                   %p由1逼近P
    x = x + 0.1 ;                             %进率为0.1
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 0.1 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
while (p>P)                                   %p由1逼近P
    x = x + 0.01 ;                            %进率为0.1
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 0.01 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
hunhe_rensult_X = x ;                           %得出结论
end

