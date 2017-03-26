package com.yin.dao;

import com.yin.model.InterGoods;

import java.util.List;

public interface InterGoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(InterGoods record);

    int insertSelective(InterGoods record);

    InterGoods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(InterGoods record);

    int updateByPrimaryKey(InterGoods record);

    //自己写mapper
    /**
     * 查询库存
     */
    List<InterGoods> findStorage();
    /**
     * 警告管理
     */
    List<InterGoods> warning();

    /**
     * 获得库存
     * @return
     */
    List<InterGoods> getStorage();

    /**
     * 库存盘点
     */
    List<InterGoods>storageCheck();
}