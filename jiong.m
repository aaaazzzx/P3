function  jiong%[ output_args ] = Untitled2( input_args )
%   囧动画
%   此处显示详细说明:NO.1
axis off ;
set (gcf,'menubar','none','toolbar','none');%不显示当前figure菜单栏和工具栏
for k = 1:100 %循环100次
    %每次在 (RAN,RAN) 的位置产生一个囧字
    %选择一个20-50之间的数表示其大小
    h = text ( rand , rand , ...
        ['\fontsize{',num2str(unifrnd (20,50)),'}\fontname {隶书} 囧 '],...
        'color',rand (1,3),'Rotation',360*rand);
    pause (0.2);%每显示一次暂停0.2s
end

