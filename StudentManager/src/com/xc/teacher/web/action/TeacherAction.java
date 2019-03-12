package com.xc.teacher.web.action;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xc.base.BaseAction;
import com.xc.department.domain.Department;
import com.xc.department.service.DepartmentService;
import com.xc.page.PageBean;
import com.xc.teacher.domain.Teacher;
import com.xc.teacher.service.TeacherService;

@SuppressWarnings({ "unused", "serial" })
public class TeacherAction extends BaseAction<Teacher> {

	public String findAll(){
		//查询所有老师
		PageBean<Teacher> pageBean = this.getTeacherService().findAll(this.getModel(), this.getCurrentPage(), this.getPageSize());
		//放入map集合
		ActionContext.getContext().put("pageBean", pageBean);
		
		List<Teacher> teacherList = this.getTeacherService().findAll();
		ActionContext.getContext().put("teacherList", teacherList);
		
		List<Department> departmentList = this.getDepartmentService().findAll();
		set("departmentList", departmentList);
		return "findAll";
	}
	
	public String addAddEdit(){
		
		if(this.getModel().getTeacherId()!=null){
			Teacher oneTeacher = this.getTeacherService().findById(this.getModel().getTeacherId());
			push(oneTeacher);
		}
		List<Department> departmentList = this.getDepartmentService().findAll();
		
		set("departmentList", departmentList);
		
		return "addAddEdit";
	}
	
	public String update(){
		if("".equals(this.getModel().getTeacherId())){
			this.getModel().setTeacherId(null);
		}
		this.getTeacherService().updateTeacher(this.getModel());
		
		return "update";
	}
}
