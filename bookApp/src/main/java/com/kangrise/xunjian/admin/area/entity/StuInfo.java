package com.kangrise.xunjian.admin.area.entity;

import java.util.Date;

import org.springframework.util.StringUtils;

public class StuInfo {
    private Long id;
    //登录账号
    private String stunum;

    //用户姓名
    private String name;

    //用户电话
    private String phone;

    //用户性别
    private String sex;

    //手机端登录权限
    private Boolean phoneauth;

    //web端登录权限
    private Boolean webauth;

    //email
    private String email;

    //头像url
    private String urlimage;

    //巡检设备类型
    private String fixtype;

    //是否删除
    private Integer isdel;
    
    private Date createTime;

    private Long creatorId;
    
    private String deviceToken;//友邻token

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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Boolean getPhoneauth() {
        return phoneauth;
    }

    public void setPhoneauth(Boolean phoneauth) {
        this.phoneauth = phoneauth;
    }

    public Boolean getWebauth() {
        return webauth;
    }

    public void setWebauth(Boolean webauth) {
        this.webauth = webauth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getUrlimage() {
        return urlimage;
    }

    public void setUrlimage(String urlimage) {
        this.urlimage = urlimage == null ? null : urlimage.trim();
    }

    public String getFixtype() {
        return fixtype;
    }

    public void setFixtype(String fixtype) {
        this.fixtype = fixtype == null ? null : fixtype.trim();
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

	public String getDeviceToken() {
		if(StringUtils.isEmpty(deviceToken)) deviceToken = "";
		return deviceToken;
	}

	public void setDeviceToken(String deviceToken) {
		this.deviceToken = deviceToken;
	}

	public String getStunum() {
		return stunum;
	}

	public void setStunum(String stunum) {
		this.stunum = stunum;
	}
	
}