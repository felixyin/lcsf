package com.hzc.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 用户考试成绩报表bean
 * Created by Michel on 2015/7/18.
 */
public class PeopleReportVO {

    private Integer id;
    private String userName;
    private String idCard;
    private Integer companyId;
    private String type;
    private float score;
    private Date answerEndTime;
    private Date answerStartTime;
    private String answerStartTimeStr;
    private String answerEndTimeStr;
    private Integer xueshi;

    SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public Date getAnswerEndTime() {
        return answerEndTime;
    }

    public void setAnswerEndTime(Date answerEndTime) {
        this.answerEndTime = answerEndTime;
        setAnswerEndTimeStr("");
    }

    public Date getAnswerStartTime() {
        return answerStartTime;
    }

    public void setAnswerStartTime(Date answerStartTime) {
        this.answerStartTime = answerStartTime;
        setAnswerStartTimeStr("");
    }

    public String getAnswerStartTimeStr() {
        return answerStartTimeStr;
    }

    public void setAnswerStartTimeStr(String answerStartTimeStr) {
        this.answerStartTimeStr = format.format(getAnswerStartTime());
    }

    public String getAnswerEndTimeStr() {
        return answerEndTimeStr;
    }

    public void setAnswerEndTimeStr(String answerEndTimeStr) {
        this.answerEndTimeStr = format.format(getAnswerEndTime());
    }

    public Integer getXueshi() {

        return xueshi;
    }

    public void setXueshi(Integer xueshi) {
        this.xueshi = xueshi;
    }
}
