package com.hzc.dao;

import com.hzc.model.HisAnswer;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface HisAnswerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(HisAnswer record);

    int insertSelective(HisAnswer record);

    HisAnswer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HisAnswer record);

    int updateByPrimaryKey(HisAnswer record);

    /**
     * 更新用户的错题次数
     *
     * @param answer
     */
    void updateAnswerInfoByUserIdAndQuestionId(HisAnswer answer);

    /**
     * 根据userId 和 questionId 获取用户的答题记录
     *
     * @param userId
     * @param questionId
     * @return
     */
    HisAnswer selectByUserIdAndQuestionId(@Param("userId") int userId, @Param("questionId") int questionId);

    /**
     * @param userId
     * @return
     */
    Map selectTimesByUserId(@Param("userId") int userId);

    /**
     * 题目的回答次数加1
     *
     * @param userId
     * @param questionId
     */
    int addAnserTimes(@Param("userId") Integer userId, @Param("questionId") Integer questionId);

    /**
     * 题目的浏览次数加1
     */
    int addStudyTimes(@Param("userId") Integer userId, @Param("questionId") Integer questionId);

    /**
     * 题目的回答错误次数加1
     *
     * @param userId
     * @param questionId
     */
    int addCollectTimes(@Param("userId") Integer userId, @Param("questionId") Integer questionId);

    /**
     * 累加收藏夹中学习的次数
     *
     * @param userId
     * @param questionId
     * @return
     */
    int addTimesForBookmark(@Param("userId") Integer userId, @Param("questionId") Integer questionId);

    /**
     * 累加错题库中学习的次数
     *
     * @param userId
     * @param questionId
     * @return
     */
    int addTimesForError(@Param("userId") Integer userId, @Param("questionId") Integer questionId);

    /**
     * 根据userId和questionId 更新用户做题次数
     *
     * @param answer
     * @return
     */
    int updateAnswerTime(HisAnswer answer);

    /**
     * 保存用户查看错题次数或收藏题次数
     *
     * @param answer
     */
    void updateBMCLTTimes(HisAnswer answer);

    /**
     * 查看次数-1
     *
     * @param userId
     * @param questionId
     */
    void subtractStyTimes(@Param("userId") Integer userId, @Param("questionId") Integer questionId);

    /**
     * 保存用户查看题次数
     *
     * @param userId
     * @param questionId
     */
    void addEffectAnswerTimes(@Param("userId") int userId, @Param("questionId") Integer questionId);

    /**
     * 查询 考试用的题，用于插入考试题库
     *
     * @return
     */
    Map selectExamQuestion();

    /**
     * 生成考试题库
     *
     * @param panDuan 判断题数量
     * @param danXuan 单选题数量
     * @param duoXuan 多选题数量
     *
     * @return
     */
    int genExamRepo(@Param("panDuan") int panDuan, @Param("danXuan") int danXuan, @Param("duoXuan") int duoXuan);
}