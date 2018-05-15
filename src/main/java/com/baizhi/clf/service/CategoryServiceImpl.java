package com.baizhi.clf.service;

import com.baizhi.clf.dao.AdminRelationDAO;
import com.baizhi.clf.dao.CategoryDAO;
import com.baizhi.clf.entity.SadminCategoryEntity;
import com.baizhi.clf.entity.ScategoryEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/3/22.
 */
@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private AdminRelationDAO adminRelationDAO;

    @Autowired
    private CategoryDAO  categoryDAO;

    @Transactional(readOnly = true,propagation = Propagation.SUPPORTS)
    @Override
    public List<ScategoryEntity> findCategorys(String adminId) {

        List<SadminCategoryEntity> adminCategorys = adminRelationDAO.selectAdminCategorys(adminId);


        ArrayList<ScategoryEntity> categorys = new ArrayList<ScategoryEntity>();

        //添加类别列表
        for (SadminCategoryEntity adminCategory : adminCategorys) {

            ScategoryEntity scategoryEntity = categoryDAO.selectCategoryById(adminCategory.getCategoryId());

            categorys.add(scategoryEntity);
        }

        return categorys;
    }
}
