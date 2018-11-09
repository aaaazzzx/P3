function T = Cat_In_Holl ( n )
%UNTITLED5 此处显示有关此函数的摘要；小猫出洞
%   此处显示详细说明
T = zeros (1,n) ;
for k = 1 : n
    c = unidrnd (3,1);
    while c ~= 1 
        if c == 2
            T(k) = T(k) + 4 ;
        else 
            T(k) = T(k) + 6 ;
        end
        c = unidrnd (3,1) ;
    end
    T(k) = T(k) +2 ;
end
end

