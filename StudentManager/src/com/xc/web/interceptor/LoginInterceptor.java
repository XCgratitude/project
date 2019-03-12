package com.xc.web.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

@SuppressWarnings("serial")
public class LoginInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		//判断session作用域是否有用户信息，没有就拦截
		Object obj = ActionContext.getContext().getSession().get("loginManager");
		if(obj == null){
			//没有需要登录
			//友好提示
			Object action = invocation.getAction();
			//判断，运行时是否是ActionSupport
			if(action instanceof ActionSupport){
				ActionSupport actionSupport = (ActionSupport) action;
				actionSupport.addFieldError("", "请登录");
			}
			return "login";
		}
		//登录，放行
		return invocation.invoke();
	}

}
