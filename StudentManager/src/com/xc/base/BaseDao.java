package com.xc.base;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T> {

	public void save(T t);
	public void update(T t);
	public void delete(T t);
	public void saveOrUpdate(T t);
	
	public T findById(Serializable id);
	public List<T> findAll();
	
	public List<T> findAll(String condition, Object[] params, int startIndex, int pageSize);

	public int getTotalRecord(String condition, Object[] params);
}
