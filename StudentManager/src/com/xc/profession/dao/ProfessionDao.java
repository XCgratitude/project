package com.xc.profession.dao;

import java.util.List;

import com.xc.base.BaseDao;
import com.xc.department.domain.Department;
import com.xc.profession.domain.Profession;

public interface ProfessionDao extends BaseDao<Profession>{
	
	public List<Profession> findAll(Department department);

	public Profession findClasses(Profession professionId);

	public List<Profession> findAll(String departmentId);

	public List<Profession> findByDepartmentId(String departmentId);

	public int getTotalRecord();

	public List<Profession> findAll(int startIndex, int pageSize);
}
