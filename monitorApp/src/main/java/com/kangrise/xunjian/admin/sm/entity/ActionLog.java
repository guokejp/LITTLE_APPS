package com.kangrise.xunjian.admin.sm.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ActionLog {

	private Long id;
	private String userName = null;

	private String requestIp = null;
	
	private String source = null;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date requestDate;
	
	private String browserInfo;
	
	private String requestUrl;
	
	private String requestParam;

	private String separator = "     ";

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getRequestIp() {
        return requestIp;
    }

    public void setRequestIp(String requestIp) {
        this.requestIp = requestIp == null ? null : requestIp.trim();
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public String getBrowserInfo() {
        return browserInfo;
    }

    public void setBrowserInfo(String browserInfo) {
        this.browserInfo = browserInfo == null ? null : browserInfo.trim();
    }

    public String getRequestUrl() {
        return requestUrl;
    }

    public void setRequestUrl(String requestUrl) {
        this.requestUrl = requestUrl == null ? null : requestUrl.trim();
    }

    public String getRequestParam() {
        return requestParam;
    }

    public void setRequestParam(String requestParam) {
        this.requestParam = requestParam == null ? null : requestParam.trim();
    }

	@Override
	public String toString() {
		return requestDate + separator + requestIp + separator + separator + userName + separator + separator + separator + separator + browserInfo
				+ separator + requestUrl;
	}

}
