package com.baizhi.clf.dao;

import com.baizhi.clf.entity.ScategoryEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/3/22.
 */
public interface CategoryDAO {

    public ScategoryEntity selectCategoryById(String categoryId);

}
