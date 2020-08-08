package com.kangrise.xunjian.service;

public interface IBaseService <T>{
	public T selectByPrimaryKey(Long id);
	public int deleteByPrimaryKey(Long id);
	public int insertSelective(T entity);
	public int updateByPrimaryKeySelective(T entity);
}
