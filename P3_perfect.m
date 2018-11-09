function P3_perfect( X_real )
%UNTITLED P3统一程序
%   程序分为3部分

n = length ( X_real ) ; %读取序列长度

%=============  PART 1  =============
%   首先对数据进行检验
%   一致性检验之跳跃性检验

X_jump = jump(X_real) ;
if abs(X_jump) > 1.96       %显著性水平Alpha默认为0.05，临界值为1.96
    jump_test = '跳跃性存在';
else
    jump_test = '无跳跃性';
end

%   一致性检验之趋势性检验
X_trend = trend( X_real );      %显著性水平Alpha默认为0.05，临界值为1.96
if X_trend==1
    trend_test = '趋势性显著,上升趋势';
else if X_trend==2
        trend_test = '趋势性显著,下降趋势';
    else
        trend_test = '趋势性不显著';
    end
end

%独立性检验
independence_test = independence ( X_real );    %直接得出是否相关


%============= PART 2 ===============
% 线型选择和参数估计

%   P-3
%   参数估计

WF_U_Ex_Cv_Cs  = WF_U( X_real );        %马秀峰权函数低配版
MOM_Ex_Cv_Cs  = MOM( X_real );          %矩法
PWM_Ex_Cv_Cs  = PWM( X_real );          %概率权重矩法

%	P3参数评价
NOX_real_P  = P3_P( X_real );
NOX_real_P = fliplr(NOX_real_P);        %将频率从1至1/（n+1)排列
X = sort(X_real);                       %将数据从小到大排列
NOX_text1 = Real_Text_P3 (X,NOX_real_P,WF_U_Ex_Cv_Cs(1),WF_U_Ex_Cv_Cs(2),WF_U_Ex_Cv_Cs(3));
NOX_text2 = Real_Text_P3 (X,NOX_real_P,MOM_Ex_Cv_Cs(1),MOM_Ex_Cv_Cs(2),MOM_Ex_Cv_Cs(3));
NOX_text3 = Real_Text_P3 (X,NOX_real_P,PWM_Ex_Cv_Cs(1),PWM_Ex_Cv_Cs(2),PWM_Ex_Cv_Cs(3));

for i = 1:3
    eval(['nothing(',int2str(i),',1) = PPCC( X,NOX_text',int2str(i),');']);
    eval(['nothing(',int2str(i),',2) = QD( X,NOX_text',int2str(i),');']);
    eval(['nothing(',int2str(i),',3) = RMSE( X,NOX_text',int2str(i),');']);
    eval(['nothing(',int2str(i),',4) = MAE( X,NOX_text',int2str(i),');']);
end
%   顺序依次为PPCC  QD  RMSE  MAE


%================== PART 3 ===============


%利用MATLAB生成Word文档
%   参考 ceshi_Word
%
%   Copyright 2016
%   $Revision: 1.0.0.0 $  $Date: 2016年10月8日11:22:24 $

% 设定Word文件名和路径
filespec_user = [pwd '\序列分析（P3）.doc'];


% 判断Word是否已经打开，若已打开，就在打开的Word中进行操作，否则就打开Word
try
    % 若Word服务器已经打开，返回其句柄Word
    Word = actxGetRunningServer('Word.Application');
catch
    % 创建一个Microsoft Word服务器，返回句柄Word
    Word = actxserver('Word.Application'); 
end;

% 设置Word属性为可见
Word.Visible = 1;    % 或set(Word, 'Visible', 1);

% 若测试文件存在，打开该测试文件，否则，新建一个文件，并保存，文件名为测试.doc
if exist(filespec_user,'file'); 
    Document = Word.Documents.Open(filespec_user);     
    % Document = invoke(Word.Documents,'Open',filespec_user);
else
    Document = Word.Documents.Add;     
    % Document = invoke(Word.Documents, 'Add'); 
    Document.SaveAs2(filespec_user);
end


