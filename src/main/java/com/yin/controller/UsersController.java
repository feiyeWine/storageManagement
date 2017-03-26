package com.yin.controller;

import com.alibaba.fastjson.JSONObject;
import com.yin.dao.UserMapper;
import com.yin.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * Created by YR on 2016/5/15.
 */

@Controller
public class UsersController {

    @Autowired
    private UserMapper userMapper;

    /**
     * 获得所有仓管员信息
     * @param modelAndView
     * @return
     */
    @RequestMapping("/getUsers")
    public ModelAndView getUsers(ModelAndView modelAndView){

        try{
           List<User> users = userMapper.getUsers();
            for(User user:users){
                user.getName();
                user.getPhone();
            }
            if(users!=null) {
                modelAndView.addObject("users", users);
                modelAndView.setViewName("users");
            }
        }catch(Exception e){
            e.printStackTrace();
        }

        return modelAndView;
    }

    @RequestMapping("/addUser")
    public @ResponseBody
    JSONObject addUser(User user){
        JSONObject jsonObject = new JSONObject();
        try{

            user.setDatetime(new Date());
            userMapper.insertSelective(user);

            jsonObject.put("status","success");
        }catch (Exception e){
            jsonObject.put("status","fail");
            e.printStackTrace();
        }

        return jsonObject;
    }

    @RequestMapping("/modifyUser")
    public @ResponseBody JSONObject modifyUser(String id,String name,String phone,String email,String password){
        JSONObject jsonObject = new JSONObject();
        User user = new User();
        try {
            user.setId(Integer.parseInt(id));
            user.setName(name);
            user.setPhone(phone);
            user.setEmail(email);
            user.setDatetime(new Date());
            if(!password.equals("")&&password!=null){
                user.setPassword(password);
            }
            userMapper.updateByPrimaryKeySelective(user);
            jsonObject.put("status","success");
        }catch (Exception e){
            e.printStackTrace();
            jsonObject.put("status","fail");
        }

        return jsonObject;
    }

    @RequestMapping("/deleteUser")
    public @ResponseBody JSONObject deleteUser(String id){
        JSONObject jsonObject = new JSONObject();
        try{
            userMapper.deleteByPrimaryKey(Integer.parseInt(id));
            jsonObject.put("status","success");
        }catch (Exception e){
            jsonObject.put("status","fail");
            e.printStackTrace();
        }

        return jsonObject;
    }
}
