package com.baizhi.clf.filter;

import com.baizhi.clf.dao.UserDAO;
import com.baizhi.clf.entity.SuserEntity;
import com.baizhi.clf.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator on 2018/3/1.
 */
@WebFilter(urlPatterns = "/*",filterName = "f2")
public class B_LoginFilter implements Filter {
    private ServletContext servletContext;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        servletContext = filterConfig.getServletContext();
    }

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private UserService userService;

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request2 = (HttpServletRequest) servletRequest;

        HttpSession session = request2.getSession();

        Object user = session.getAttribute("user");
        Object admin = session.getAttribute("adminMsg");

        if (user == null) {

            //进行免登陆操作
            Cookie[] cookies = request2.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    String name = cookie.getName();
                    if (name.equals("userCookie")) {
                        //代表用户已经登录过 存储session 免登陆操作
                        String value = cookie.getValue();

                        WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);

                        userDAO = context.getBean(UserDAO.class);
                        userService = context.getBean(UserService.class);

                        //这里先不进行验证 后续再进行验证相关操作
                        SuserEntity suserEntity = userDAO.selectUserByUsername(value);
                        if (suserEntity != null && admin != null) {
                            //存储用户到session 代表登录
                            //session.setAttribute("user", suserEntity);
                            userService.login(suserEntity.getUsername(),suserEntity.getPassword());

                        }
                    }
                }
            }
        }
        //代表用户已经登录直接放行
        filterChain.doFilter(servletRequest, servletResponse);


    }

    @Override
    public void destroy() {

    }
}
