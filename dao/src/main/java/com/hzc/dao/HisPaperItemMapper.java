package com.hzc.dao;

import com.hzc.model.HisPaperItem;
import com.hzc.vo.AnswerCardVO;
import com.hzc.vo.HisPaperItemVO;
import com.hzc.vo.QuestionVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface HisPaperItemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(HisPaperItem record);

    int insertSelective(HisPaperItem record);

    HisPaperItem selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HisPaperItem record);

    int updateByPrimaryKey(HisPaperItem record);

    /**
     * 保存his_paper_item
     * <pre>
     *     根据paperId和所有的试卷试题
     *     保存paperId，seq（questionId），create_time，categoryCode，type
     * </pre>
     *
     * @param paperId
     * @param list
     * @param createTime
     */
    void insertAllQuestionForOnePaper(@Param("paperId") Integer paperId, @Param("list") List<AnswerCardVO> list, @Param("createTime") Date createTime);

    /**
     * 返回某个试卷试题
     * <pre>
     *     根据paperId获取该试卷的所有试题
     *     包括：questionId，categoryCode，type，answer
     * </pre>
     *
     * @param paperId
     * @return
     */
    List<AnswerCardVO> selectByPaperId(Integer paperId);

    /**
     * 返回用户试卷试题信息
     * <pre>
     *     根据用户userId和questionId获取试题
     *     包括：试题（不包括选项），用户作答信息
     * </pre>
     *
     * @param userId
     * @param questionId
     * @return
     */
    QuestionVO selectQuestionByUserIdAndQuestionId(@Param("userId") int userId, @Param("questionId") int questionId);

    /**
     * 返回paper_item
     * <pre>
     *     根据questionId和paperId查询用户答题信息
     * </pre>
     *
     * @param questionId
     * @param paperId
     */
    HisPaperItem selectByQuestionIdAndPaperId(@Param("questionId") Integer questionId, @Param("paperId") Integer paperId);

    /**
     * 返回用户考试成绩（分数）
     * <pre>
     *     根据paperId返回该试卷的总成绩
     * </pre>
     *
     * @param paperId
     * @return
     */
    Integer calculateScore(Integer paperId);

    /**
     * 返回一张试卷中正确的试题列表
     *
     * @param paperId
     * @return
     */
    List<HisPaperItem> selectCorrectQuestions(Integer paperId);

    /**
     * 分页查询所有试题
     *
     * @param currentNum
     * @param pageSize
     * @return
     */

    List<HisPaperItemVO> selectAllQuestionForLimit(@Param("currentNum") Integer currentNum, @Param("pageSize") Integer pageSize,@Param("paperId") Integer paperId);

}