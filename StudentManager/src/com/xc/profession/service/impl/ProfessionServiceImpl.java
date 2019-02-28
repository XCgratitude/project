package com.xc.profession.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.xc.department.domain.Department;
import com.xc.page.PageBean;
import com.xc.profession.dao.ProfessionDao;
import com.xc.profession.domain.Profession;
import com.xc.profession.service.ProfessionService;

public class ProfessionServiceImpl implements ProfessionService{

	private ProfessionDao professionDao;
	public void setProfessionDao(ProfessionDao professionDao) {
		this.professionDao = professionDao;
	}
	
	@Override
	public List<Profession> findAll() {
		
		return professionDao.findAll();
	}

	@Override
	public List<Profession> findAll(Department department) {
		return professionDao.findAll(department);
	}

	public Profession findClasses(Profession profession) {
		
		return professionDao.findClasses(profession);
	}

	@Override
	public List<Profession> findAll(String departmentId) {
		return professionDao.findAll(departmentId);
	}

	@Override
	public Profession findById(String professionId) {
		return professionDao.findById(professionId);
	}

	@Override
	public void update(Profession profession) {
		professionDao.saveOrUpdate(profession);
	}

	@Override
	public List<Profession> findByDepartmentId(String departmentId) {
		if(!StringUtils.isNotBlank(departmentId)){
			return professionDao.findAll();
		}else{
			return professionDao.findByDepartmentId(departmentId);
		}
	}

	@Override
	public PageBean<Profession> findAll(int currentPage, int pageSize) {
		
		int totalRecord = this.professionDao.getTotalRecord();
		PageBean<Profession> pageBean = new PageBean<Profession>(currentPage, totalRecord, pageSize);
		List<Profession> data = professionDao.findAll(pageBean.getStartIndex(), pageBean.getPageSize());
		pageBean.setData(data);
		return pageBean;
	}

}
