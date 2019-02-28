package com.xc.manager.service.impl;

import com.xc.manager.dao.ManagerDao;
import com.xc.manager.domain.Manager;
import com.xc.manager.service.ManagerService;

public class ManagerServiceImpl implements ManagerService{

	private ManagerDao managerDao;
	public void setManagerDao(ManagerDao managerDao) {
		this.managerDao = managerDao;
	}
	@Override
	public Manager login(Manager manager) {
		return managerDao.find(manager.getName(), manager.getPassword());
	}

}
