package com.kangrise.xunjian.admin.equip.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.kangrise.xunjian.entity.BaseEntity;

public class EquipInfo extends BaseEntity{
    private Long id;

    private Long pid;

    //根节点id
    private Long rootid;

    //对于树形tree类来说，是否是叶子节点。。0：不是，1：是
    private Integer istreeleaf;

    //是否是树形tree类叶子节点下属的类。。0：不是，1：是
    private Integer istableleaf;
    
    //是否删除。。0：否，1：是
    private Integer isdel;

    private Long areaId;

    private String name;
    
    //种类id
    private Long dkindid;

    //编号
    private String identify;
    
    //出版社
    private String ifirm;
    
    //品牌
    private String ibrand;
    
    //安装位置
    private String unit;

    private Integer amount;

    //图片地址
    private String infourl;

    //规格型号
    private String ispecific;

    private String length;

    private String width;

    private String height;

    //线速度
    private String speed;

    //功率
    private String power;

    //减速电机品牌
    private String elebrand;

    //是否变频
    private String inverter;

    //变频器品牌
    private String invbrand;

    //皮带材质
    private String beltmate;

    //状态 正常-10,异常-20
    private Integer istatus;//10-正常，1-一级预警，2-二级预警，3-三级预警

    //上线时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date onlinedate;

    //过期时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date baddate;

    //质保期 年
    private Integer guarantee;

    //维修时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date repairdate;
    
    //更换时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date replacedate;
    
    //设备点位位置
    //100,200    -- 100代表横坐标为100px，200代表纵坐标为200px
    private String spotlocate;

    //备注
    private String infonote;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public Long getRootid() {
        return rootid;
    }

    public void setRootid(Long rootid) {
        this.rootid = rootid;
    }

    public Integer getIstreeleaf() {
        return istreeleaf;
    }

    public void setIstreeleaf(Integer istreeleaf) {
        this.istreeleaf = istreeleaf;
    }

    public Integer getIstableleaf() {
        return istableleaf;
    }

    public void setIstableleaf(Integer istableleaf) {
        this.istableleaf = istableleaf;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    public Long getAreaId() {
        return areaId;
    }

    public void setAreaId(Long areaId) {
        this.areaId = areaId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIdentify() {
        return identify;
    }

    public void setIdentify(String identify) {
        this.identify = identify == null ? null : identify.trim();
    }

    
    
    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getInfourl() {
        return infourl;
    }

    public void setInfourl(String infourl) {
        this.infourl = infourl == null ? null : infourl.trim();
    }
    
    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length == null ? null : length.trim();
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width == null ? null : width.trim();
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height == null ? null : height.trim();
    }

    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed == null ? null : speed.trim();
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power == null ? null : power.trim();
    }

    public String getElebrand() {
        return elebrand;
    }

    public void setElebrand(String elebrand) {
        this.elebrand = elebrand == null ? null : elebrand.trim();
    }

    public String getInverter() {
        return inverter;
    }

    public void setInverter(String inverter) {
        this.inverter = inverter;
    }

    public String getInvbrand() {
        return invbrand;
    }

    public void setInvbrand(String invbrand) {
        this.invbrand = invbrand == null ? null : invbrand.trim();
    }

    public String getBeltmate() {
        return beltmate;
    }

    public void setBeltmate(String beltmate) {
        this.beltmate = beltmate == null ? null : beltmate.trim();
    }

    public Date getOnlinedate() {
        return onlinedate;
    }

    public void setOnlinedate(Date onlinedate) {
        this.onlinedate = onlinedate;
    }

    public Date getBaddate() {
        return baddate;
    }

    public void setBaddate(Date baddate) {
        this.baddate = baddate;
    }

    public Integer getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(Integer guarantee) {
        this.guarantee = guarantee;
    }

    public Date getRepairdate() {
        return repairdate;
    }

    public void setRepairdate(Date repairdate) {
        this.repairdate = repairdate;
    }

    public String getInfonote() {
        return infonote;
    }

    public void setInfonote(String infonote) {
        this.infonote = infonote == null ? null : infonote.trim();
    }

	public String getIfirm() {
		return ifirm;
	}

	public void setIfirm(String ifirm) {
		this.ifirm = ifirm;
	}

	public String getIbrand() {
		return ibrand;
	}

	public void setIbrand(String ibrand) {
		this.ibrand = ibrand;
	}

	public String getIspecific() {
		return ispecific;
	}

	public void setIspecific(String ispecific) {
		this.ispecific = ispecific;
	}

	public Integer getIstatus() {
		return istatus;
	}

	public void setIstatus(Integer istatus) {
		this.istatus = istatus;
	}

	public Date getReplacedate() {
		return replacedate;
	}

	public void setReplacedate(Date replacedate) {
		this.replacedate = replacedate;
	}

	public Long getDkindid() {
		return dkindid;
	}

	public void setDkindid(Long dkindid) {
		this.dkindid = dkindid;
	}

	public String getSpotlocate() {
		return spotlocate;
	}

	public void setSpotlocate(String spotlocate) {
		this.spotlocate = spotlocate;
	}
    
    
}