package com.kangrise.xunjian.admin.sm.entity;

import java.util.Date;

public class UserGroup {
	//主键id
    private Long id;

    //分组名称
    private String name;
    
    //是否属于管理者
    private Integer ismana = 0;
    
    //是否删除
    private Integer isdel;

    //分组备注
    private String description;
    
    private Date createTime;

    private Long creatorId;

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
        this.name = name == null ? null : name.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(Long creatorId) {
		this.creatorId = creatorId;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	public Integer getIsmana() {
		return ismana;
	}

	public void setIsmana(Integer ismana) {
		this.ismana = ismana;
	}
	
	
	
}