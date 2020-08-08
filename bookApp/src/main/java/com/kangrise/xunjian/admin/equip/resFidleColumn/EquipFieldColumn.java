package com.kangrise.xunjian.admin.equip.resFidleColumn;

import java.util.List;

public class EquipFieldColumn {

	private String dbid;
	
	private String type;
	
	private String explain;
	
	private String attribute;
	
	private List<FieldColumn> fieldColumnList;

	public String getDbid() {
		return dbid;
	}

	public void setDbid(String dbid) {
		this.dbid = dbid;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getExplain() {
		return explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public List<FieldColumn> getFieldColumnList() {
		return fieldColumnList;
	}

	public void setFieldColumnList(List<FieldColumn> fieldColumnList) {
		this.fieldColumnList = fieldColumnList;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}
}
