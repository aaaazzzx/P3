function T = Cat_In_Holl ( n )
%UNTITLED5 �˴���ʾ�йش˺�����ժҪ��Сè����
%   �˴���ʾ��ϸ˵��
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

