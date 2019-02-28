package com.xc.web.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

@SuppressWarnings("serial")
public class LoginInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		//�ж�session�������Ƿ����û���Ϣ��û�о�����
		Object obj = ActionContext.getContext().getSession().get("loginManager");
		if(obj == null){
			//û����Ҫ��¼
			//�Ѻ���ʾ
			Object action = invocation.getAction();
			//�жϣ�����ʱ�Ƿ���ActionSupport
			if(action instanceof ActionSupport){
				ActionSupport actionSupport = (ActionSupport) action;
				actionSupport.addFieldError("", "���¼");
			}
			return "login";
		}
		//��¼������
		return invocation.invoke();
	}

}
