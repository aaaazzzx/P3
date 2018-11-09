function [ PHi ] = WF_1( Ex,NOX_real_X )
%   第一权函数
PHi = exp (( Ex - NOX_real_X )/ Ex ) ;
end

