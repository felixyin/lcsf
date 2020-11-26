package com.hzc.model;

public class SysMessage {
    private Integer id;

    private String title;

    private String content;

    private String dateTime;

    private Integer status;

    private Integer deleted;

    private String sysMessagecol;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime == null ? null : dateTime.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public String getSysMessagecol() {
        return sysMessagecol;
    }

    public void setSysMessagecol(String sysMessagecol) {
        this.sysMessagecol = sysMessagecol == null ? null : sysMessagecol.trim();
    }
}