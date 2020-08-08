package com.kangrise.xunjian.admin.sm.entity;

import java.util.Date;

import org.springframework.util.StringUtils;

public class Userinfo {
    private Long id;

    //分组id
    private Long groupid;
    
    //角色id
    private Long roleid;

    //登录账号
    private String loginaccount;

    //登录密码
    private String loginpasswd;

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
    
    private Role role;
    
    private UserGroup group;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getGroupid() {
        return groupid;
    }

    public void setGroupid(Long groupid) {
        this.groupid = groupid;
    }

    public String getLoginaccount() {
        return loginaccount;
    }

    public void setLoginaccount(String loginaccount) {
        this.loginaccount = loginaccount == null ? null : loginaccount.trim();
    }

    public String getLoginpasswd() {
        return loginpasswd;
    }

    public void setLoginpasswd(String loginpasswd) {
        this.loginpasswd = loginpasswd == null ? null : loginpasswd.trim();
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

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Long getRoleid() {
		return roleid;
	}

	public void setRoleid(Long roleid) {
		this.roleid = roleid;
	}

	public Integer getIsdel() {
		return isdel;
	}

	public void setIsdel(Integer isdel) {
		this.isdel = isdel;
	}

	public UserGroup getGroup() {
		return group;
	}

	public void setGroup(UserGroup group) {
		this.group = group;
	}

	public String getDeviceToken() {
		if(StringUtils.isEmpty(deviceToken)) deviceToken = "";
		return deviceToken;
	}

	public void setDeviceToken(String deviceToken) {
		this.deviceToken = deviceToken;
	}
	
}