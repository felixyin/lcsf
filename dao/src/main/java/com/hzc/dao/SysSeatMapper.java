package com.hzc.dao;

import com.hzc.model.SysSeat;
import com.hzc.vo.SysSeatVO;

import java.util.List;

public interface SysSeatMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysSeat record);

    int insertSelective(SysSeat record);

    SysSeat selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysSeat record);

    int updateByPrimaryKey(SysSeat record);

    /**
     * 查询坐位信息
     * 说明：
     * 查询已经生成的坐位信息；
     * 该坐位信息包括没有用户的坐位和已经有用户的坐位
     *
     * @return List<SysSeat>
     */
    List<SysSeat> select();

    /**
     * 查询空座位
     * 说明：
     * 查询还没有分配考试用户的空座位
     * 空座位信息包括，考试时间，考场号
     *
     * @return List<SysSeatVO>
     */
    List<SysSeatVO> selectEmpty();


    /**
     * 生成所有的空坐位
     * <pre>
     *     根据所有的考场场次的信息（考场号，座位数），生成所有的空座位
     * </pre>
     *
     * @param list
     */
    void insertAllSeats(List<SysSeat> list);

    /**
     * 为空座位添加考试人
     *
     * @param list
     */
    void updateEmptySeat(List<SysSeatVO> list);
}