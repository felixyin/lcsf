package com.hzc.vo;

import com.hzc.model.SysSeat;

import java.util.Date;

/**
 * 考场坐位信息
 * <pre>
 *     包括：考试信息，考场信息
 * </pre>
 * Created by HZC on 2015/5/28.
 */
public class SysSeatVO extends SysSeat {

    private Date startTime;

    private Date endTime;

    private String roomAddress;

    private Integer roomNo;

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
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
}
