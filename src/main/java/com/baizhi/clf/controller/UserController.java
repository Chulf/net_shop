package com.baizhi.clf.controller;

import com.baizhi.clf.entity.SuserEntity;
import com.baizhi.clf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/3/27.
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(String username, String password, HttpServletResponse response){
        String result = userService.login(username, password);

        if(result.equals("success")){
            //登录成功设置免登陆
            //创建用户cookie
            Cookie userCookie = new Cookie("userCookie",username);

            //设置cookie存活时间为一年
            userCookie.setMaxAge(3600*24*365);

            userCookie.setPath("/");

            response.addCookie(userCookie);
        }
        return result;
    }@RequestMapping("/checkUsername")
    public String checkUsername(String username){

        String result = userService.checkUser(username);
        return result;
    }
    @RequestMapping("/register")
    public String register(SuserEntity suserEntity,HttpServletResponse response){

        String result = userService.regist(suserEntity);

        if(result.equals("success")){
            //登录成功设置免登陆
            //创建用户cookie
            Cookie userCookie = new Cookie("userCookie",suserEntity.getUsername());

            //设置cookie存活时间为一年
            userCookie.setMaxAge(3600*24*365);

            userCookie.setPath("/");

            response.addCookie(userCookie);
        }
        return result;
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session,HttpServletResponse response){
        session.setAttribute("user",null);

        //删除用户cookie
        Cookie userCookie = new Cookie("userCookie", null);

        userCookie.setPath("/");

        userCookie.setMaxAge(0);

        response.addCookie(userCookie);
        return "ok";
    }
}
