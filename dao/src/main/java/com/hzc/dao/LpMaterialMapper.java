package com.hzc.dao;

import com.hzc.model.LpMaterial;

public interface LpMaterialMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LpMaterial record);

    int insertSelective(LpMaterial record);

    LpMaterial selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LpMaterial record);

    int updateByPrimaryKey(LpMaterial record);
}