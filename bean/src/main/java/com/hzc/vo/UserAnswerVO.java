package com.hzc.vo;

import com.hzc.framework.ssh.controller.validate.anno.NotNull;

/**
 * Created by LiuJY on 2015/4/29.
 * 用户错题记录
 */
public class UserAnswerVO {

    @NotNull
    private Integer questionId;

    //用户答案
    @NotNull
    private String userAnswer;

    //用户是否答对：true 、 false
    @NotNull
    private String userResult;

    private int userId;

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer;
    }

    public String getUserResult() {
        return userResult;
    }

    public void setUserResult(String userResult) {
        this.userResult = userResult;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
