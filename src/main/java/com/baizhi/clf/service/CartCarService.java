package com.baizhi.clf.service;


import com.baizhi.clf.vo.CartCarVO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface CartCarService {

    /**
     * 查询购物车
     * @return  所有的购物车商品
     */
    public List<CartCarVO>  queryCarGoods(HttpServletRequest request);

    /**
     * 添加购物车
     * @param id  购物车商品id
     */
    public void  addCarGood(HttpServletRequest request, String id);

    /**
     * 修改购物车
     * @param count  修改数量
     */
    public void  modifyCarGood(HttpServletRequest request, int count, String id);


    /**
     * 删除购物车商品
     * @param id  删除的购物车商品id
     */
    public void  dropCarGood(HttpServletRequest request, String id);


    /**
     *
     * @param id 商品id
     * @param count  数量
     */
    public   void  addCarGoodAndCount(HttpServletRequest request, String id, int count);

}
