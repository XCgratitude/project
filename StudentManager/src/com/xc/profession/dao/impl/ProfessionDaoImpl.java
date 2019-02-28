package com.xc.profession.dao.impl;

import java.util.List;

import com.xc.base.impl.BaseDaoImpl;
import com.xc.department.domain.Department;
import com.xc.page.PageHibernateCallBack;
import com.xc.profession.dao.ProfessionDao;
import com.xc.profession.domain.Profession;
@SuppressWarnings("unchecked")
public class ProfessionDaoImpl extends BaseDaoImpl<Profession> implements ProfessionDao{

	@Override
	public List<Profession> findAll(Department department) {
		return this.getHibernateTemplate().find("from Profession where department = ?", department);
	}

	@Override
	public Profession findClasses(Profession profession) {
		return (Profession)this.getHibernateTemplate().get("com.xc.profession.domain.Profession", profession.getProfessionId());
 	}

	@Override
	public List<Profession> findAll(String departmentId) {
		return this.getHibernateTemplate().find("from Profession where depId=?",departmentId);
	}

	@Override
	public List<Profession> findByDepartmentId(String departmentId) {
		return this.getHibernateTemplate().find("from Profession where depId=?",departmentId);
	}

	@Override
	public int getTotalRecord() {
		List<Long> list = this.getHibernateTemplate().find("select count(*) from Profession");
		return list.get(0).intValue();
	}

	@Override
	public List<Profession> findAll(int startIndex, int pageSize) {
		return this.getHibernateTemplate().execute(new PageHibernateCallBack<Profession>().setHql("from Profession").setPageSize(pageSize).setStartIndex(startIndex));
	}

}
