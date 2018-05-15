package com.baizhi.clf;

import com.baizhi.clf.dao.OrderDAO;
import com.baizhi.clf.entity.SorderEntity;
import com.baizhi.clf.entity.SorderItemEntity;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2018/3/28.
 */
public class TestOrderDAO extends BaseTest {

    @Autowired
    private OrderDAO orderDAO;


    @Test
    public void testOrderDAO(){

        SorderEntity sorderEntity = new SorderEntity();

        sorderEntity.setShopId("8a8ab0b246dc81120146dc8181950052");
        sorderEntity.setAdminId("40289781624134e10162413b3a3c0001");

        List<SorderEntity> order = orderDAO.selectOrders(sorderEntity);


        List<SorderItemEntity> sorderItemEntities = orderDAO.selectOrderItem(order.get(0).getOrderNum());
        System.out.println(sorderItemEntities);
    }


}
