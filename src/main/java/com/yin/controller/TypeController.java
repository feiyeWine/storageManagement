package com.yin.controller;

import com.alibaba.fastjson.JSONObject;
import com.yin.dao.TypeManagerMapper;
import com.yin.model.TypeManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * Created by YR on 2016/5/16.
 */
@Controller
public class TypeController {
    @Autowired
    private TypeManagerMapper mapper;

    /**
     * 查询类别
     * @param modelAndView
     * @return
     */
    @RequestMapping("/getType")
    public ModelAndView getType(ModelAndView modelAndView){

        try{
            List<TypeManager> type = mapper.getAllType();
            modelAndView.addObject("types",type);
            modelAndView.setViewName("goodType");
        }catch (Exception e){

        }
        return modelAndView;
    }

    /**
     * 添加
     * @param type
     * @return
     */
    @RequestMapping("/addType")
    public @ResponseBody
    JSONObject addType(String type){
        JSONObject jsonObject = new JSONObject();
        try {
            TypeManager typeManager = new TypeManager();
            typeManager.setName(type);
            typeManager.setDatetime(new Date());
            mapper.insertSelective(typeManager);
            jsonObject.put("status","success");
        }catch (Exception e){
            jsonObject.put("status","fail");
        }
        return jsonObject;
    }

    /**
     * 删除
     */
    @RequestMapping("/deleteType")
    public @ResponseBody
    JSONObject deleteType(String id){
        JSONObject jsonObject = new JSONObject();
        try {
            mapper.deleteByPrimaryKey(Integer.parseInt(id));
            jsonObject.put("status","success");
        }catch (Exception e){
            jsonObject.put("status","fail");
        }
        return jsonObject;
    }
}
