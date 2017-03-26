package com.yin.dao;

import com.yin.model.OuterGoods;

import java.util.List;

public interface OuterGoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OuterGoods record);

    int insertSelective(OuterGoods record);

    OuterGoods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OuterGoods record);

    int updateByPrimaryKey(OuterGoods record);

    //自己写mapper
    List<OuterGoods> getOuterRecorder();
}