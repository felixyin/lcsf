package com.hzc.model;

import java.util.Date;
import java.util.List;

/**
 * 每个用户的试卷对象
 */
public class HisPaper {
    private Integer id;

    private Float score;

    private Date answerStartTime;

    private Date answerEndTime;

    private Integer type;

    /**
     * 开卷考试还是闭卷考试 </br>
     * 1：闭卷考试</br>
     * 2：开卷考试</br>
     * 默认为开卷考试
     */
    private Integer closeExam = 2;

    private Date updateTime;

    private Date createTime;

    private Integer deleted;

    private Integer userId;

    private Integer cardId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Float getScore() {
        return score;
    }

    public void setScore(Float score) {
        this.score = score;
    }

    public Date getAnswerStartTime() {
        return answerStartTime;
    }

    public void setAnswerStartTime(Date answerStartTime) {
        this.answerStartTime = answerStartTime;
    }

    public Date getAnswerEndTime() {
        return answerEndTime;
    }

    public void setAnswerEndTime(Date answerEndTime) {
        this.answerEndTime = answerEndTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
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

    public Integer getCardId() {
        return cardId;
    }

    public void setCardId(Integer cardId) {
        this.cardId = cardId;
    }

    public Integer getCloseExam() {
        return closeExam;
    }

    public void setCloseExam(Integer closeExam) {
        this.closeExam = closeExam;
    }
}
