function [ output_args ] = ForP3( X_real )
%UNTITLED2 ��ʱ�����н���Ԥ���������人��ѧˮ��Ƶ��������
%   ����һ��ʱ�����У����һ��EXCEL��ʽ�ļ�

n = length ( X_real ) ; %��ȡ���г���
A = 1:1:n ;
N = P3_P (X_real) ; %�����ӦƵ��
X_real = sort(X_real,'descend');                  %sort�ǰ�������С��������
wenzi = ['����Ƶ'];


xlswrite('F:/ë��ˮ��ˮ�Ĺ���/���ں�ˮ/Q10_2.xls',wenzi,'sheet1','A1');
% xlswrite('F:/ë��ˮ��ˮ�Ĺ���/���ں�ˮ/Q9.xls',A','sheet1','A2');
% xlswrite('F:/ë��ˮ��ˮ�Ĺ���/���ں�ˮ/Q9.xls',N','sheet1','C2');
% xlswrite('F:/ë��ˮ��ˮ�Ĺ���/���ں�ˮ/Q9.xls',X_real','sheet1','B2');



end

