package com.xc.manager.web.action;

import com.xc.base.BaseAction;
import com.xc.manager.domain.Manager;
import com.xc.manager.service.ManagerService;

@SuppressWarnings("serial")
public class ManagerAction extends BaseAction<Manager> {

	public String login(){
		
		Manager loginManager = this.getManagerService().login(this.getModel());
		
		if(loginManager != null){
			putSession("loginManager", loginManager);
			
			return "success";
		}
		this.addFieldError("", "用户名或密码错误");
		
		return "login";
	}
	public String home(){
		
		return "home";
	}
	
	public String logout(){
		put("loginManager", null);
		return "logout";
	}
}
