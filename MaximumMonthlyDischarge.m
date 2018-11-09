clear

%基于逐月流量最大值的分期设计洪水  毛俊

%数据读取
num = xlsread('F:/毛俊水库水文工作/分期洪水/毛俊逐月最大流量1973-2003.xlsx','B2:M32'); %逐月最大流量    一行为一年数据

%找出年最大值
num = num' ;     %矩阵转置以适应MAX函数
for i = 1:31
   [Fmax , Mtime ] = max (num) ;       %    Fmax : 年最大流量 ； Mtime： ： 当年最大流量所在月份
end
num = num' ;


%统计洪水发生在各月的频次
X = unique(Mtime) ;      %X:发生洪水的月份
[M,N] = hist(Mtime,X) ;    %M：当月发生洪水的次数




% 月份划分
% 设计报告中要求提供 9～3、9～4、10～2、10～3、10～4、11～2、9、10、11、12、3、4月的分期洪水及全年洪水成果

%9-3月份   12+3=15

for i = 1:30
    for j = 9:12+3       %不同月份修改此次处
        month = j-9+1 ;
        if j>12
            Q9_3(i,month) = num(i+1,j-12) ;
        else
            Q9_3(i,month) = num(i,j) ;
        end
    end
end

%找出时段最大值
Q9_3 = Q9_3' ;     %矩阵转置以适应MAX函数
for i = 1:31
   [Q9_3max ,  ] = max (Q9_3) ;       %    Fmax : 时段最大流量 ； Mtime： ： 当年最大流量所在月份
end

%9-4月份   12+4=16

for i = 1:30
    for j = 9:12+4       %不同月份修改此次处
        month = j-9+1 ;
        if j>12
            Q9_4(i,month) = num(i+1,j-12) ;
        else
            Q9_4(i,month) = num(i,j) ;
        end
    end
end

%找出时段最大值
for i = 1:31
   Q9_4 = Q9_4' ;     %矩阵转置以适应MAX函数
   [Q9_4max ,  ] = max (Q9_4) ;       %    Fmax : 时段最大流量 ； Mtime： ： 当年最大流量所在月份
end

%10-2月份   12+2=14
% 
for i = 1:30
    for j = 10:12+2       %不同月份修改此次处
        month = j-10+1 ;
        if j>12
            Q10_2(i,month) = num(i+1,j-12) ;
        else
            Q10_2(i,month) = num(i,j) ;
        end
    end
end

%找出时段最大值
for i = 1:31
   Q10_2 = Q10_2' ;     %矩阵转置以适应MAX函数
   [Q10_2max ,  ] = max (Q10_2) ;       %    Fmax : 时段最大流量 ； Mtime： ： 当年最大流量所在月份
end

%10-3月份   12+3=15

for i = 1:30
    for j = 10:12+3       %不同月份修改此次处
        month = j-10+1 ;
        if j>12
            Q10_3(i,month) = num(i+1,j-12) ;
        else
            Q10_3(i,month) = num(i,j) ;
        end
    end
end

%找出时段最大值
for i = 1:31
   Q10_3 = Q10_3' ;     %矩阵转置以适应MAX函数
   [Q10_3max ,  ] = max (Q10_3) ;       %    Fmax : 时段最大流量 ； Mtime： ： 当年最大流量所在月份
end

%10-4月份   12+4=16

for i = 1:30
    for j = 10:12+4       %不同月份修改此次处
        month = j-10+1 ;
        if j>12
            Q10_4(i,month) = num(i+1,j-12) ;
        else
            Q10_4(i,month) = num(i,j) ;
        end
    end
end

%找出时段最大值
for i = 1:31
   Q10_4 = Q10_4' ;     %矩阵转置以适应MAX函数
   [Q10_4max ,  ] = max (Q10_4) ;       %    Fmax : 时段最大流量 ； Mtime： ： 当年最大流量所在月份
end



% 11～2月份   12+3=15
% 
for i = 1:30
    for j = 11:12+2       %不同月份修改此次处
        month = j-11+1 ;     %不同月份修改此次处
        if j>12
            Q11_2(i,month) = num(i+1,j-12) ;
        else
            Q11_2(i,month) = num(i,j) ;
        end
    end
end

%找出时段最大值
for i = 1:31
   Q11_2 = Q11_2' ;     %矩阵转置以适应MAX函数
   [Q11_2max ,  ] = max (Q11_2) ;       %    Fmax : 时段最大流量 ； Mtime： ： 当年最大流量所在月份
end

% 9、10、11、12、3、4月的分期洪水及全年洪水成果

% 9月
for i = 1:31
    Q9(i) = num(i,9) ;
end


% 10月
for i = 1:31
    Q10(i) = num(i,10) ;
end


% 11月
for i = 1:31
    Q11(i) = num(i,11) ;
end


% 12月
for i = 1:31
    Q12(i) = num(i,12) ;
end


% 3月
for i = 1:31
    Q3(i) = num(i,3) ;
end



% 4月
for i = 1:31
    Q4(i) = num(i,4) ;
end



% 输出


% % 年最大值
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Fmax','sheet1','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Mtime','sheet1','C2')
% % 洪水发生在各月的频次
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',X','sheet1','D2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',M','sheet1','E2')
% % 月份划分
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q9_3','Q9_3','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q9_3max','Q9','A2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q9_4','Q9_4','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q9_4max','Q9','A2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q10_2','Q10_2','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q10_2max','Q10_2','A2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q10_3','Q10_3','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q10_3max','Q10_3','A2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q10_4','Q10_4','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q10_4max','Q10_4','A2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q11_2','Q11_2','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q11_2max','Q11_2','A2')
% 
% 
% 
% 
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q9','Q9','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q10','Q10','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q11','Q11','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q12','Q12','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q3','Q3','B2')
% xlswrite('F:/毛俊水库水文工作/分期洪水/毛俊年最大流量1973-2003.xlsx',Q4','Q4','B2')


%测试