Content = Document.Content;    % 返回Content接口句柄
Selection = Word.Selection;    % 返回Selection接口句柄
Paragraphformat = Selection.ParagraphFormat;  % 返回ParagraphFormat接口句柄

% 页面设置
Document.PageSetup.TopMargin = 60;      % 上边距60磅
Document.PageSetup.BottomMargin = 45;   % 下边距45磅
Document.PageSetup.LeftMargin = 45;     % 左边距45磅
Document.PageSetup.RightMargin = 45;    % 右边距45磅

% 设定文档内容的起始位置和标题
Content.Start = 0;         % 设置文档内容的起始位置
title = '序列分析（P3）';
Content.Text = title;      % 输入文字内容
Content.Font.Size = 16 ;   % 设置字号为16
Content.Font.Bold = 4 ;    % 字体加粗
Content.Paragraphs.Alignment = 'wdAlignParagraphCenter';    % 居中对齐


Selection.Start = Content.end;    % 设定下面内容的起始位置
Selection.TypeParagraph;    % 回车，另起一段

shijian = datestr(now);
Selection.Text = shijian;     % 在当前位置输入文字内容
Selection.Font.Size = 12;   % 设置字号为12
Selection.Font.Bold = 0;    % 字体不加粗
Selection.MoveDown;         % 光标下移（取消选中）
paragraphformat.Alignment = 'wdAlignParagraphCenter';    % 居中对齐
Selection.TypeParagraph;    % 回车，另起一段
Selection.TypeParagraph;    % 回车，另起一段
Selection.Font.Size = 10.5; % 设置字号为10.5

%输入序列相关情况

%序列长度
Selection.paragraphformat.Alignment = 'wdAlignParagraphLeft';     %顶端对齐
xuliechangdu =  strcat('序列长度:   ',num2str(n)) ;      %输入序列长度
Selection.Text = xuliechangdu;     % 在当前位置输入文字内容
Selection.MoveDown;         % 光标下移（取消选中）
Selection.TypeParagraph;    % 回车，另起一段

%输入跳跃性检验结果
tyxjj = strcat('跳跃性检验结果：   ',jump_test);
Selection.Text = tyxjj;     % 在当前位置输入文字内容
Selection.MoveDown;         % 光标下移（取消选中）
Selection.TypeParagraph;    % 回车，另起一段

%输入趋势性检验结果
qsxjj = strcat('趋势性检验结果：   ',trend_test);
Selection.Text = qsxjj;     % 在当前位置输入文字内容
Selection.MoveDown;         % 光标下移（取消选中）
Selection.TypeParagraph;    % 回车，另起一段

%输入独立性检验结果
dlxjj = strcat('趋势性检验结果：   ',independence_test);
Selection.Text = dlxjj;     % 在当前位置输入文字内容
Selection.MoveDown;         % 光标下移（取消选中）
Selection.TypeParagraph;    % 回车，另起一段

%===========输入参数拟合结果============

% 在光标所在位置插入一个4行8列的表格
Tables = Document.Tables.Add(Selection.Range,4,8);    

% 返回第1个表格的句柄
DTI = Document.Tables.Item(1);    % 或DTI = Tables;

% 设置表格边框
DTI.Borders.OutsideLineStyle = 'wdLineStyleSingle';
DTI.Borders.OutsideLineWidth = 'wdLineWidth150pt';
DTI.Borders.InsideLineStyle = 'wdLineStyleSingle';
DTI.Borders.InsideLineWidth = 'wdLineWidth150pt';

% 通过循环设置每个单元格的垂直对齐方式
for i = 1:4
    for j = 1:8
        DTI.Cell(i,j).VerticalAlignment = 'wdCellAlignVerticalCenter';
    end
end

% 备用
% Selection.Start = Content.end;    % 设置光标位置在文档内容的结尾
% Selection.TypeParagraph;          % 回车，另起一段
% Selection.Text = '主管院长签字：            年    月    日';    % 输入文字内容
% Paragraphformat.Alignment = 'wdAlignParagraphRight';    % 右对齐
% Selection.MoveDown;    % 光标下移
%

