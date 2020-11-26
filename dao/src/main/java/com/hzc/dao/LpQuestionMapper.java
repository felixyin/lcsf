package com.hzc.dao;

import com.hzc.model.LpQuestion;
import com.hzc.vo.AnswerCardVO;
import com.hzc.vo.QuestionVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface LpQuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LpQuestion record);

    int insertSelective(LpQuestion record);

    LpQuestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LpQuestion record);

    int updateByPrimaryKey(LpQuestion record);

    /**
     * 根据userId
     * 获取学习页答题卡内容
     * 包括：questionId，答题次数，错误次数，试题类型
     *
     * @param userId
     * @return
     */
    List<AnswerCardVO> selectForAnswerCardList(@Param("userId") int userId);

    /**
     * 大数据分析用户的错题次数，将做错次数较多的题目优先考试
     *
     * @param userId
     * @return
     */
    List<AnswerCardVO> selectCardListIntelligent(@Param("userId") int userId);


    /**
     * 根据questionId查询用户的试题
     * <pre>
     *     包括：questionId，答题次数，错误次数，试题类型
     * </pre>
     *
     * @param questionId
     * @param userId
     * @return
     */
    QuestionVO selectByPrimaryKeyForUser(@Param("questionId") int questionId, @Param("userId") int userId);

    /**
     * 分页查询所有试题
     *
     * @param currentNum
     * @param pageSize
     * @return
     */
    List<QuestionVO> selectAllQuestionForLimit(@Param("currentNum") Integer currentNum, @Param("pageSize") Integer pageSize);

    /**
     * 根据试题类型，获取试题
     *
     * @param type
     * @return
     */
    List<AnswerCardVO> selectByType(@Param("userId") int userId, @Param("type") String type);

    /**
     * 根据试题类型，获取试题 优化版本
     *
     * @param type
     * @return
     */
    List<Map> selectByTypeOptimize(@Param("userId") int userId, @Param("type") String type);


    List<LpQuestion> selectGroupQuestions(@Param("question") LpQuestion question);

    int selectMaxseq(@Param("type") String type);
}