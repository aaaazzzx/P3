function [ PHi ] = WF_2( Ex,C,NOX_real_X )
%   第二权函数
PHi = normpdf (NOX_real_X,Ex,C ) ;
end