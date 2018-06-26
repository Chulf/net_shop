package com.baizhi.clf;

import com.baizhi.clf.controller.ProductController;
import com.baizhi.clf.dao.UserDAO;
import com.baizhi.clf.entity.SuserEntity;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.util.HashMap;
import java.util.UUID;

/**
 * Created by Administrator on 2018/3/27.
 */
public class TestUserDAO extends BaseTest {

    @Autowired
    private UserDAO userDAO;

    @Test
    public void testSelectUser(){

        SuserEntity clf = userDAO.selectUserByUsername("clf");
        System.out.println(clf);
    }

    @Test
    public void testInsertUser(){
        SuserEntity suserEntity = new SuserEntity();
        String replace = UUID.randomUUID().toString().replace("-", "");
        suserEntity.setId(replace);

        suserEntity.setUsername("zhangsan");
        suserEntity.setPassword("123123");
        suserEntity.setPhone("18511887794");
        userDAO.insertUser(suserEntity);
    }
    @Test
    public void test(){

        File file = new File("d:/test/test/1.jpg");

        System.out.println(file.getName());
    }
}
