package com.xc.teacher.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.xc.page.PageBean;
import com.xc.teacher.dao.TeacherDao;
import com.xc.teacher.domain.Teacher;
import com.xc.teacher.service.TeacherService;

public class TeacherServiceImpl implements TeacherService {

	private TeacherDao teacherDao;
	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}
	@Override
	public List<Teacher> findAll() {
		return teacherDao.findAll();
	}
	@Override
	public Teacher findById(String teacherId) {
		return  teacherDao.findById(teacherId);
	}
	@Override
	public void updateTeacher(Teacher teacher) {
		teacherDao.saveOrUpdate(teacher);
	}
	@Override
	public PageBean<Teacher> findAll(Teacher teacher, int currentPage, int pageSize) {
		//1.1 拼凑查询条件
		StringBuilder builder = new StringBuilder();
		//1.2 拼凑实际参数 , 可以重复，顺序 --> List
		List<Object> paramsList = new ArrayList<Object>();
		if(StringUtils.isNotBlank(teacher.getName())){
			builder.append(" and name like ?");
			paramsList.add("%"+teacher.getName()+"%");
		}if(StringUtils.isNotBlank(teacher.getJob())){
			builder.append(" and job=?");
			paramsList.add(teacher.getJob());
		}if(teacher.getDepartment()!=null){
			if(StringUtils.isNotBlank(teacher.getDepartment().getDepartmentId())){
				builder.append(" and department.departmentId=?");
				paramsList.add(teacher.getDepartment().getDepartmentId());
			}
		}
		//3 使用
		// 条件 , 格式：" and ..? and ..."
		String condition = builder.toString();
		// 实际参数
		Object[] params = paramsList.toArray();
		int totalRecord = teacherDao.getTotalRecord(condition, params);
		
		PageBean<Teacher> pageBean = new PageBean<Teacher>(currentPage, totalRecord, pageSize);
		List<Teacher> data = teacherDao.findAll(condition, params, pageBean.getStartIndex(),pageBean.getPageSize());
		pageBean.setData(data);
		return pageBean;
	}

}
