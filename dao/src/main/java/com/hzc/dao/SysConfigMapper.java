package com.hzc.dao;

import com.hzc.model.SysConfig;

import java.util.List;

public interface SysConfigMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysConfig record);

    int insertSelective(SysConfig record);

    SysConfig selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysConfig record);

    int updateByPrimaryKey(SysConfig record);

    /**
     * 查询系统设置
     * <pre>
     *   说明：
     *      包括考试开始时间，考试结束时间，报名开始时间，报名结束时间
     *      打印准考证开始时间，打印准考证结束时间
     *      config只有一条数据
     * </pre>
     *
     * @return
     */
    SysConfig select();

    /**
     * 返回考试配置列表
     *
     * @return
     */
    List<SysConfig> selectConfigList();
}