package com.baizhi.clf;

import com.baizhi.clf.dao.ProductDAO;
import com.baizhi.clf.entity.SproductEntity;
import com.baizhi.clf.vo.Page;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2018/3/21.
 */
public class TestProductDAO extends BaseTest{

    @Autowired
    private ProductDAO productDAO;

    @Test
    public void testSelectProducts(){
        SproductEntity product = new SproductEntity();

        product.setCategoryId("4028978162275573016227f2f0d60021");

        //List<SproductEntity> sproductEntities = productDAO.selectProducts(product, null,null);
        List<SproductEntity> products = productDAO.selectProducts(product, new Page(1, 6),"flag='Y'");

        System.out.println(products);
    }
    @Test
    public void testSelectProductById(){
        SproductEntity product = productDAO.selectProductById("40289781622890a80162289681d80001");
        System.out.println(product);
    }

}
