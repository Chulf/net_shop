package com.baizhi.clf.dao;

import com.baizhi.clf.entity.SadminCategoryEntity;
import com.baizhi.clf.entity.SadminProductEntity;

import java.util.List;

/**
 * Created by Administrator on 2018/3/23.
 */
public interface AdminRelationDAO {

    //通过管理员的id 获取所有关联类别id
    public List<SadminCategoryEntity> selectAdminCategorys(String adminId);

    //通过管理员的Id 获取关联的商品
    public List<SadminProductEntity>  selectAdminProducts(String adminId);

    //通过商品id 和 adminId 获得商品的价格信息
    public SadminProductEntity selectAdminProduct(SadminProductEntity sadminProductEntity);

}
