package com.kangrise.xunjian.admin.sm.entity;

public class RandomCheck {
    private Long id;

    //通过考核最低完成率
    private Integer passrate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getPassrate() {
        return passrate;
    }

    public void setPassrate(Integer passrate) {
        this.passrate = passrate;
    }
}