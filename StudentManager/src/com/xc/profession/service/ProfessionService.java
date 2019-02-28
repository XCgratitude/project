package com.xc.profession.service;

import java.util.List;

import com.xc.department.domain.Department;
import com.xc.page.PageBean;
import com.xc.profession.domain.Profession;

public interface ProfessionService {

	List<Profession> findAll();

	List<Profession> findAll(Department department);

	Profession findClasses(Profession professionId);

	List<Profession> findAll(String departmentId);

	Profession findById(String professionId);

	void update(Profession profession);

	List<Profession> findByDepartmentId(String departmentId);

	PageBean<Profession> findAll(int currentPage, int pageSize);
}
