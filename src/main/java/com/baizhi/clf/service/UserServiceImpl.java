package com.baizhi.clf.service;

import com.baizhi.clf.dao.AdminDAO;
import com.baizhi.clf.dao.UserDAO;
import com.baizhi.clf.entity.Admin;
import com.baizhi.clf.entity.SuserEntity;
import com.baizhi.clf.util.PasswordUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.UUID;

/**
 * Created by Administrator on 2018/3/27.
 */
@Service
@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private AdminDAO adminDAO;

    @Override
    public String login(String username, String password) {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        HttpSession session = request.getSession();

        Admin admin = (Admin) session.getAttribute("adminMsg");

        if (admin.getUsername().equals("SuperAdmin")) {
            //如果访问的是仓库 超级管理员的店铺 必须以管理员身份登录
            Admin user = adminDAO.selectAdminByUsername(username);

            if (user != null) {
                if (user.getPassword().equals(PasswordUtil.encrypt(user.getUsername(),password,PasswordUtil.getStaticSalt()))){

                    session.setAttribute("user", user);
                    return "success";
                }
            }

            return "error";
        }

        //通过用户名获取用户对象
        SuserEntity suserEntity1 = userDAO.selectUserByUsername(username);

        if (suserEntity1 != null) {
            if (suserEntity1.getPassword().equals(password)) {
                session.setAttribute("user", suserEntity1);
                return "success";
            }
        }
        return "error";
    }

    @Override
    public String checkUser(String username) {
        SuserEntity suserEntity = userDAO.selectUserByUsername(username);

        if(suserEntity == null) {
            //代表没有该账号 可以注册
            return "success";
        }

        return "error";
    }

    @Override
    public String regist(SuserEntity suserEntity) {

        suserEntity.setId(UUID.randomUUID().toString().replace("_",""));

        userDAO.insertUser(suserEntity);

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        HttpSession session = request.getSession();

        session.setAttribute("user",suserEntity);

        return "success";
    }
}
