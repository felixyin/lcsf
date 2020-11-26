package com.hzc.vo;

import com.hzc.model.LpOption;

import java.util.List;

/**
 * Created by LiuJY on 2015/4/29.
 * <p>
 * 问题，包括问题题干，选项
 */
public class QuestionVO extends AnswerCardVO {

    //试题选项
    private List<LpOption> options;

    //是否已经收藏该题，null：未收藏，1：收藏
    private int collectionType;

    private String questionAnswer;

    //用户答案
    private String userAnswer;

    public String getUserAnswer() {
        return userAnswer;
    }

    public void setUserAnswer(String userAnswer) {
        this.userAnswer = userAnswer;
    }

    public String getQuestionAnswer() {
        return questionAnswer;
    }

    public void setQuestionAnswer(String questionAnswer) {
        this.questionAnswer = questionAnswer;
    }

    public int getCollectionType() {
        return collectionType;
    }

    public void setCollectionType(int collectionType) {
        this.collectionType = collectionType;
    }

    public List<LpOption> getOptions() {
        return options;
    }

    public void setOptions(List<LpOption> options) {
        this.options = options;
    }
}
