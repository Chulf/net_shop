package com.baizhi.clf.filter;

import com.baizhi.clf.dao.AdminDAO;
import com.baizhi.clf.dao.SUrlDAO;
import com.baizhi.clf.entity.Admin;
import com.baizhi.clf.entity.SurlEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
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
//在访问时通过访问的连接判断用户访问的是哪个店铺
@WebFilter(urlPatterns = "/netShoppp/*", filterName = "f2")
public class B_AccessFilter implements Filter {

    @Autowired
    private SUrlDAO sUrlDAO;
    @Autowired
    private AdminDAO adminDAO;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        //防止注入失败
        if (sUrlDAO == null || adminDAO == null) {
            sUrlDAO = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(SUrlDAO.class);
            adminDAO = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext()).getBean(AdminDAO.class);
        }

        //通过Url获取当前访问的店主
        HttpServletRequest request1 = (HttpServletRequest) request;

        //获取访问的url    http://localhost/shoppp/sdfasf
        StringBuffer requestURL = request1.getRequestURL();
        System.out.println("===========s==" + requestURL.toString() + "========");
        SurlEntity surlEntity = sUrlDAO.selectAdminIdByUrl(requestURL.toString());
        HttpSession session = request1.getSession();

        if (surlEntity == null || surlEntity.getStatus().equals("N")) {
            //代表没有该店铺 或者店铺被关闭 跳转默认店铺
            surlEntity = sUrlDAO.selectSurlByCondition("where recommend = 'Y'");

            Admin admin = null;
            if (surlEntity == null) {
                //获取默认管理员 并跳转 admin  默认跳转wangyan店铺
                admin = adminDAO.selectAdminById("40289fcc6275dfc601627614a55e0019");
                surlEntity = sUrlDAO.selectSurlByAdminId("40289fcc6275dfc601627614a55e0019");
            } else {
                admin = adminDAO.selectAdminById(surlEntity.getAdminId());
                if (admin.getUsername().equals("SuperAdmin")) {
                    session.setAttribute("user", null);
                    session.setAttribute("shopMsg", surlEntity);
                }
            }
            session.setAttribute("adminMsg", admin);
        } else {


            //获取当前访问的店主信息
            Admin admin = adminDAO.selectAdminById(surlEntity.getAdminId());

            session.setAttribute("adminMsg", admin);

            if (admin.getUsername().equals("SuperAdmin")) {
                session.setAttribute("user", null);
                session.setAttribute("shopMsg", surlEntity);
            }

        }
        session.setAttribute("shopMsg", surlEntity);
        //跳转到主页
        //request.getRequestDispatcher("/chinaPage/page/booklist.jsp").forward(request,response);
        filterChain.doFilter(request, response);

    }

    @Override
    public void destroy() {

    }
}
