package com.xc.manager.dao.impl;

import java.util.List;

import com.xc.base.impl.BaseDaoImpl;
import com.xc.manager.dao.ManagerDao;
import com.xc.manager.domain.Manager;

public class ManagerDaoImpl extends BaseDaoImpl<Manager> implements ManagerDao{

	@SuppressWarnings("unchecked")
	public Manager find(String name, String password) {
		List<Manager> manager = this.getHibernateTemplate().find("from Manager where name=? and password=?", name,password);
		if(manager.size() == 1){
			return manager.get(0);
		}
		return null;
	}

}
