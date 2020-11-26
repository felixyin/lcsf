package com.hzc.model;

import java.util.Date;

/**
 * 存储某个用户对每道题答题几次，答错了几次的对象。
 */
public class HisAnswer {
    private Integer id;

    private Integer userId;

    private Integer questionId;

    private Integer collectTimes;

    private Integer answerTimes;
    /**
     * 收藏中学习次数
     */

    private Integer styBmTimes;
    /**
     * 错题中学习次数
     */

    private Integer styCltTimes;

    /**
     * 查看试题学习次数
     */
    private Integer styTimes;

    /**
     * 有效的记录时间的回答次数
     */
    private Integer effectAnswerTimes;

    private Date createTime;

    private Date updateTime;

    private Integer deleted;

    public Integer getEffectAnswerTimes() {
        return effectAnswerTimes;
    }

    public void setEffectAnswerTimes(Integer effectAnswerTimes) {
        this.effectAnswerTimes = effectAnswerTimes;
    }

    public Integer getStyTimes() {
        return styTimes;
    }

    public void setStyTimes(Integer styTimes) {
        this.styTimes = styTimes;
    }

    public Integer getStyCltTimes() {
        return styCltTimes;
    }

    public void setStyCltTimes(Integer styCltTimes) {
        this.styCltTimes = styCltTimes;
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

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public Integer getCollectTimes() {
        return collectTimes;
    }

    public void setCollectTimes(Integer collectTimes) {
        this.collectTimes = collectTimes;
    }

    public Integer getAnswerTimes() {
        return answerTimes;
    }

    public void setAnswerTimes(Integer answerTimes) {
        this.answerTimes = answerTimes;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public Integer getStyBmTimes() {
        return styBmTimes;
    }

    public void setStyBmTimes(Integer styBmTimes) {
        this.styBmTimes = styBmTimes;
    }
}