package com.xc.student.web.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import com.xc.base.BaseAction;
import com.xc.department.domain.Department;
import com.xc.page.PageBean;
import com.xc.profession.domain.Profession;
import com.xc.student.domain.Student;

@SuppressWarnings("serial")
public class StudentAction extends BaseAction<Student>{

	public String selectPage(){
		
		String condition = null;
		String professionId = null;
		String departmentId = null;
		if(this.getModel().getName()!=null){
			condition = this.getModel().getName();
			professionId = this.getModel().getProfession().getProfessionId();
			departmentId = this.getModel().getProfession().getDepartment().getDepartmentId();
		}
		StringBuilder builder = new StringBuilder();
		List<Object> paramsList = new ArrayList<Object>();
		if(StringUtils.isNotBlank(condition)){
			builder.append(" and name like ?");
			builder.append(" or telephone like ?");
			builder.append(" or gender = ?");
			paramsList.add("%"+condition+"%");
			paramsList.add("%"+condition+"%");
			paramsList.add(condition);
		}
		if(StringUtils.isNotBlank(professionId) || StringUtils.isNotBlank(departmentId)){
			if(!StringUtils.isNotBlank(professionId) && StringUtils.isNotBlank(departmentId)){
				List<Profession> professionList = this.getProfessionService().findAll(departmentId);
				builder.append(" and professionId in(");
				for (int i = 0; i < professionList.size(); i++) {
					builder.append("?");  
					if(i < professionList.size()-1){
						builder.append(",");
					}
					paramsList.add(professionList.get(i).getProfessionId());
				}
				builder.append(")");
			}else{
				builder.append(" and professionId = ?");
				paramsList.add(professionId);
			}
		}
		condition = builder.toString();
		// 实际参数
		Object[] params = paramsList.toArray();
		
		PageBean<Student> pageBean = this.getStudentService().findAll(condition, params, getCurrentPage(), getPageSize());
		
		put("pageBean", pageBean);
		
		List<Department> allDepartment = this.getDepartmentService().findAll();
		set("allDepartment", allDepartment);
		
		List<Profession> allProfession = this.getProfessionService().findByDepartmentId(departmentId);
		set("allProfession", allProfession);
		
		return "findAll";
	}
	
	public String findById(){
		
		Student showStudent = this.getStudentService().findById(this.getModel().getStudentId());
		
		push(showStudent);
		
		return "findById";
	}
	
	public String addOrEdit(){
		
		if(this.getModel().getStudentId()!=null){
			Student editOrAdd = this.getStudentService().findById(this.getModel().getStudentId());
			push(editOrAdd);
		}
		List<Department> departmentList = this.getDepartmentService().findAll();
		set("departmentList", departmentList);
		return "edit";
	}
	
	public String updateStudent(){
		if("".equals(this.getModel().getStudentId())){
			this.getModel().setStudentId(null);
		}
		this.getStudentService().updateStudent(this.getModel());
		return "updateStudent";
	}
}
