package com.hzc.model;

import java.util.Date;

/**
 * 座位对象，在生成准考证的时候，需要写有某个座位，这个座位是提前生成好的。
 */
public class SysSeat {
    private Integer id;

    private Integer userId;

    private Integer resourceId;

    private Integer seatNo;

    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getResourceId() {
        return resourceId;
    }

    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }

    public Integer getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(Integer seatNo) {
        this.seatNo = seatNo;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public SysSeat() {
    }

    public SysSeat( Integer resourceId, Integer seatNo) {
        this.resourceId = resourceId;
        this.seatNo = seatNo;
    }

}