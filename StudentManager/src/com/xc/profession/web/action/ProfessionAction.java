package com.xc.profession.web.action;

import java.io.IOException;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.xc.base.BaseAction;
import com.xc.department.domain.Department;
import com.xc.page.PageBean;
import com.xc.profession.domain.Profession;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

@SuppressWarnings("serial")
public class ProfessionAction extends BaseAction<Profession>{

	/**
	 * 查询所有专业
	 */
	public String findAll(){
		
		PageBean<Profession> pageBean = this.getProfessionService().findAll(getCurrentPage(), getPageSize());
		
		put("pageBean", pageBean);
		
		return "findAll";
	}
	/**
	 * addAndEdit
	 */
	public String addAndEdit(){
		if(this.getModel().getProfessionId()!=null){
			Profession oneProfession = this.getProfessionService().findById(this.getModel().getProfessionId());
			push(oneProfession);
		}
		
		List<Department> departmentList = this.getDepartmentService().findAll();
		set("departmentList", departmentList);
		
		return "addAndEdit";
	}
	
	public String update(){
		if(!StringUtils.isNotEmpty(this.getModel().getProfessionId())){
			this.getModel().setProfessionId(null);
		}
		this.getProfessionService().update(this.getModel());
		
		return "update";
	}
	/**
	 * ajax通过院系，查询所有专业
	 * @return
	 * @throws IOException 
	 */
	public String findAllWithDepartment() throws IOException{
		List<Profession> allProfession = null;
		if("".equals(this.getModel().getDepartment().getDepartmentId())){
			allProfession = this.getProfessionService().findAll();
		}else{
			allProfession = this.getProfessionService().findAll(this.getModel().getDepartment());
		}
		//1.查询所有的专业
		//2.讲java对象装换成json数据
		JsonConfig jsonConfig = new JsonConfig();
		
		jsonConfig.setExcludes(new String[]{"sutdentSet","department"});
		
		String jsonData = JSONArray.fromObject(allProfession,jsonConfig).toString();
		
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(jsonData);;
		
		return "none";
	}
	
	public String findClasses() throws IOException{
		
		Profession oneProfession = this.getProfessionService().findClasses(this.getModel());
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(new String[]{"sutdentSet","department"});
		
		String jsonData = JSONArray.fromObject(oneProfession, jsonConfig).toString();
		
		ServletActionContext.getResponse().setContentType("text/html;charset=UTF-8");
		ServletActionContext.getResponse().getWriter().print(jsonData);;
		
		return "none";
	}
	
}
