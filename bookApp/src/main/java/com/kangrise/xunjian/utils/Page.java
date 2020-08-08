package com.kangrise.xunjian.utils;

public class Page {
	// 当前页
	private Integer page;
	// 每页容量
	private Integer pageSize;
	// 总页数
	private Double totalPage;
	// 数据总数
	private Integer totalRows;
	// 是否有下一页
	private Boolean hasNextPage;
	// 数据
	private Object list;

	/**
	 * 初始化app分页数据格式
	 * @param page 页码
	 * @param pageSize 每页容量
	 * @param totalRows 共多少条数据
	 * @param list 数据集
	 */
	public Page(Integer page, Integer pageSize, Integer totalRows, Object list) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.totalRows = totalRows;
		this.totalPage = Math.ceil((double) totalRows / pageSize);
		if (this.page >= totalPage) {
			this.hasNextPage = Boolean.FALSE;
		} else {
			this.hasNextPage = Boolean.TRUE;
		}
		this.list = list;
	}

	public Integer getPage() {
		return page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public Double getTotalPage() {
		return totalPage;
	}

	public Integer getTotalRows() {
		return totalRows;
	}

	public Boolean getHasNextPage() {
		return hasNextPage;
	}

	public Object getList() {
		return list;
	}
}
