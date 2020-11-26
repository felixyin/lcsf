package com.hzc.service;

import com.hzc.factory.alias.D;
import com.hzc.framework.ssh.service.TrancationType;
import com.hzc.framework.ssh.service.Transaction;
import com.hzc.model.HisAnswer;
import com.hzc.util.alias.S;
import org.apache.log4j.Logger;

import java.util.Date;


/**
 * Created by yinbin on 2015/6/15.
 */
@Transaction
public class HisAnswerService {
    private static Logger log = Logger.getLogger(HisAnswerService.class);
    /**
     * 检查用户答案的记录对象是否存在，否则，插入。
     *
     * @param userId
     * @param questionId
     * @return
     */
    private boolean checkAndInsert(Integer userId, Integer questionId) {
        HisAnswer hisAnswer = D.hisAnswerMapper().selectByUserIdAndQuestionId(userId, questionId);
        if (null == hisAnswer) {
            HisAnswer answer = new HisAnswer();
            answer.setUserId(userId);
            answer.setQuestionId(questionId);
            answer.setCollectTimes(0);
            answer.setAnswerTimes(1);
            answer.setStyBmTimes(0);
            answer.setCreateTime(new Date());
            answer.setDeleted(1);
            try {
                D.hisAnswerMapper().insertSelective(answer);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return true;
        }
        return false;
    }


    /**
     * 题目回答次数加1
     *
     * @param userId
     * @param questionId
     * @return
     */
    public boolean addAnswerTimes(Integer userId, Integer questionId) {
//        log.error("hzcerror:add answerTimes for test");
        HisAnswer hisAnswer = D.hisAnswerMapper().selectByUserIdAndQuestionId(userId, questionId);
        if (null == hisAnswer) {
            HisAnswer answer = new HisAnswer();
            answer.setUserId(userId);
            answer.setQuestionId(questionId);
            answer.setCollectTimes(0);
            answer.setAnswerTimes(1);
            answer.setStyBmTimes(0);
            answer.setStyTimes(0);
            answer.setCreateTime(new Date());
            answer.setDeleted(1);

            try {
                D.hisAnswerMapper().insertSelective(answer);
            }catch (Exception e){
                e.printStackTrace();
            }
            return true;
        } else {
            return D.hisAnswerMapper().addAnserTimes(userId, questionId) == 1;
        }
    }

    /**
     * 题目浏览次数加1
     *
     * @param userId
     * @param questionId
     * @return
     */
    public boolean addStudyTimes(Integer userId, Integer questionId) {
        HisAnswer hisAnswer = D.hisAnswerMapper().selectByUserIdAndQuestionId(userId, questionId);
        if (null == hisAnswer) {
            HisAnswer answer = new HisAnswer();
            answer.setUserId(userId);
            answer.setQuestionId(questionId);
            answer.setCollectTimes(0);
            answer.setAnswerTimes(0);
            answer.setStyBmTimes(0);
            answer.setStyTimes(1);
            answer.setCreateTime(new Date());
            answer.setDeleted(1);
            try {
                D.hisAnswerMapper().insertSelective(answer);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return true;
        } else {
            return D.hisAnswerMapper().addStudyTimes(userId, questionId) == 1;
        }
    }


    /**
     * 题目回答错误次数加1
     *
     * @param userId
     * @param questionId
     * @return
     */
    public boolean addCollectTimes(Integer userId, Integer questionId) {
        HisAnswer hisAnswer = D.hisAnswerMapper().selectByUserIdAndQuestionId(userId, questionId);
        if (null == hisAnswer) {
            HisAnswer answer = new HisAnswer();
            answer.setUserId(userId);
            answer.setQuestionId(questionId);
            answer.setCollectTimes(1);
            answer.setAnswerTimes(1);
            answer.setStyBmTimes(0);
            answer.setStyTimes(0);
            answer.setCreateTime(new Date());
            answer.setDeleted(1);
            try {
                D.hisAnswerMapper().insertSelective(answer) ;
            }catch (Exception e){
                e.printStackTrace();
            }
            return true;
        } else {
            return D.hisAnswerMapper().addCollectTimes(userId, questionId) == 1;
        }
    }

    /**
     * 收藏题库中的学习次数累计
     *
     * @param userId
     * @param questionId
     * @return
     */
    public boolean addTimesForBookmark(int userId, Integer questionId) {
        return D.hisAnswerMapper().addTimesForBookmark(userId, questionId) == 1;
    }

    /**
     * 错题题库中的学习次数累计
     *
     * @param userId
     * @param questionId
     * @return
     */
    public boolean addTimesForError(int userId, Integer questionId) {
        return D.hisAnswerMapper().addTimesForError(userId, questionId) == 1;
    }


    /**
     * 保存用户查看题次数
     * <pre>
     *     已经存在，更新记录
     *     不存在，插入新的记录
     * </pre>
     *
     * @param userId
     * @param questionId
     */

    public void addEffectAnswerTimes2(Integer userId, Integer questionId) {
        HisAnswer hisAnswer = S.lpQuestionService().selectLpAnswerByUserIdAndQuestionId(userId, questionId);
        if (null != hisAnswer) {
            saveEffectAnswerTimes(userId, questionId);
        } else {
            HisAnswer answer = new HisAnswer();
            answer.setUserId(userId);
            answer.setQuestionId(questionId);
            answer.setEffectAnswerTimes(1);
            answer.setCreateTime(new Date());
            answer.setDeleted(1);
            S.lpQuestionService().saveUserAnswer(answer);
        }
    }

    /**
     * 保存用户查看题次数
     * <pre>
     *     已经存在，更新记录
     *     不存在，插入新的记录
     * </pre>
     *
     * @param userId
     * @param questionId
     */

    public void addEffectAnswerTimes(Integer userId, Integer questionId) {
        HisAnswer hisAnswer = S.lpQuestionService().selectLpAnswerByUserIdAndQuestionId(userId, questionId);
        if (null != hisAnswer) {
            saveEffectAnswerTimes(userId, questionId);
        } else {
            HisAnswer answer = new HisAnswer();
            answer.setUserId(userId);
            answer.setQuestionId(questionId);
            answer.setEffectAnswerTimes(1);
            answer.setCreateTime(new Date());
            answer.setDeleted(1);
            S.lpQuestionService().saveUserAnswer(answer);
        }
    }

    /**
     * 保存用户查看题次数
     *
     * @param userId
     * @param questionId
     */
    @Transaction(jdbc = TrancationType.OPEN)
    private void saveEffectAnswerTimes(Integer userId, Integer questionId) {
        D.hisAnswerMapper().addEffectAnswerTimes(userId, questionId);
    }

    /**
     * pc端模拟测试保存用户的有效的答题数
     * <pre>
     *     记录有效答题数时，已经证明此题学习时间超过5秒
     *     因为此题学习时间超过5秒，已经记录此题的styTimes+1了，但是styTimes不包括有效的答题次数
     *     所以有效答题次数+1的同时，styTimes此时-1
     * </pre>
     *
     * @param questionId
     * @param userId
     */
    public void addEffectAnswerTimesForTest(Integer questionId, int userId) {
//        log.error("hzcerror:addEffectAnswerTimes for test and subtract styTimes");
        S.lpQuestionService().subtractStyTimes(userId, questionId);
        saveEffectAnswerTimes(userId, questionId);
        addAnswerTimes(userId, questionId);
    }
}
