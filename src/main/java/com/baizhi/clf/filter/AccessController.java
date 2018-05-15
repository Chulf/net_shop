package com.baizhi.clf.filter;

import com.baizhi.clf.dao.AdminDAO;
import com.baizhi.clf.dao.SUrlDAO;
import com.baizhi.clf.entity.Admin;
import com.baizhi.clf.entity.SurlEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/3/30.
 */
//在访问根目录时让跳转一个默认店铺
@Controller
public class AccessController {

    @Autowired
    private AdminDAO adminDAO;
    @Autowired
    private SUrlDAO sUrlDAO;

    @RequestMapping("/")
    public String toMain(HttpServletRequest request, HttpSession session){
        //获取默认管理员 并跳转 admin  默认跳转wangyan店铺
        /*Admin admin = adminDAO.selectAdminById("40289fcc6275dfc601627614a55e0019");

        session.setAttribute("adminMsg",admin);

        SurlEntity surlEntity = sUrlDAO.selectSurlByAdminId("40289fcc6275dfc601627614a55e0019");
        session.setAttribute("shopMsg",surlEntity);*/

        return "redirect:/netShoppp/toRecommendShop";
    }
}
