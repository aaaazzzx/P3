function [ hunhe_rensult_X ] = hunhe_rensult_X( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,P )
%   ���Ϸֲ����Ƶ��P�µ�X
%   �˴���ʾ��ϸ˵��
x = 0 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );              %��ʼpΪ1
while (p>P)                                   %p��1�ƽ�P
    x = x + 1000 ;                            %����Ϊ1000
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 1000 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
while (p>P)                                   %p��1�ƽ�P
    x = x + 100 ;                             %����Ϊ100
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 100 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
while (p>P)                                   %p��1�ƽ�P
    x = x + 10 ;                              %����Ϊ10
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 10 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
while (p>P)                                   %p��1�ƽ�P
    x = x + 1 ;                               %����Ϊ1
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 1 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
while (p>P)                                   %p��1�ƽ�P
    x = x + 0.1 ;                             %����Ϊ0.1
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 0.1 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
while (p>P)                                   %p��1�ƽ�P
    x = x + 0.01 ;                            %����Ϊ0.1
    p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
end
x = x - 0.01 ;
p = hunhe_rensult_P( Alpha,Ex1,Cv1,Cs1,Ex2,Cv2,Cs2,x );
hunhe_rensult_X = x ;                           %�ó�����
end

