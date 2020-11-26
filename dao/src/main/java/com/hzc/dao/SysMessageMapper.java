package com.hzc.dao;

import com.hzc.model.SysMessage;

public interface SysMessageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysMessage record);

    int insertSelective(SysMessage record);

    SysMessage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysMessage record);

    int updateByPrimaryKey(SysMessage record);
}