% 写入表格内容
DTI.Cell(1,2).Range.Text = 'Ex';
DTI.Cell(1,3).Range.Text = 'Cv';
DTI.Cell(1,4).Range.Text = 'Cs';
DTI.Cell(1,5).Range.Text = 'PPCC';
DTI.Cell(1,6).Range.Text = 'QD';
DTI.Cell(1,7).Range.Text = 'RMSE';
DTI.Cell(1,8).Range.Text = 'MAE';
DTI.Cell(2,1).Range.Text = 'WF_U';
DTI.Cell(3,1).Range.Text = 'MOM';
DTI.Cell(4,1).Range.Text = 'PWM';
%写入数据
for i=2:4
    DTI.Cell(2,i).Range.Text = num2str(WF_U_Ex_Cv_Cs(i-1));
end
for i=2:4
    DTI.Cell(3,i).Range.Text = num2str(MOM_Ex_Cv_Cs(i-1));
end
for i=2:4
    DTI.Cell(4,i).Range.Text = num2str(PWM_Ex_Cv_Cs(i-1));
end
%写入评价结果
for i=1:3
    for j=1:4
    DTI.Cell(i+1,j+4).Range.Text = num2str(nothing(i,j));
    end
end

%绘制图形
%   P3图
%  

X_real = sort(X_real);                  %sort是把流量从小到大排列
X=fliplr(X_real');                      %把流量x从大到小排列,转制了一哈
NOX_real_P = P3_P( X_real ) ;           %按从（1/n+1）到1求出对应的频率
NOX_real_p=norminv(NOX_real_P,0,1)      %求出经验频率p对应的位置坐标xp
plot(NOX_real_p,X,'.')
hold on 


%绘制曲线
x_max = max (X_real) ;
x_min = min (X_real) ;
x=x_min*0.75:0.1:x_max*1.25;           %纵坐标

P=P_3_rensult_P( WF_U_Ex_Cv_Cs(1),WF_U_Ex_Cv_Cs(2),WF_U_Ex_Cv_Cs(3),x );     %计算理论频率P WF
XP=norminv(P,0,1);              %计算理论频率P所对应的坐标XP
plot(XP,x,'m-.')

P=P_3_rensult_P( MOM_Ex_Cv_Cs(1),MOM_Ex_Cv_Cs(2),MOM_Ex_Cv_Cs(3),x );     %计算理论频率P mom
XP=norminv(P,0,1);              %计算理论频率P所对应的坐标XP
plot(XP,x,'c:')

P=P_3_rensult_P( PWM_Ex_Cv_Cs(1),PWM_Ex_Cv_Cs(2),PWM_Ex_Cv_Cs(3),x );     %计算理论频率P PWM
XP=norminv(P,0,1);              %计算理论频率P所对应的坐标XP
plot(XP,x,'b-')

legend('经验点','WF','MOM','PWM')
%设置海森机率格纸的坐标轴
PL=[0.01 0.05 0.5 1 2 5 10 20 30 40 50 60 70 80 90 95 98 99 99.9 99.99];
%PL为频率，显示在海森机率格纸的横坐标轴
xx=norminv(PL/100,0,1);     %PL所对应的海森机率格纸的横坐标
yy=[x_min*0.75:x_max/10:x_max*1.25];          %纵坐标的间隔设置
axis([min(xx),max(xx),min(yy),max(yy)])        %设置坐标轴的范围
set(gca,'xtick',[xx],'ytick',[yy])              %设置坐标轴的刻度
set(gca,'xticklabel',[PL],'yticklabel',[yy])
grid on
% title('某站最大流量累积频率曲线');
xlabel('频率P(%)')
% ylabel('年最枯一月流量(m3/s)')
hold off

Selection.Start = Content.end ;
% 将图形复制到粘贴板
zft = gcf ;
hgexport(zft, '-clipboard');
Selection.Paste ;



Document.Save;     % 保存文档
    
end

