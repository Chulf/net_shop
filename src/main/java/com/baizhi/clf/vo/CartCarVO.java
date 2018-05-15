package com.baizhi.clf.vo;

import com.baizhi.clf.entity.SproductEntity;

/** 购物车的实体类 */
public class CartCarVO {

    /** 商品总数 */
    private Integer  count;
    /** 商品 */
    private SproductEntity  sproductEntity;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public SproductEntity getSproductEntity() {
        return sproductEntity;
    }

    public void setSproductEntity(SproductEntity sproductEntity) {
        this.sproductEntity = sproductEntity;
    }
}
