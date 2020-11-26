package com.hzc.dao;

import com.hzc.model.GenExamRepo;

public interface GenExamRepoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(GenExamRepo record);

    int insertSelective(GenExamRepo record);

    GenExamRepo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(GenExamRepo record);

    int updateByPrimaryKey(GenExamRepo record);

    int clear();
}