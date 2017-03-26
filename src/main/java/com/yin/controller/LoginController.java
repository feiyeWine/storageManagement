package com.yin.controller;

import com.yin.dao.ManagerMapper;
import com.yin.dao.UserMapper;
import com.yin.model.Manager;
import com.yin.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * Created by YR on 2016/5/15.
 */

@Controller
public class LoginController {
    @Autowired
    private ManagerMapper managerMapper;
    @Autowired
    private UserMapper userMapper;

    @RequestMapping("/login.do")
    public String login(HttpSession session,String Sex, String id, String password){
        try{
        if(!id.trim().equals("")&&!password.trim().equals("")){
            if(Sex.equals("管理员")){
                Manager manager = managerMapper.selectByName(id);
                if(manager!=null&&manager.getPassword().equals(password)){
                    session.setAttribute("manager", id);
                    return "index";
                }
            }else if(Sex.equals("仓管员")){
                User user = userMapper.selectByName(id);
                if(user!=null&&user.getPassword().equals(password)){
                    session.setAttribute("manager", id);
                    return "storageUser";
                }
            }
        }
        }catch (Exception e){
            e.printStackTrace();
            return "login";
        }
        return "login";
    }
}
