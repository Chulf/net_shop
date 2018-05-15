package com.baizhi.clf.dao;

import com.baizhi.clf.entity.SadminProductEntity;
import com.baizhi.clf.entity.SorderEntity;
import com.baizhi.clf.entity.SorderItemEntity;

import java.util.List;

/**
 * Created by Administrator on 2018/3/27.
 */
public interface OrderDAO {

    public void insertOrder(SorderEntity sorderEntity);

    public void insertOrderItem(SorderItemEntity sorderItemEntity);

    public List<SorderEntity> selectOrders(SorderEntity sorderEntity);

    public List<SorderItemEntity> selectOrderItem(String orderNum);
}
