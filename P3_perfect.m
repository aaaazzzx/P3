function P3_perfect( X_real )
%UNTITLED P3ͳһ����
%   �����Ϊ3����

n = length ( X_real ) ; %��ȡ���г���

%=============  PART 1  =============
%   ���ȶ����ݽ��м���
%   һ���Լ���֮��Ծ�Լ���

X_jump = jump(X_real) ;
if abs(X_jump) > 1.96       %������ˮƽAlphaĬ��Ϊ0.05���ٽ�ֵΪ1.96
    jump_test = '��Ծ�Դ���';
else
    jump_test = '����Ծ��';
end

%   һ���Լ���֮�����Լ���
X_trend = trend( X_real );      %������ˮƽAlphaĬ��Ϊ0.05���ٽ�ֵΪ1.96
if X_trend==1
    trend_test = '����������,��������';
else if X_trend==2
        trend_test = '����������,�½�����';
    else
        trend_test = '�����Բ�����';
    end
end

%�����Լ���
independence_test = independence ( X_real );    %ֱ�ӵó��Ƿ����


%============= PART 2 ===============
% ����ѡ��Ͳ�������

%   P-3
%   ��������

WF_U_Ex_Cv_Cs  = WF_U( X_real );        %�����Ȩ���������
MOM_Ex_Cv_Cs  = MOM( X_real );          %�ط�
PWM_Ex_Cv_Cs  = PWM( X_real );          %����Ȩ�ؾط�

%	P3��������
NOX_real_P  = P3_P( X_real );
NOX_real_P = fliplr(NOX_real_P);        %��Ƶ�ʴ�1��1/��n+1)����
X = sort(X_real);                       %�����ݴ�С��������
NOX_text1 = Real_Text_P3 (X,NOX_real_P,WF_U_Ex_Cv_Cs(1),WF_U_Ex_Cv_Cs(2),WF_U_Ex_Cv_Cs(3));
NOX_text2 = Real_Text_P3 (X,NOX_real_P,MOM_Ex_Cv_Cs(1),MOM_Ex_Cv_Cs(2),MOM_Ex_Cv_Cs(3));
NOX_text3 = Real_Text_P3 (X,NOX_real_P,PWM_Ex_Cv_Cs(1),PWM_Ex_Cv_Cs(2),PWM_Ex_Cv_Cs(3));

for i = 1:3
    eval(['nothing(',int2str(i),',1) = PPCC( X,NOX_text',int2str(i),');']);
    eval(['nothing(',int2str(i),',2) = QD( X,NOX_text',int2str(i),');']);
    eval(['nothing(',int2str(i),',3) = RMSE( X,NOX_text',int2str(i),');']);
    eval(['nothing(',int2str(i),',4) = MAE( X,NOX_text',int2str(i),');']);
end
%   ˳������ΪPPCC  QD  RMSE  MAE


%================== PART 3 ===============


%����MATLAB����Word�ĵ�
%   �ο� ceshi_Word
%
%   Copyright 2016
%   $Revision: 1.0.0.0 $  $Date: 2016��10��8��11:22:24 $

% �趨Word�ļ�����·��
filespec_user = [pwd '\���з�����P3��.doc'];


% �ж�Word�Ƿ��Ѿ��򿪣����Ѵ򿪣����ڴ򿪵�Word�н��в���������ʹ�Word
try
    % ��Word�������Ѿ��򿪣���������Word
    Word = actxGetRunningServer('Word.Application');
catch
    % ����һ��Microsoft Word�����������ؾ��Word
    Word = actxserver('Word.Application'); 
end;

% ����Word����Ϊ�ɼ�
Word.Visible = 1;    % ��set(Word, 'Visible', 1);

% �������ļ����ڣ��򿪸ò����ļ��������½�һ���ļ��������棬�ļ���Ϊ����.doc
if exist(filespec_user,'file'); 
    Document = Word.Documents.Open(filespec_user);     
    % Document = invoke(Word.Documents,'Open',filespec_user);
