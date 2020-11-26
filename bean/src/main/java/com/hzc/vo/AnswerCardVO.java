package com.hzc.vo;

import java.util.Date;

/**
 * Created by LiuJY on 2015/4/29.
 * <p>
 * 李沧普法系统，学习页的答题卡
 */

public class AnswerCardVO {

    //不为空，则代表此题被收藏
    private int collectionType;

    private int questionId;

    private int userId;

    //试题类型：判断题，单选题，多选题
    private String type;

    //答错次数
    private int collectTime;

    //回答次数
    private int answerTime;

    //用户信息更新时间
    private Date updateTime;

    private int seq;

    private String categoryCode;

    private String name;

    private String source;

    //用户答题答案
    private String userAnswer;

    public String getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer;
    }

    public int getCollectionType() {
        return collectionType;
    }

    public void setCollectionType(int collectionType) {
        this.collectionType = collectionType;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(int collectTime) {
        this.collectTime = collectTime;
    }

    public int getAnswerTime() {
        return answerTime;
    }

    public void setAnswerTime(int answerTime) {
        this.answerTime = answerTime;
    }
}
