package com.hzc.model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 闭卷（现场）考试，需要占用教室、座位，且需要规定时间，这些系统配置信息统称为资源
 */
public class SysResource {
    private Integer id;

    private Date startTime;

    private Date endTime;

    private String roomAddress;

    private Integer roomNo;

    private Integer seatCount;

    private Date updateTime;

    private String startTimeStr;

    private String endTimeStr;

    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
        setStartTimeStr("");
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
        setEndTimeStr("");
    }

    public String getRoomAddress() {
        return roomAddress;
    }

    public void setRoomAddress(String roomAddress) {
        this.roomAddress = roomAddress;
    }

    public Integer getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(Integer roomNo) {
        this.roomNo = roomNo;
    }

    public Integer getSeatCount() {
        return seatCount;
    }

    public void setSeatCount(Integer seatCount) {
        this.seatCount = seatCount;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getStartTimeStr() {
        return startTimeStr;
    }

    public void setStartTimeStr(String startTimeStr) {
        this.startTimeStr = format.format(getStartTime());
    }

    public String getEndTimeStr() {
        return endTimeStr;
    }

    public void setEndTimeStr(String endTimeStr) {
        this.endTimeStr = format.format(getEndTime());
    }
}
