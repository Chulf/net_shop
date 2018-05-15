package com.baizhi.clf.controller;

import com.baizhi.clf.entity.SorderEntity;
import com.baizhi.clf.service.OrderService;
import com.baizhi.clf.vo.CartCarVO;
import com.baizhi.clf.vo.OrderDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/3/27.
 */
@RestController
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("/createOrder")
    public String createOrder(String salary){

        String result = orderService.createOrder(salary);

        return result;
    }

    @RequestMapping("/findMyOrder")
    public List<OrderDTO> findMyOrder(){

        //由于前台js不支持复杂的json转换所以这里边转换为简单结构
        List<Map<SorderEntity, List<CartCarVO>>> orders = orderService.findOrders();

        ArrayList<OrderDTO> dtoArrayList = new ArrayList<OrderDTO>();

        for (Map<SorderEntity, List<CartCarVO>> order : orders) {

            for (SorderEntity sorderEntity : order.keySet()) {

                OrderDTO orderDTO = new OrderDTO();

                orderDTO.setSorderEntity(sorderEntity);

                orderDTO.setCartCarVO(order.get(sorderEntity));

                dtoArrayList.add(orderDTO);
            }
        }
        
        
        return dtoArrayList;
    }
}
