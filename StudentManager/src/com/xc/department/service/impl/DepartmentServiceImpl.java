package com.xc.department.service.impl;

import java.util.List;

import com.xc.department.dao.DepartmentDao;
import com.xc.department.domain.Department;
import com.xc.department.service.DepartmentService;

public class DepartmentServiceImpl implements DepartmentService{

	private DepartmentDao departmentDao;
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}
	@Override
	public List<Department> findAll() {
		return departmentDao.findAll();
	}
}
