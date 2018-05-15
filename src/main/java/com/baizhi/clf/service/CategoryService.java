package com.baizhi.clf.service;

import com.baizhi.clf.entity.ScategoryEntity;

import java.util.List;

/**
 * Created by Administrator on 2018/3/22.
 */
public interface CategoryService {

    public List<ScategoryEntity> findCategorys(String adminId);
}
