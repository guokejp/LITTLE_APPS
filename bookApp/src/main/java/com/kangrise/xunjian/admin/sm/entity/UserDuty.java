package com.kangrise.xunjian.admin.sm.entity;

import java.util.Date;

public class UserDuty {
    private Long id;

    //年
    private Integer year;

    //月
    private Integer month;

    //日
    private Integer day;

    //星期x
    private Integer dayweek;//星期天是0

    //保养频率
    private String frequency;

    //最先分配时的user，当有换班情况时，跟userid不同，否则都相同---
    private Long olduserid;
    
    //用户id，最终分配任务时以这个id为准
    private Long userid;

    //区域ids
    private String areaids;
    
    private Userinfo userinfo;

    //值班时间
    private Date date;
    
    //是否请假0：否,1:是
    private Integer isleave;
    
    //请假类型，明文-事假,病假
    private String leavetype;
    
    //是否换班-0：没有,1：换班
    private Integer changeduty;
    
    //换班日期
    private Date changeday;
    
    private Date createTime;

    private Long creatorId;
    
    private Integer thanDay;//请假时间是否是一天  0-小于一天， 1--大于等于1天(保留字段)

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }

    public Integer getDayweek() {
        return dayweek;
    }

    public void setDayweek(Integer dayweek) {
        this.dayweek = dayweek;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency == null ? null : frequency.trim();
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getAreaids() {
        return areaids;
    }

    public void setAreaids(String areaids) {
        this.areaids = areaids == null ? null : areaids.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
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

	public Userinfo getUserinfo() {
		return userinfo;
	}

	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}

	public Long getOlduserid() {
		return olduserid;
	}

	public void setOlduserid(Long olduserid) {
		this.olduserid = olduserid;
	}

	public Integer getIsleave() {
		return isleave;
	}

	public void setIsleave(Integer isleave) {
		this.isleave = isleave;
	}

	public String getLeavetype() {
		return leavetype;
	}

	public void setLeavetype(String leavetype) {
		this.leavetype = leavetype;
	}

	public Integer getChangeduty() {
		return changeduty;
	}

	public void setChangeduty(Integer changeduty) {
		this.changeduty = changeduty;
	}

	public Date getChangeday() {
		return changeday;
	}

	public void setChangeday(Date changeday) {
		this.changeday = changeday;
	}

	public Integer getThanDay() {
		return thanDay;
	}

	public void setThanDay(Integer thanDay) {
		this.thanDay = thanDay;
	}
	
	
	
}