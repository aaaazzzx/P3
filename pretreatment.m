%用于读取、写入逐月最大流量    毛俊

num = zeros(31:12);

for i = 1973:2003
    
    num(i-1972,:)=xlsread('D:/Desktop/分期洪水/毛俊日流量表1973-2003.xls',num2str(i),'B35:M35'); 
    
    
    % xlswrite('D:/Desktop/分期洪水/毛俊日流量表1973-2003.xls','sheet1','D')
end
xlswrite('D:/Desktop/分期洪水/毛俊日流量表1973-2003.xls',num,'sheet1','D4:O34')