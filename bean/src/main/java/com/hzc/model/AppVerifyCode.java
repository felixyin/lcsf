package com.hzc.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 用于发送验证码，封装验证码的bean
 */
public class AppVerifyCode implements Serializable {
    private Integer id;

    private String phone;

    private String verifyCode;

    private Date createTime;

    /**
     * 同一时间段第几次发送验证码
     */
    private int times;

    public int getTimes() {
        return times;
    }

    public void setTimes(int times) {
        this.times = times;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode == null ? null : verifyCode.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}