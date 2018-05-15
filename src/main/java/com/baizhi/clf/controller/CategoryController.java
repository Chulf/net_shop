package com.baizhi.clf.controller;

import com.baizhi.clf.entity.ScategoryEntity;
import com.baizhi.clf.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by Administrator on 2018/3/22.
 */
@RestController
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/findCategorys")
    public List<ScategoryEntity> findCategorys(String adminId){

        List<ScategoryEntity> categorys = categoryService.findCategorys(adminId);

        return categorys;
    }

}
