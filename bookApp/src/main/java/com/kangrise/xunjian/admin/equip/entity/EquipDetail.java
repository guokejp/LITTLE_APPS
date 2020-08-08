package com.kangrise.xunjian.admin.equip.entity;

import com.kangrise.xunjian.entity.BaseEntity;

public class EquipDetail extends BaseEntity{
    private Long id;

    private Long infoid;

    private Integer isdel;

    private String name;

    private String detailidentify;
    
    private Integer oneself;//1-设备本身，0-配件，2-其他配件

    /**
     * 规格型号
     */
    private String dspecific;

    //单位
    private String dunit;
    
    /**
     * 数量
     */
    private Integer amount;

    private String url;

    private String detailnote;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getInfoid() {
        return infoid;
    }

    public void setInfoid(Long infoid) {
        this.infoid = infoid;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDetailidentify() {
        return detailidentify;
    }

    public void setDetailidentify(String detailidentify) {
        this.detailidentify = detailidentify == null ? null : detailidentify.trim();
    }

    public String getSpecific() {
        return dspecific;
    }

    public void setSpecific(String dspecific) {
        this.dspecific = dspecific == null ? null : dspecific.trim();
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getDetailnote() {
        return detailnote;
    }

    public void setDetailnote(String detailnote) {
        this.detailnote = detailnote == null ? null : detailnote.trim();
    }

	public String getDunit() {
		return dunit;
	}

	public void setDunit(String dunit) {
		this.dunit = dunit;
	}

	public Integer getOneself() {
		return oneself;
	}

	public void setOneself(Integer oneself) {
		this.oneself = oneself;
	}

	
	
	public String getDspecific() {
		return dspecific;
	}

	public void setDspecific(String dspecific) {
		this.dspecific = dspecific;
	}
	
	
}