package com.kangrise.xunjian.service;

import com.kangrise.xunjian.mapper.BaseMapper;

public abstract class BaseServiceImpl<T,MAPPER extends BaseMapper<T>> {
	protected MAPPER mapper;
	public abstract void setMapper(MAPPER mapper);
	public T selectByPrimaryKey(Long id){
		return mapper.selectByPrimaryKey(id);
	}
	public int deleteByPrimaryKey(Long id){
		return mapper.deleteByPrimaryKey(id);
	}
	public int insertSelective(T entity){
		return mapper.insertSelective(entity);
	}
	public int updateByPrimaryKeySelective(T entity){
		return mapper.updateByPrimaryKeySelective(entity);
	}
}
