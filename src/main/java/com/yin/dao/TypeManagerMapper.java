package com.yin.dao;

import com.yin.model.TypeManager;

import java.util.List;

public interface TypeManagerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TypeManager record);

    int insertSelective(TypeManager record);

    TypeManager selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TypeManager record);

    int updateByPrimaryKey(TypeManager record);

    //自己写mapper
    List<TypeManager> getAllType();
}