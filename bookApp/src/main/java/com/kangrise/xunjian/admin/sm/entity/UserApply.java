package com.kangrise.xunjian.admin.sm.entity;

import com.kangrise.xunjian.entity.BaseEntity;

public class UserApply extends BaseEntity{
    private Long id;

    /**
     * 调组申请
     */
    private Long cgroupApplyId;

    /**
     * 请假申请
     */
    private Long leaveApplyId;

    /**
     * 调班申请
     */
    private Long rankApplyId;
    
    /**
     * 申请类型 1换组申请,2请假申请，3调班申请
     */
    private Integer type;
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCgroupApplyId() {
        return cgroupApplyId;
    }

    public void setCgroupApplyId(Long cgroupApplyId) {
        this.cgroupApplyId = cgroupApplyId;
    }

    public Long getLeaveApplyId() {
        return leaveApplyId;
    }

    public void setLeaveApplyId(Long leaveApplyId) {
        this.leaveApplyId = leaveApplyId;
    }

    public Long getRankApplyId() {
        return rankApplyId;
    }

    public void setRankApplyId(Long rankApplyId) {
        this.rankApplyId = rankApplyId;
    }

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
    
}