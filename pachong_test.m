clc;
clear;
warning off;
year=2015;    
for season = 1:4   
fprintf('ץȡ%d��%d���ȵ�������...', year, season)
[sourcefile, status] = urlread(sprintf('http://vip.stock.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/000001/type/S.phtml?year=%d&season=%d', year));
if ~status%�ж������Ƿ�ȫ����ȡ�ɹ�
error('��������Ŷ������\n')
end
expr1 = '\s+(\d\d\d\d-\d\d-\d\d)\s*';    %Ҫ��ȡ��ģʽ��������ΪҪ��ȡ������
[datefile, date_tokens]= regexp(sourcefile, expr1, 'match', 'tokens');   %match��������ƥ�����ͣ�token���أ�����ǵ�λ�ã���ΪԪ������
date = cell(size(date_tokens));%����һ���ȴ��Ԫ������
for idx = 1:length(date_tokens)
    date{idx} = date_tokens{idx}{1};    %������д��
end
expr2 = '<div align="center">(\d*\.?\d*)</div>';
[datafile, data_tokens] = regexp(sourcefile, expr2, 'match', 'tokens'); %��Դ�ļ��л�ȡĿ������
data = zeros(size(data_tokens));%������������ͬ���ȵ�0
for idx = 1:length(data_tokens)
    data(idx) = str2double(data_tokens{idx}{1});       %ת���������ͺ����data��
end

data = reshape(data, 6, length(data)/6 )'; %���ţ�����Դ�������ʾ������ͬ����������ų����� 
items={'����' '���̼�' '��߼�' '���̼�' '��ͼ�' '������' '���׽��'};
sheet = sprintf('��%d����', season); %����������
xlswrite('D:/data', items, sheet)
xlswrite('D:/data', date' , sheet,'A2'); %�ڵ�һ��д������
range = sprintf('B2:%s%d',char(double('B')+size(data,2)-1), size(data,1)+1); %��Դ�ļ��л�ȡ��Ŀ�����ݵķ��÷�Χ
xlswrite('D:/data', data, sheet, range);
fprintf('���!\n')
end


fprintf('ȫ����ɣ����ݱ�����D�̵�data����У���ע��鿴��\n')