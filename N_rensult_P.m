function [ N_rensult_P ] = N_rensult_P( x,Ex,Cv )
%   ����̬�ֲ�  ��֪X��P
%   �ı䷽��

Sigma = Cv * Ex ;
N_rensult_P = 1 - normcdf( x,Ex,Sigma ) ;

end

