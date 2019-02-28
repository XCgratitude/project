package com.xc.manager.dao;

import com.xc.base.BaseDao;
import com.xc.manager.domain.Manager;

public interface ManagerDao extends BaseDao<Manager>{

	public Manager find(String name, String password);
}
