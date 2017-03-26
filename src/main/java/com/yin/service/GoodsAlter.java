package com.yin.service;

import com.yin.model.Goods;
import com.yin.model.InterGoods;
import com.yin.model.OuterGoods;
import com.yin.model.ReturnGoods;

import java.util.Date;

/**
 * Created by YR on 2016/5/16.
 */
public class GoodsAlter {

    /**
     * 入库
     * @param goods
     * @return
     */
    public static InterGoods GoodsToInter(Goods goods,int amount){
        InterGoods interGoods = new InterGoods();

        interGoods.setGoodId(goods.getGoodId());
        interGoods.setGoodType(goods.getGoodType());
        interGoods.setGoodName(goods.getGoodName());
        interGoods.setAmount(amount);
        interGoods.setDescription(goods.getDescription());
        interGoods.setPrice(goods.getPrice());
        interGoods.setIntime(new Date());


        return interGoods;
    }

    /**
     * 出库
     * @param interGoods
     * @return
     */
    public static OuterGoods GoodsToOuter(InterGoods interGoods,int amount){
        OuterGoods outerGoods = new OuterGoods();

        outerGoods.setGoodId(interGoods.getGoodId());
        outerGoods.setGoodName(interGoods.getGoodName());
        outerGoods.setAmount(amount);
        outerGoods.setPrice(interGoods.getPrice());
        outerGoods.setGoodType(interGoods.getGoodType());
        outerGoods.setDescription(interGoods.getDescription());
        outerGoods.setOutTime(new Date());

        return outerGoods;
    }

    /**
     * 退货
     * @param goods
     * @return
     */
    public static ReturnGoods GoodsToReturn(Goods goods,int amount){
        ReturnGoods returnGoods = new ReturnGoods();

        returnGoods.setGoodId(goods.getGoodId());
        returnGoods.setGoodType(goods.getGoodType());
        returnGoods.setGoodName(goods.getGoodName());
        returnGoods.setAmout(amount);
        returnGoods.setDescription(goods.getDescription());
        returnGoods.setPrice(goods.getPrice());
        returnGoods.setChecktime(new Date());
        returnGoods.setStatus("未退货");

        return returnGoods;
    }
}
