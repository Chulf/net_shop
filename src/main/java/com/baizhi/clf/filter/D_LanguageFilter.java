package com.baizhi.clf.filter;

import com.baizhi.clf.entity.Admin;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Locale;

/**
 * Created by Administrator on 2018/2/27.
 */

/**
 * 语言拦截器 判断浏览器的语言进行语言选择 并且判断访问方式是手机或者电脑
 */
@WebFilter(urlPatterns = "/netShoppp/*", filterName = "f4")
public class D_LanguageFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request2 = (HttpServletRequest) request;
        HttpServletResponse response2 = (HttpServletResponse) response;
        HttpSession session = request2.getSession();

        Admin admin = (Admin) session.getAttribute("adminMsg");

        //获取请求的url
        String str = request2.getRequestURL().toString();

        String contextPath = request2.getContextPath();

        Locale locale = request2.getLocale();
        //获取请求的浏览器语言
        String language = locale.getLanguage();
        //获取请求的方式
        String userAgent = request2.getHeader("user-agent");

        System.out.println(language);
        if (language.startsWith("zh")) {
            //跳转中文界面

            if (userAgent.indexOf("Android") != -1 || userAgent.indexOf("iPhone") != -1 || userAgent.indexOf("iPad") != -1) {
                //手机
                if(admin.getUsername().equals("SuperAdmin")){
                    response2.sendRedirect(contextPath+"/webApp-shop/login.jsp");
                }else{
                    response2.sendRedirect(contextPath+"/webApp-shop/home.jsp?adminId="+admin.getId());
                }
                return;
            } else {
                //电脑
                if(admin.getUsername().equals("SuperAdmin")){
                    response2.sendRedirect(contextPath+"/chinaPage/page/login.jsp");
                }else{
                    response2.sendRedirect(contextPath+"/chinaPage/page/booklist.jsp?adminId="+admin.getId());
                }
                return;
            }

        } else {
            //跳转意大利界面
            if (userAgent.indexOf("Android") != -1 || userAgent.indexOf("iPhone") != -1 || userAgent.indexOf("iPad") != -1) {
                //手机
                if(admin.getUsername().equals("SuperAdmin")){
                    response2.sendRedirect(contextPath+"/webApp-shop2/login.jsp");
                }else{
                    response2.sendRedirect(contextPath+"/webApp-shop2/home.jsp?adminId="+admin.getId());
                }
                return;
            } else {
                //电脑
                if(admin.getUsername().equals("SuperAdmin")){
                    response2.sendRedirect(contextPath+"/italyPage/page/login.jsp");
                }else{
                    response2.sendRedirect(contextPath+"/italyPage/page/booklist.jsp?adminId="+admin.getId());
                }
                return;
            }
        }
    }

    @Override
    public void destroy() {

    }
}
