package com.hzc.vo;

/**
 * Created by LiuJY on 2015/4/29.
 * <p/>
 * 李沧普法系统，学习页的答题卡
 */

public class AnswerCardOptimizeVO {

    private int questionId;

    //答错次数
    private int collectTime;

    //回答次数
    private int answerTime;

    private int seq;

    public AnswerCardOptimizeVO(int questionId, int collectTime, int answerTime, int seq) {
        this.questionId = questionId;
        this.collectTime = collectTime;
        this.answerTime = answerTime;
        this.seq = seq;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
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

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }
}
