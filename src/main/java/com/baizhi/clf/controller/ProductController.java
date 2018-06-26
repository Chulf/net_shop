package com.baizhi.clf.controller;

import com.baizhi.clf.entity.SproductEntity;
import com.baizhi.clf.service.ProductService;
import com.baizhi.clf.vo.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/3/21.
 */
@RestController
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping("/findProductsByCategoryId")
    public List<SproductEntity> findProductsByCategoryId(String adminId, String categoryId, Integer pageIndex) {

        List<SproductEntity> products;

        Page page = new Page(pageIndex);
        products = productService.findProductsByCategoryId(adminId, categoryId, page);


        return products;
    }

    @RequestMapping("/findProductsMain")
    public List<SproductEntity> findProductsMain(String adminId, String condition) {

        List<SproductEntity> products = productService.findProductsMain(adminId, condition);

        return products;

    }
    @RequestMapping("/findProductDetail")
    public SproductEntity findProductDetail(String id){

        SproductEntity productDetail = productService.findProductDetail(id);

        return productDetail;
    }

    @RequestMapping("/findProductsByDsql")
    public List<SproductEntity>findProductsByDsql(String condition, Integer index, HttpSession session){

        Page page = new Page(index);

        String sql = handleSql(condition);

        List<SproductEntity> productsByDsql = productService.findProductsByDsql(page, sql);

        session.setAttribute("page",page);

        return productsByDsql;
    }
    @RequestMapping("/findPageMsg")
    public Page findPageMsg(HttpSession session){
        Page page = (Page)session.getAttribute("page");

        return page;
    }

    //重复商品加group by 处理工具类
    public static String  handleSql(String sql){
        StringBuilder str = new StringBuilder(sql);

        if(sql.contains("order")){
           //把group by 加在order前

           int index =  sql.indexOf("order");
           str.insert(index," group by s.name ");

           return str.toString();
        }else{

            str.append(" group by s.name ");
            return str.toString();
        }
    }
}
