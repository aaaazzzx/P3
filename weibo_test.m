
ie = actxserver('internetexplorer.application');
% ������΢����¼ҳ��
ie.Navigate('http://weibo.com');
% ��ҳ����Ϊ�ɼ�
ie.Visible = true;
% �ȴ���ҳ�������
while ~strcmp(ie.ReadyState, 'READYSTATE_COMPLETE')
pause(0.2);
end
% 1 ��ȡ�˻�����������˻���
id_pl_login_form=ie.document.body.firstChild.lastchild.firstchild.nextSibling.firstchild.nextSibling.firstchild.nextSibling;
username=id_pl_login_form.firstchild.nextSibling.nextSibling.nextSibling.firstchild.firstchild.firstchild;
username.value='15950521781@sina.cn';
% 2 ��ȡ�����������������
password=id_pl_login_form.firstchild.nextSibling.nextSibling.nextSibling.firstchild.nextSibling.firstchild.firstchild;
password.value='lhx19940103';
% 3 ��ȡ��¼��ť����������¼������ϰ汾��֮ͬ����
submit_btm=id_pl_login_form.firstchild.nextSibling.nextSibling.nextSibling.firstchild.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.firstchild.firstchild;
submit_btm.click;
