package com.baizhi.clf.filter;

import com.baizhi.clf.dao.AdminDAO;
import com.baizhi.clf.dao.SUrlDAO;
import com.baizhi.clf.entity.Admin;
import com.baizhi.clf.entity.SurlEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2018/3/22.
 */
//如果店铺管理员信息没有存储进行存储
@WebFilter(urlPatterns = "*.jsp",filterName = "f3")
public class C_AccessFilter implements Filter{

    @Autowired
    private AdminDAO adminDAO;
    @Autowired
    private SUrlDAO sUrlDAO;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        if(adminDAO==null){
            adminDAO = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(AdminDAO.class);
            sUrlDAO = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(SUrlDAO.class);
        }

        //通过Url获取当前访问的店主
        HttpServletRequest request1 = (HttpServletRequest)request;

        HttpSession session = request1.getSession();

        Admin adminMsg = (Admin)session.getAttribute("adminMsg");

        //所以要求url 传递必须携带amdinId
        if(adminMsg == null){

            String adminId = request1.getParameter("adminId");
            Admin admin = adminDAO.selectAdminById(adminId);

            SurlEntity surlEntity = sUrlDAO.selectSurlByAdminId(adminId);

            session.setAttribute("adminMsg",admin);
            session.setAttribute("shopMsg",surlEntity);
        }
        filterChain.doFilter(request,response);

    }

    @Override
    public void destroy() {

    }
}
