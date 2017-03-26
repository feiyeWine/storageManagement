package com.yin.controller;

import com.alibaba.fastjson.JSONObject;
import com.yin.dao.InterGoodsMapper;
import com.yin.dao.OuterGoodsMapper;
import com.yin.dao.ReturnGoodsMapper;
import com.yin.model.InterGoods;
import com.yin.model.ReturnGoods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by YR on 2016/5/16.
 */

@Controller
public class StorageController {
    @Autowired
    private InterGoodsMapper interGoodsMapper;
    @Autowired
    private OuterGoodsMapper outerGoodsMapper;
    @Autowired
    private ReturnGoodsMapper returnGoodsMapper;

    /**
     * 库存查询
     * @param modelAndView
     * @return
     */
    @RequestMapping("/findStorage")
    public ModelAndView findStorage(ModelAndView modelAndView){
        try{

            List<InterGoods> interGoodsList = interGoodsMapper.findStorage();
            modelAndView.addObject("goods",interGoodsList);
            modelAndView.setViewName("findGoods");
        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }

    /**
     * 警报管理
     */
    @RequestMapping("/warning")
    public ModelAndView warning(ModelAndView modelAndView){
        try{
           List<InterGoods> goodsList = interGoodsMapper.warning();
            modelAndView.addObject("goods",goodsList);
            modelAndView.setViewName("warning");
        }catch (Exception e){
            e.printStackTrace();
        }

        return modelAndView;
    }

    /**
     * 退货管理
     */
    @RequestMapping("/returnGoods")
    public ModelAndView returnGoods(ModelAndView modelAndView){
        try {
            List<ReturnGoods> goodsList =  returnGoodsMapper.returnGoods();
            modelAndView.addObject("goods",goodsList);
            modelAndView.setViewName("returnGoods");
        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }

    /**
     * * 退货
     * @param id
     * @return
     */
    @RequestMapping("/returning")
    public @ResponseBody JSONObject returning(String id){
        JSONObject json = new JSONObject();
        try{
            returnGoodsMapper.deleteByPrimaryKey(Integer.parseInt(id));

            json.put("status","success");

        }catch (Exception e){
            json.put("status","fail");
            e.printStackTrace();
        }
        return json;
    }

    /**
     * 库存盘点
     */
    @RequestMapping("/storageCheck")
    public ModelAndView storageCheck(ModelAndView modelAndView){

        try{
            List<InterGoods> goodsList = interGoodsMapper.storageCheck();
            modelAndView.addObject("goods",goodsList);
            modelAndView.setViewName("storageCheck");
        }catch (Exception e){
            e.printStackTrace();
        }
        return modelAndView;
    }
}
