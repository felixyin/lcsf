package com.hzc.dao;

import com.hzc.model.LpCard;
import com.hzc.vo.UserGradeVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface LpCardMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(LpCard record);

    int insertSelective(LpCard record);

    LpCard selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LpCard record);

    int updateByPrimaryKey(LpCard record);

    /**
     * 保存准考证
     * <pre>
     *     说明：
     *     将产生的准考证保存到数据库（新建）
     * </pre>
     *
     * @param list 准考证
     */
    void insertCards(List<LpCard> list);

    List<LpCard> searchList(@Param("card") LpCard card);

    List<UserGradeVo> searchMapList(@Param("card") LpCard card);

    /**
     * 返回准考证信息
     * <pre>
     *     根据userId查询该用户的答题卡
     * </pre>
     *
     * @param userId
     * @return
     */
    LpCard selectByUserId(Integer userId);
}