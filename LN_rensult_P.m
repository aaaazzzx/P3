function [ N_rensult_P ] = LN_rensult_P( x,Ex,Cv )
%   ����̬�ֲ�  ��֪X��P
%   �ı䷽��

Sigma = Cv * Ex ;
N_rensult_P = 1 - logncdf( x,Ex,Sigma ) ;

end