else
    Document = Word.Documents.Add;     
    % Document = invoke(Word.Documents, 'Add'); 
    Document.SaveAs2(filespec_user);
end


Content = Document.Content;    % ����Content�ӿھ��
Selection = Word.Selection;    % ����Selection�ӿھ��
Paragraphformat = Selection.ParagraphFormat;  % ����ParagraphFormat�ӿھ��

% ҳ������
Document.PageSetup.TopMargin = 60;      % �ϱ߾�60��
Document.PageSetup.BottomMargin = 45;   % �±߾�45��
Document.PageSetup.LeftMargin = 45;     % ��߾�45��
Document.PageSetup.RightMargin = 45;    % �ұ߾�45��

% �趨�ĵ����ݵ���ʼλ�úͱ���
Content.Start = 0;         % �����ĵ����ݵ���ʼλ��
title = '���з�����P3��';
Content.Text = title;      % ������������
Content.Font.Size = 16 ;   % �����ֺ�Ϊ16
Content.Font.Bold = 4 ;    % ����Ӵ�
Content.Paragraphs.Alignment = 'wdAlignParagraphCenter';    % ���ж���


Selection.Start = Content.end;    % �趨�������ݵ���ʼλ��
Selection.TypeParagraph;    % �س�������һ��

shijian = datestr(now);
Selection.Text = shijian;     % �ڵ�ǰλ��������������
Selection.Font.Size = 12;   % �����ֺ�Ϊ12
Selection.Font.Bold = 0;    % ���岻�Ӵ�
Selection.MoveDown;         % ������ƣ�ȡ��ѡ�У�
paragraphformat.Alignment = 'wdAlignParagraphCenter';    % ���ж���
Selection.TypeParagraph;    % �س�������һ��
Selection.TypeParagraph;    % �س�������һ��
Selection.Font.Size = 10.5; % �����ֺ�Ϊ10.5

%��������������

%���г���
Selection.paragraphformat.Alignment = 'wdAlignParagraphLeft';     %���˶���
xuliechangdu =  strcat('���г���:   ',num2str(n)) ;      %�������г���
Selection.Text = xuliechangdu;     % �ڵ�ǰλ��������������
Selection.MoveDown;         % ������ƣ�ȡ��ѡ�У�
Selection.TypeParagraph;    % �س�������һ��

%������Ծ�Լ�����
tyxjj = strcat('��Ծ�Լ�������   ',jump_test);
Selection.Text = tyxjj;     % �ڵ�ǰλ��������������
Selection.MoveDown;         % ������ƣ�ȡ��ѡ�У�
Selection.TypeParagraph;    % �س�������һ��

%���������Լ�����
qsxjj = strcat('�����Լ�������   ',trend_test);
Selection.Text = qsxjj;     % �ڵ�ǰλ��������������
Selection.MoveDown;         % ������ƣ�ȡ��ѡ�У�
Selection.TypeParagraph;    % �س�������һ��

%��������Լ�����
dlxjj = strcat('�����Լ�������   ',independence_test);
Selection.Text = dlxjj;     % �ڵ�ǰλ��������������
Selection.MoveDown;         % ������ƣ�ȡ��ѡ�У�
Selection.TypeParagraph;    % �س�������һ��

%===========���������Ͻ��============

% �ڹ������λ�ò���һ��4��8�еı��
Tables = Document.Tables.Add(Selection.Range,4,8);    

% ���ص�1�����ľ��
DTI = Document.Tables.Item(1);    % ��DTI = Tables;

% ���ñ��߿�
DTI.Borders.OutsideLineStyle = 'wdLineStyleSingle';
DTI.Borders.OutsideLineWidth = 'wdLineWidth150pt';
DTI.Borders.InsideLineStyle = 'wdLineStyleSingle';
DTI.Borders.InsideLineWidth = 'wdLineWidth150pt';

% ͨ��ѭ������ÿ����Ԫ��Ĵ�ֱ���뷽ʽ
for i = 1:4
    for j = 1:8
        DTI.Cell(i,j).VerticalAlignment = 'wdCellAlignVerticalCenter';
    end
