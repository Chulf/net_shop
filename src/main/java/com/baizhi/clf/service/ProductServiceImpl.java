package com.baizhi.clf.service;

import com.baizhi.clf.dao.AdminRelationDAO;
import com.baizhi.clf.dao.ProductDAO;
import com.baizhi.clf.entity.Admin;
import com.baizhi.clf.entity.SadminProductEntity;
import com.baizhi.clf.entity.SproductEntity;
import com.baizhi.clf.vo.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/3/21.
 */
@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO productDAO;
    @Autowired
    private AdminRelationDAO adminRelationDAO;

    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    @Override
    public List<SproductEntity> findProductsByCategoryId(String adminId,String categoryId, Page page) {
        //获取当前店铺的所有关联商品
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        HttpSession session = request.getSession();
        Admin admin = (Admin)session.getAttribute("adminMsg");
        String username = admin.getUsername();

        //设置类别Id
        SproductEntity sproductEntity = new SproductEntity();

        sproductEntity.setCategoryId(categoryId);

        if(username.equals("SuperAdmin")){
            //如果是超级管理员
            List<SproductEntity> products = productDAO.selectProducts(sproductEntity, page,"flag='Y'");

            page.setTotalRows(productDAO.selectCounts(categoryId));

            session.setAttribute("page",page);

            return products;
        }

        //如果不是超级管理员
        List<SadminProductEntity> adminProducts = adminRelationDAO.selectAdminProducts(adminId);

        //符合条件的所有数据
        ArrayList<SproductEntity> products = new ArrayList<SproductEntity>();

        for (SadminProductEntity adminProduct : adminProducts) {
            SproductEntity product1 = productDAO.selectProductById(adminProduct.getProductId());
            if(product1.getCategoryId().equals(categoryId)){
                //把当前类别商品添加到集合
                //覆盖价格为当前店铺价格
                product1.setPrice(adminProduct.getPrice());
                products.add(product1);
            }
        }

        //查询15条
        page.setTotalRows(products.size());

        //返回当前页的数据
        ArrayList<SproductEntity> results = new ArrayList<SproductEntity>();

        for (int i = page.getStartIndex(); i < page.getPageRows(); i++) {

            if(products.size() == i) break;

            results.add(products.get(i));

        }
        session.setAttribute("page",page);
        return results;
    }

    @Override
    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    public List<SproductEntity> findProductsMain(String adminId,String condition) {

        //获取当前店铺的所有关联商品
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        Admin admin = (Admin)request.getSession().getAttribute("adminMsg");
        String username = admin.getUsername();

        if(username.equals("SuperAdmin")){
            //如果是超级管理员
            List<SproductEntity> products = productDAO.selectProducts(new SproductEntity(), new Page(1, 6),"flag='Y'");

            return products;
        }


        //普通店铺管理员
        List<SadminProductEntity> adminProducts = adminRelationDAO.selectAdminProducts(adminId);

        ArrayList<SproductEntity> products = new ArrayList<SproductEntity>();

        int index;
        if(adminProducts.size()<6){
            index = adminProducts.size();
        }else{
            index = 6;
        }

        //首页每个模块展示6条，所以这里查询6次
        for (int i = 0; i < index; i++) {

            SproductEntity sproductEntity = productDAO.selectProductById(adminProducts.get(i).getProductId());
            //覆盖价格为商铺自定义价格
            sproductEntity.setPrice(adminProducts.get(i).getPrice());
            products.add(sproductEntity);
        }

        return products;

    }

    @Override
    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    public SproductEntity findProductDetail(String id) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        HttpSession session = request.getSession();

        Admin admin  = (Admin)session.getAttribute("adminMsg");

        if(admin.getUsername().equals("SuperAdmin")){
            return productDAO.selectProductById(id);
        }else{
            SproductEntity sproductEntity = productDAO.selectProductById(id);

            SadminProductEntity sadminProductEntity = new SadminProductEntity();

            sadminProductEntity.setAdminId(admin.getId());
            sadminProductEntity.setProductId(sproductEntity.getId());
            //覆盖价格为自定义价格
            SadminProductEntity sadminProductEntity1 = adminRelationDAO.selectAdminProduct(sadminProductEntity);

            sproductEntity.setPrice(sadminProductEntity1.getPrice());
            return sproductEntity;
        }

    }

    @Override
    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    public List<SproductEntity> findProductsByDsql(Page page, String condition) {

        List<SproductEntity> sproductEntities = productDAO.selectProductByDsql(page, condition);

        Integer integer = productDAO.selectCountsByDsql(condition);
        page.setTotalRows(integer);

        return sproductEntities;
    }
}
