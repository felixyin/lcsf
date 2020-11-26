package com.hzc.model;

import java.util.Date;

/**
 * 用户答题过程中收藏的题和打错的题的记录对象
 */
public class HisCollection {
    private Integer id;

    private Integer userId;

    private String categoryCode;

    private Integer type;

    private Integer questionId;

    private Date updateTime;

    private Long updateTimeInt;

    private String answer;

    private Integer costTime;

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
        if (null != updateTime) {
            this.updateTimeInt = updateTime.getTime();
        }
    }

    public Long getUpdateTimeInt() {
        return updateTimeInt;
    }

    public void setUpdateTimeInt(Long updateTimeInt) {
        this.updateTimeInt = updateTimeInt;
        if (null != updateTimeInt) {
            this.updateTime = new Date(updateTimeInt);
        }
    }

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

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode == null ? null : categoryCode.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer == null ? null : answer.trim();
    }

    public Integer getCostTime() {
        return costTime;
    }

    public void setCostTime(Integer costTime) {
        this.costTime = costTime;
    }

    @Override
    public String toString() {
        return "LpCollection{" +
                "id=" + id +
                ", userId=" + userId +
                ", categoryCode='" + categoryCode + '\'' +
                ", type=" + type +
                ", questionId=" + questionId +
                ", updateTime=" + updateTime +
                ", answer='" + answer + '\'' +
                ", costTime=" + costTime +
                '}';
    }
}