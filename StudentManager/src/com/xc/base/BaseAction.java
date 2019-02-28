package com.xc.base;

import java.lang.reflect.ParameterizedType;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.xc.department.service.DepartmentService;
import com.xc.manager.service.ManagerService;
import com.xc.profession.service.ProfessionService;
import com.xc.student.service.StudentService;
import com.xc.teacher.service.TeacherService;

@SuppressWarnings("serial")
public class BaseAction<T> extends ActionSupport implements ModelDriven<T>{

	private T t;
	public T getModel(){
		return t;
	}
	@SuppressWarnings("unchecked")
	public BaseAction(){
		try {
			ParameterizedType paramType = (ParameterizedType)this.getClass().getGenericSuperclass();
			Class<T> clazz = (Class<T>) paramType.getActualTypeArguments()[0];
			t = clazz.newInstance();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	private ManagerService managerService;
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	public ManagerService getManagerService(){
		return managerService;
	}
	
	private StudentService studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	public StudentService getStudentService(){
		return studentService;
	}
	
	private DepartmentService departmentService;
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	
	private ProfessionService professionService;
	public void setProfessionService(ProfessionService professionService) {
		this.professionService = professionService;
	}
	public ProfessionService getProfessionService() {
		return professionService;
	}
	
	private TeacherService teacherService;
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	public TeacherService getTeacherService() {
		return teacherService;
	}
	
	//分页数据
	private int currentPage = 1;
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	
	private int pageSize = 2;
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageSize() {
		return pageSize;
	}
	
	//简化值栈操作
	public void push(Object obj){
		ActionContext.getContext().getValueStack().push(obj);
	}
	
	public void set(String key ,Object o){
		ActionContext.getContext().getValueStack().set(key, o);
	}
	
	public void put(String key ,Object value){
		ActionContext.getContext().put(key, value);
	}
	
	public void putSession(String key, Object value){
		ActionContext.getContext().getSession().put(key, value);
	}
	
	public void putApplication(String key, Object value){
		ActionContext.getContext().getApplication().put(key, value);
	}
}
