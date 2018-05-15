package com.baizhi.clf;

import com.baizhi.clf.dao.AdminRelationDAO;
import com.baizhi.clf.entity.SadminCategoryEntity;
import com.baizhi.clf.entity.SadminProductEntity;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2018/3/23.
 */
public class TestAdminRelation extends BaseTest{
    @Autowired
    private AdminRelationDAO adminRelationDAO;

    @Test
    public void testAdminCategory(){
        List<SadminCategoryEntity> sadminCategoryEntities = adminRelationDAO.selectAdminCategorys("8a8ab0b246dc81120146dc8181950052");

        System.out.println(sadminCategoryEntities);
    }

    @Test
    public void testAdminProduct(){
        List<SadminProductEntity> sadminProductEntities = adminRelationDAO.selectAdminProducts("8a8ab0b246dc81120146dc8181950052");

        System.out.println(sadminProductEntities);
    }
}
