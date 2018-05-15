package com.baizhi.clf.service;

import com.baizhi.clf.entity.SproductEntity;
import com.baizhi.clf.vo.Page;

import java.util.List;

/**
 * Created by Administrator on 2018/3/21.
 */
public interface ProductService {

    public List<SproductEntity> findProductsByCategoryId(String adminId,String categoryId,Page page);

    public List<SproductEntity> findProductsMain(String adminId,String condition);

    public SproductEntity findProductDetail(String id);

    public List<SproductEntity> findProductsByDsql(Page page,String condition);

}
