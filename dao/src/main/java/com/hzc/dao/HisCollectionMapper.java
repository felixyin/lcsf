package com.hzc.dao;

import com.hzc.model.HisCollection;
import com.hzc.vo.AnswerCardVO;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface HisCollectionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(HisCollection record);

    int insertSelective(HisCollection record);

    HisCollection selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(HisCollection record);

    int updateByPrimaryKey(HisCollection record);

    /**
     * 根据userId、questionId、type删除收藏、错题
     *
     * @param collection
     */
    int deleteByUserIdAndQuestionId(HisCollection collection);

    /**
     * 查询用户收藏、错题
     *
     * @param questionId
     * @param userId
     * @param type       ：类型，1、收藏，2、错题
     * @return
     */
    HisCollection selectByQIdUIdAndType(@Param("questionId") Integer questionId, @Param("userId") int userId, @Param("type") int type);
//    int deleteByUserIdAndQuestionId(LpCollection collection);

    List<HisCollection> selectListGtCurrDate(@Param("userId") Integer userId, @Param("updateTime") Date updateTime);

    List<Integer> selectAllCollectQid(Integer id);

    List<HisCollection> selectAllByUserIdAndType(HisCollection hisCollection);

    /**
     * 根据userId，type获取用户收藏题或错题内容
     * 返回的answerCardVo
     * 生成答题卡
     *
     * @param userId
     * @param type
     * @return
     */
    List<AnswerCardVO> selectCollectionsByUserIdForCard(@Param("userId") int userId, @Param("type") int type);

    List<AnswerCardVO> selectErrorCollections(int userId);

    /**
     * 根据userId清空用户的错题本、收藏本
     *  @param userId
     * @param type ：1、收藏本，2、错题本
     * @param categoryCode
     */
    int deleteByUserIdAndType(@Param("userId") Integer userId, @Param("type") Integer type, @Param("categoryCode") String categoryCode);

    /**
     * 根据userId和type获取用户的错题、收藏题
     * 获取的结果用于打印
     *
     * @param userId
     * @param type：1、收藏题，2、错题
     * @return
     */
    List<AnswerCardVO> selectCollectionsByUserIdForPrint(@Param("userId") int userId, @Param("type") int type);
}