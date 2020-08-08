package com.kangrise.xunjian.admin.area.entity;

import com.kangrise.xunjian.entity.BaseEntity;

public class Area extends BaseEntity
{
	private Long id;//id
	private String name;//区域名称
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
