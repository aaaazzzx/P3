function  jiong%[ output_args ] = Untitled2( input_args )
%   �嶯��
%   �˴���ʾ��ϸ˵��:NO.1
axis off ;
set (gcf,'menubar','none','toolbar','none');%����ʾ��ǰfigure�˵����͹�����
for k = 1:100 %ѭ��100��
    %ÿ���� (RAN,RAN) ��λ�ò���һ������
    %ѡ��һ��20-50֮�������ʾ���С
    h = text ( rand , rand , ...
        ['\fontsize{',num2str(unifrnd (20,50)),'}\fontname {����} �� '],...
        'color',rand (1,3),'Rotation',360*rand);
    pause (0.2);%ÿ��ʾһ����ͣ0.2s
end

