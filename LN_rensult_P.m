function [ N_rensult_P ] = LN_rensult_P( x,Ex,Cv )
%   求正态分布  已知X求P
%   改变方向

Sigma = Cv * Ex ;
N_rensult_P = 1 - logncdf( x,Ex,Sigma ) ;

end
