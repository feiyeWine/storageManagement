package com.yin.dao;

import com.yin.model.ReturnGoods;

import java.util.List;

public interface ReturnGoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ReturnGoods record);

    int insertSelective(ReturnGoods record);

    ReturnGoods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ReturnGoods record);

    int updateByPrimaryKey(ReturnGoods record);

    /**
     *退货管理
     */
    List<ReturnGoods> returnGoods();
}