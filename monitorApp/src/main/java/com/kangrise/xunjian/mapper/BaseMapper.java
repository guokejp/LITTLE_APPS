package com.kangrise.xunjian.mapper;

/**
 * 基础mapper类
 * @author Administrator
 *
 * @param <T>
 */
public interface BaseMapper<T> {
	
	public T selectByPrimaryKey(Long id);
	public int deleteByPrimaryKey(Long id);
	public int insertSelective(T entity);
	public int updateByPrimaryKeySelective(T entity);
}
