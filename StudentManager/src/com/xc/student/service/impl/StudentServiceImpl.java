package com.xc.student.service.impl;

import java.util.List;

import com.xc.page.PageBean;
import com.xc.student.dao.StudentDao;
import com.xc.student.domain.Student;
import com.xc.student.service.StudentService;

public class StudentServiceImpl implements StudentService{

	private StudentDao studentDao;
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	
	@Override
	public Student findById(String studentId) {
		return studentDao.findById(studentId);
	}

	@Override
	public void updateStudent(Student student) {
		studentDao.saveOrUpdate(student);
	}


	@Override
	public PageBean<Student> findAll(String condition, Object[] params, int currentPage, int pageSize) {
		//等到总的记录数
		int totalRecord = this.studentDao.getTotalRecord(condition, params);
		//创建对象
		PageBean<Student> pageBean = new PageBean<Student>(currentPage, totalRecord, pageSize);
		List<Student> data = studentDao.findAll(condition, params, pageBean.getStartIndex(), pageBean.getPageSize());
		pageBean.setData(data);
		return pageBean;
	}

}
