%���ڶ�ȡ��д�������������    ë��

num = zeros(31:12);

for i = 1973:2003
    
    num(i-1972,:)=xlsread('D:/Desktop/���ں�ˮ/ë����������1973-2003.xls',num2str(i),'B35:M35'); 
    
    
    % xlswrite('D:/Desktop/���ں�ˮ/ë����������1973-2003.xls','sheet1','D')
end
xlswrite('D:/Desktop/���ں�ˮ/ë����������1973-2003.xls',num,'sheet1','D4:O34')