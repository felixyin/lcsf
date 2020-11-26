package com.hzc.dao;

import com.hzc.model.LpResolution;

public interface LpResolutionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LpResolution record);

    int insertSelective(LpResolution record);

    LpResolution selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LpResolution record);

    int updateByPrimaryKey(LpResolution record);
}