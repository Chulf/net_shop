package com.baizhi.clf.vo;

import com.baizhi.clf.entity.SorderEntity;

import java.util.List;

/**
 * Created by Administrator on 2018/3/28.
 */
public class OrderDTO {

    private SorderEntity sorderEntity;

    private List<CartCarVO> cartCarVO;

    public SorderEntity getSorderEntity() {
        return sorderEntity;
    }

    public void setSorderEntity(SorderEntity sorderEntity) {
        this.sorderEntity = sorderEntity;
    }

    public List<CartCarVO> getCartCarVO() {
        return cartCarVO;
    }

    public void setCartCarVO(List<CartCarVO> cartCarVO) {
        this.cartCarVO = cartCarVO;
    }
}
