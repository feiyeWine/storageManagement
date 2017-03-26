package com.yin.controller;

import com.alibaba.fastjson.JSONObject;
import com.yin.dao.*;
import com.yin.model.*;
import com.yin.service.GoodsAlter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * Created by YR on 2016/5/16.
 */

@Controller
public class GoodsController {
    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private TypeManagerMapper typeManagerMapper;
    @Autowired
    private InterGoodsMapper interGoodsMapper;
    @Autowired
    private ReturnGoodsMapper returnGoodsMapper;
    @Autowired
    private OuterGoodsMapper outerGoodsMapper;

    /**
     * 获得所有商品
     * @param modelAndView
     * @return
     */
    @RequestMapping("/getGoods")
    public ModelAndView
     getGoods(ModelAndView modelAndView){
        JSONObject jsonObject = new JSONObject();

        try{
            List<Goods> goods = goodsMapper.getGoods();
            modelAndView.addObject("goods",goods);
            modelAndView.setViewName("goods");

        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }

    /**
     * 添加商品
     * @param goodId
     * @param goodName
     * @param goodType
     * @param amount
     * @param price
     * @param description
     * @return
     */
    @RequestMapping("addGood")
    public @ResponseBody JSONObject addGood(String goodId,String goodName,String goodType,String amount,String price,String description){
        JSONObject jsonObject = new JSONObject();
        try{
            Goods goods = new Goods();
            goods.setGoodId(goodId);
            goods.setGoodName(goodName);
            goods.setGoodType(goodType);
            goods.setAmount(Integer.parseInt(amount));
            goods.setPrice(Long.parseLong(price));
            goods.setDescription(description);
            goods.setStatus("未检验");
            goods.setDatetime(new Date());

            goodsMapper.insertSelective(goods);
            jsonObject.put("status","success");

        }catch (Exception e){
            jsonObject.put("status","fail");
            e.printStackTrace();
        }

        return jsonObject;
    }

    @RequestMapping("/getGoodType")
    public ModelAndView getGoodType(ModelAndView modelAndView){
        try{
            List<TypeManager> typeManagers = typeManagerMapper.getAllType();
            if(typeManagers!=null){
                modelAndView.addObject("goodsType",typeManagers);
                modelAndView.setViewName("addGoods");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }

    @Transactional(rollbackFor=Exception.class)
    @RequestMapping("/checkedGoods")
    public @ResponseBody JSONObject checkedGoods(String id,String totalAmount,String checked){
        JSONObject jsonObject = new JSONObject();

        try{
            int idd = Integer.parseInt(id);
            int goodChecked = Integer.parseInt(checked);
            int total = Integer.parseInt(totalAmount);
            int unchecked = total - goodChecked;

            Goods goods = new Goods();

            //修改商品数量
            goods.setId(idd);
            goods.setAmount(0);
            goods.setStatus("已检验");
            goodsMapper.updateByPrimaryKeySelective(goods);


            Goods good = goodsMapper.selectByPrimaryKey(idd);
            //入库
            InterGoods interGoods = GoodsAlter.GoodsToInter(good,goodChecked);
            interGoodsMapper.insertSelective(interGoods);

            //退货
            if(unchecked>0) {
                ReturnGoods returnGoods = GoodsAlter.GoodsToReturn(good, unchecked);
                returnGoodsMapper.insertSelective(returnGoods);
            }
            jsonObject.put("status","success");

        }catch (Exception e){
            jsonObject.put("status","fail");
            e.printStackTrace();
        }

        return jsonObject;
    }

    /**
     * 修改商品
     */
    @RequestMapping("/modifyGood")
    public @ResponseBody JSONObject modifyGood(String id,String goodId,String goodName,
                                               String goodType,String amount,String price,String description){
        JSONObject jsonObject = new JSONObject();
        try {
            Goods goods = new Goods();
            goods.setId(Integer.parseInt(id));
            goods.setGoodId(goodId);
            goods.setGoodName(goodName);
            goods.setGoodType(goodType);
            goods.setAmount(Integer.parseInt(amount));
            goods.setPrice(Long.parseLong(price));
            goods.setDescription(description);

            goodsMapper.updateByPrimaryKeySelective(goods);
            jsonObject.put("status","success");
        }catch (Exception e){
//            jsonObject.put("status","fail");
            e.printStackTrace();
        }

        return jsonObject;
    }
    /**
     * 删除商品信息
     */
    @RequestMapping("/deleteGood")
    public @ResponseBody JSONObject deleteGood(String id){
        JSONObject jsonObject = new JSONObject();
        try {
            goodsMapper.deleteByPrimaryKey(Integer.parseInt(id));
            jsonObject.put("status","success");
        }catch (Exception e){
            jsonObject.put("status","fial");
            e.printStackTrace();
        }

        return jsonObject;
    }
    /**
     * 获取商品信息
     */
    @RequestMapping("/getGoodsInfo")
    public ModelAndView
    getGoodsInfo(ModelAndView modelAndView){
        JSONObject jsonObject = new JSONObject();

        try{
            List<Goods> goods = goodsMapper.getGoods();
            List<TypeManager>type = typeManagerMapper.getAllType();

            modelAndView.addObject("goods",goods);
            modelAndView.addObject("goodsType",type);
            modelAndView.setViewName("goodsManager");

        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }

    /**
     *
     */
    @RequestMapping("/outerGoods")
    public ModelAndView outerGoods(ModelAndView modelAndView){

        try {
            List<InterGoods> goodsList = interGoodsMapper.getStorage();
            modelAndView.addObject("goods",goodsList);
            modelAndView.setViewName("outerStorage");

        }catch (Exception e){
            e.printStackTrace();
        }

        return modelAndView;
    }
    /**
     * 出库管理
     */
    @RequestMapping("/outerStorage")
      public @ResponseBody JSONObject interSotrage(String id,String totalAmount,String checked){
        JSONObject jsonObject = new JSONObject();

        try{
            int idd = Integer.parseInt(id);
            int goodChecked = Integer.parseInt(checked);
            int total = Integer.parseInt(totalAmount);
            int unchecked = total - goodChecked;

            InterGoods goods = new InterGoods();

            //修改商品数量
            goods.setId(idd);
            goods.setAmount(unchecked);
            interGoodsMapper.updateByPrimaryKeySelective(goods);


            InterGoods good = interGoodsMapper.selectByPrimaryKey(idd);
            //出库
            OuterGoods outerGoods = GoodsAlter.GoodsToOuter(good,goodChecked);
            outerGoodsMapper.insertSelective(outerGoods);


            jsonObject.put("status","success");

        }catch (Exception e){
            jsonObject.put("status","fail");
            e.printStackTrace();
        }

        return jsonObject;
      }
    /**
     * 出库记录
     */
    @RequestMapping("/recorderOuter")
    public ModelAndView recorderOuter(ModelAndView modelAndView){

        try {
            List<OuterGoods> goodsList = outerGoodsMapper.getOuterRecorder();
            modelAndView.addObject("goods",goodsList);
            modelAndView.setViewName("recorderOuter");
        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }
}
