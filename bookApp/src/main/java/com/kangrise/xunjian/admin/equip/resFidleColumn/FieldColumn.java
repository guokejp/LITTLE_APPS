package com.kangrise.xunjian.admin.equip.resFidleColumn;

public class FieldColumn {

	private String field;
	
	private String column;
	
	//额外的css样式
	private String style;
	
	//是否使用函数
	private String usefx;
	
	//使用的函数名
	private String fxname;

	//使用的函数类型,主要针对date格式化，传参数是传对象
	private String fixtype;
	
	
	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getUsefx() {
		return usefx;
	}

	public void setUsefx(String usefx) {
		this.usefx = usefx;
	}

	public String getFxname() {
		return fxname;
	}

	public void setFxname(String fxname) {
		this.fxname = fxname;
	}

	public String getFixtype() {
		return fixtype;
	}

	public void setFixtype(String fixtype) {
		this.fixtype = fixtype;
	}

	
	
	
}
