package com.yin.controller;

import com.alibaba.fastjson.JSONObject;
import com.yin.dao.ManagerMapper;
import com.yin.model.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

/**
 * Created by YR on 2016/5/16.
 */

@Controller
public class ManagerController {
    @Autowired
    private ManagerMapper managerMapper;

    @RequestMapping("/manager")
    public ModelAndView manager(ModelAndView modelAndView,String name){

        try{
            Manager manager = managerMapper.selectByName(name);
            modelAndView.addObject(manager);
            modelAndView.addObject("manager",manager);
            modelAndView.setViewName("manager");
        }catch (Exception e){
            e.printStackTrace();
        }

        return modelAndView;
    }

    @RequestMapping("/modifyManager")
    public @ResponseBody JSONObject modifyManager(String id,String name,String phone,String email,String password){
        JSONObject jsonObject = new JSONObject();
        Manager manager = new Manager();
        try {
            manager.setId(Integer.parseInt(id));
            manager.setName(name);
            manager.setPhone(phone);
            manager.setEmail(email);
            manager.setDatetime(new Date());
            if(!password.equals("")&&password!=null){
                manager.setPassword(password);
            }
            managerMapper.updateByPrimaryKeySelective(manager);
            jsonObject.put("status","success");
        }catch (Exception e){
            e.printStackTrace();
            jsonObject.put("status","fail");
        }

        return jsonObject;
    }
}
