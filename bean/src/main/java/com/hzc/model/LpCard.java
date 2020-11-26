package com.hzc.model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 准考证对象
 */
public class LpCard {
    private Integer id;

    private String name;

    private String cardNo;

    private Date birthday;

    private String sex;

    private String company;

    private String jobGrade;

    private Date examStartTime;

    private Date examEndTime;

    private String address;

    private Integer roomNo;

    private Integer seatNo;

    private String photoPath;

    private Date updateTime;

    private Date createTime;

    private Integer deleted;

    private Integer userId;

    private String birthdayStr;

    private String examTimeStartStr;

    private String examTimeEndStr;

    public LpCard() {
    }

    public LpCard(String name, String cardNo, Date birthday, String sex, String company, String jobGrade, Date examStartTime, Date examEndTime, String address, Integer roomNo, Integer seatNo, String photoPath, Date updateTime, Date createTime, Integer deleted, Integer userId) {
        this.name = name;
        this.cardNo = cardNo;
        this.birthday = birthday;
        this.sex = sex;
        this.company = company;
        this.jobGrade = jobGrade;
        this.examStartTime = examStartTime;
        this.examEndTime = examEndTime;
        this.address = address;
        this.roomNo = roomNo;
        this.seatNo = seatNo;
        this.photoPath = photoPath;
        this.updateTime = updateTime;
        this.createTime = createTime;
        this.deleted = deleted;
        this.userId = userId;
    }

    public LpCard(Integer id, String name, String cardNo, Date birthday, String sex, String company, String jobGrade, Date examStartTime, Date examEndTime, String address, Integer roomNo, Integer seatNo, String photoPath, Date updateTime, Date createTime, Integer deleted, Integer userId) {
        this.id = id;
        this.name = name;
        this.cardNo = cardNo;
        this.birthday = birthday;
        this.sex = sex;
        this.company = company;
        this.jobGrade = jobGrade;
        this.examStartTime = examStartTime;
        this.examEndTime = examEndTime;
        this.address = address;
        this.roomNo = roomNo;
        this.seatNo = seatNo;
        this.photoPath = photoPath;
        this.updateTime = updateTime;
        this.createTime = createTime;
        this.deleted = deleted;
        this.userId = userId;
    }

    public String getBirthdayStr() {
        return birthdayStr;
    }

    public void setBirthdayStr(String birthdayStr) {
        this.birthdayStr = birthdayStr;
    }

    public String getExamTimeStartStr() {
        return examTimeStartStr;
    }

    public void setExamTimeStartStr(String examTimeStartStr) {
        this.examTimeStartStr = examTimeStartStr;
    }

    public String getExamTimeEndStr() {
        return examTimeEndStr;
    }

    public void setExamTimeEndStr(String examTimeEndStr) {
        this.examTimeEndStr = examTimeEndStr;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
        String[] time = getTime(birthday);
        setBirthdayStr(time[0] + "年" + time[1] + "月" + time[2] + "日");
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company == null ? null : company.trim();
    }

    public String getJobGrade() {
        return jobGrade;
    }

    public void setJobGrade(String jobGrade) {
        this.jobGrade = jobGrade == null ? null : jobGrade.trim();
    }

    public Date getExamStartTime() {
        return examStartTime;
    }

    public void setExamStartTime(Date examStartTime) {
        this.examStartTime = examStartTime;
        String[] time = getTime(examStartTime);
        setExamTimeStartStr(time[0] + "年" + time[1] + "月" + time[2] + "日" + time[3] + "时" + time[4] + "分");
    }

    public Date getExamEndTime() {
        return examEndTime;
    }

    public void setExamEndTime(Date examEndTime) {
        this.examEndTime = examEndTime;
        String[] time = getTime(examEndTime);
        setExamTimeEndStr(time[3] + "时" + time[4] + "分");
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getRoomNo() {
        return roomNo;
    }

    public void setRoomNo(Integer roomNo) {
        this.roomNo = roomNo;
    }

    public Integer getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(Integer seatNo) {
        this.seatNo = seatNo;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath == null ? null : photoPath.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    private String[] getTime(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
        String s = format.format(date);
        return s.split("-");
    }
}