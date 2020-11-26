package com.hzc.dao;

import com.hzc.model.PufaImport;

import java.util.List;

public interface PufaImportMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PufaImport record);

    int insertSelective(PufaImport record);

    PufaImport selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PufaImport record);

    int updateByPrimaryKey(PufaImport record);

    List<PufaImport> selectAll();

}