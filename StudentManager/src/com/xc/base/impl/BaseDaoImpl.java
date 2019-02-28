package com.xc.base.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.xc.base.BaseDao;
import com.xc.page.PageHibernateCallBack;

public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T>{

	private Class<?> beanClass;
	public BaseDaoImpl() {
		ParameterizedType paramType = (ParameterizedType) this.getClass().getGenericSuperclass();
		beanClass = (Class<?>) paramType.getActualTypeArguments()[0];
	}
	@Override
	public void save(T t) {
		this.getHibernateTemplate().save(t);
	}

	@Override
	public void update(T t) {
		this.getHibernateTemplate().update(t);
	}

	@Override
	public void delete(T t) {
		this.getHibernateTemplate().delete(t);		
	}

	@Override
	public void saveOrUpdate(T t) {
		this.getHibernateTemplate().saveOrUpdate(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T findById(Serializable id) {
		return (T) this.getHibernateTemplate().get(beanClass, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> findAll() {
		return this.getHibernateTemplate().find("from "+beanClass.getName());
	}
	@Override
	public List<T> findAll(String condition, Object[] params, int startIndex, int pageSize) {
		String hql = "from "+ beanClass.getName()+" where 1=1" + condition;
		return this.getHibernateTemplate().execute(new PageHibernateCallBack<T>().setHql(hql).setParams(params).setPageSize(pageSize).setStartIndex(startIndex));
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getTotalRecord(String condition, Object[] params) {
		String hql = "select count(*) from "+beanClass.getName()+" where 1=1" + condition;
		List<Long> list = this.getHibernateTemplate().find(hql, params);
		return list.get(0).intValue();
	}
	
}
