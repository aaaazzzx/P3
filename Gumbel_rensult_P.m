function [ Gumbel_rensult_P ] = Gumbel_rensult_P( x,Ex,Cv )
%   ��Gumbel�ֲ�  ��֪X��P
%   Success

Sigma = Ex * Cv ;
Alpha = Sigma * 1 / ( 0.77972 ) ;
u = Ex - 0.45005 * Sigma ;

Gumbel_rensult_P = 1 - exp ( - exp ( - ( x - u ) / Alpha )) ;

end
