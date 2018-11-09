
ie = actxserver('internetexplorer.application');
% 打开新浪微博登录页面
ie.Navigate('http://weibo.com');
% 网页设置为可见
ie.Visible = true;
% 等待网页加载完毕
while ~strcmp(ie.ReadyState, 'READYSTATE_COMPLETE')
pause(0.2);
end
% 1 获取账户输入框并填入账户名
id_pl_login_form=ie.document.body.firstChild.lastchild.firstchild.nextSibling.firstchild.nextSibling.firstchild.nextSibling;
username=id_pl_login_form.firstchild.nextSibling.nextSibling.nextSibling.firstchild.firstchild.firstchild;
username.value='15950521781@sina.cn';
% 2 获取密码输入框并填入密码
password=id_pl_login_form.firstchild.nextSibling.nextSibling.nextSibling.firstchild.nextSibling.firstchild.firstchild;
password.value='lhx19940103';
% 3 获取登录按钮并触发点击事件（与老版本不同之处）
submit_btm=id_pl_login_form.firstchild.nextSibling.nextSibling.nextSibling.firstchild.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.firstchild.firstchild;
submit_btm.click;
