package com.baizhi.clf.filter;

import com.baizhi.clf.dao.AdminDAO;
import com.baizhi.clf.dao.SUrlDAO;
import com.baizhi.clf.entity.Admin;
import com.baizhi.clf.entity.SurlEntity;
import com.baizhi.clf.entity.SuserEntity;
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
//在访问时通过访问的连接判断用户访问的是哪个店铺 并存储相关信息
@WebFilter(urlPatterns = "/netShoppp/*", filterName = "f0")
public class A_AccessFilter implements Filter {

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

        HttpServletRequest request1 = (HttpServletRequest) request;
        HttpSession session = request1.getSession();

        //获取访问的url    http://localhost/shoppp/sdfasf
        StringBuffer requestURL = request1.getRequestURL();
        System.out.println("=========" + requestURL.toString() + "========");
        //通过url 获取店铺信息
        SurlEntity surlEntity = sUrlDAO.selectAdminIdByUrl(requestURL.toString());

        //声明管理员对象
        Admin admin = null;

        if (surlEntity == null || surlEntity.getStatus().equals("N")) {
            //代表没有该店铺或者店铺被关闭 地址无效 跳转默认店铺
            surlEntity = sUrlDAO.selectSurlByCondition("where recommend = 'Y'");

            if (surlEntity == null) {
                //获取默认管理员 并跳转 admin  默认跳转wangyan店铺
                admin = adminDAO.selectAdminById("40289fcc6275dfc601627614a55e0019");
                surlEntity = sUrlDAO.selectSurlByAdminId("40289fcc6275dfc601627614a55e0019");
            } else {
                //通过店铺信息 获得店铺管理员信息
                admin = adminDAO.selectAdminById(surlEntity.getAdminId());
            }
        } else {
            //代表地址有效 获取当前访问的店主信息
            admin = adminDAO.selectAdminById(surlEntity.getAdminId());
        }

        SuserEntity user = null;
        try {
            user = (SuserEntity)session.getAttribute("user");
        } catch (Exception e) {
            //如果出现转换异常 则证明登录的是仓库 不做处理！
        }

        //如果是登录仓库或者不是本店用户 把自动登录去掉！
        if (admin.getUsername().equals("SuperAdmin") || user == null ||!user.getShopId().equals(surlEntity.getId())) {
            session.setAttribute("user", null);
        }
        //存储店铺信息 存储店主信息
        session.setAttribute("adminMsg", admin);
        session.setAttribute("shopMsg", surlEntity);

        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