end

% ����
% Selection.Start = Content.end;    % ���ù��λ�����ĵ����ݵĽ�β
% Selection.TypeParagraph;          % �س�������һ��
% Selection.Text = '����Ժ��ǩ�֣�            ��    ��    ��';    % ������������
% Paragraphformat.Alignment = 'wdAlignParagraphRight';    % �Ҷ���
% Selection.MoveDown;    % �������
%

% д��������
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
%д������
for i=2:4
    DTI.Cell(2,i).Range.Text = num2str(WF_U_Ex_Cv_Cs(i-1));
end
for i=2:4
    DTI.Cell(3,i).Range.Text = num2str(MOM_Ex_Cv_Cs(i-1));
end
for i=2:4
    DTI.Cell(4,i).Range.Text = num2str(PWM_Ex_Cv_Cs(i-1));
end
%д�����۽��
for i=1:3
    for j=1:4
    DTI.Cell(i+1,j+4).Range.Text = num2str(nothing(i,j));
    end
end

%����ͼ��
%   P3ͼ
%  

X_real = sort(X_real);                  %sort�ǰ�������С��������
X=fliplr(X_real');                      %������x�Ӵ�С����,ת����һ��
NOX_real_P = P3_P( X_real ) ;           %���ӣ�1/n+1����1�����Ӧ��Ƶ��
NOX_real_p=norminv(NOX_real_P,0,1)      %�������Ƶ��p��Ӧ��λ������xp
plot(NOX_real_p,X,'.')
hold on 


%��������
x_max = max (X_real) ;
x_min = min (X_real) ;
x=x_min*0.75:0.1:x_max*1.25;           %������

P=P_3_rensult_P( WF_U_Ex_Cv_Cs(1),WF_U_Ex_Cv_Cs(2),WF_U_Ex_Cv_Cs(3),x );     %��������Ƶ��P WF
XP=norminv(P,0,1);              %��������Ƶ��P����Ӧ������XP
plot(XP,x,'m-.')

P=P_3_rensult_P( MOM_Ex_Cv_Cs(1),MOM_Ex_Cv_Cs(2),MOM_Ex_Cv_Cs(3),x );     %��������Ƶ��P mom
XP=norminv(P,0,1);              %��������Ƶ��P����Ӧ������XP
plot(XP,x,'c:')

P=P_3_rensult_P( PWM_Ex_Cv_Cs(1),PWM_Ex_Cv_Cs(2),PWM_Ex_Cv_Cs(3),x );     %��������Ƶ��P PWM
XP=norminv(P,0,1);              %��������Ƶ��P����Ӧ������XP
plot(XP,x,'b-')

legend('�����','WF','MOM','PWM')
%���ú�ɭ���ʸ�ֽ��������
PL=[0.01 0.05 0.5 1 2 5 10 20 30 40 50 60 70 80 90 95 98 99 99.9 99.99];
%PLΪƵ�ʣ���ʾ�ں�ɭ���ʸ�ֽ�ĺ�������
xx=norminv(PL/100,0,1);     %PL����Ӧ�ĺ�ɭ���ʸ�ֽ�ĺ�����
yy=[x_min*0.75:x_max/10:x_max*1.25];          %������ļ������
axis([min(xx),max(xx),min(yy),max(yy)])        %����������ķ�Χ
set(gca,'xtick',[xx],'ytick',[yy])              %����������Ŀ̶�
set(gca,'xticklabel',[PL],'yticklabel',[yy])
grid on
% title('ĳվ��������ۻ�Ƶ������');
xlabel('Ƶ��P(%)')
% ylabel('�����һ������(m3/s)')
hold off

Selection.Start = Content.end ;
% ��ͼ�θ��Ƶ�ճ����
zft = gcf ;
hgexport(zft, '-clipboard');
Selection.Paste ;



Document.Save;     % �����ĵ�
    
end

