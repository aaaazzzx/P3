function [ N_rensult_P ] = N_rensult_P( x,Ex,Cv )
%   求正态分布  已知X求P
%   改变方向

Sigma = Cv * Ex ;
N_rensult_P = 1 - normcdf( x,Ex,Sigma ) ;

end

