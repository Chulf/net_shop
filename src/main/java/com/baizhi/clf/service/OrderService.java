package com.baizhi.clf.service;

import com.baizhi.clf.entity.SorderEntity;
import com.baizhi.clf.vo.CartCarVO;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/3/27.
 */
public interface OrderService {

    public String createOrder(String salary);

    public List<Map<SorderEntity, List<CartCarVO>>> findOrders();
}
