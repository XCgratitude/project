package com.xc.student.service;

import com.xc.page.PageBean;
import com.xc.student.domain.Student;

public interface StudentService {

	public Student findById(String string);

	public void updateStudent(Student student);

	/**
	 * 
	 * @param condition
	 * @param params	条件
	 * @param currentPage	当前页
	 * @param pageSize	每次显示页数
	 * @return
	 */
	public PageBean<Student> findAll(String condition, Object[] params,int currentPage, int pageSize);

}
