package com.baizhi.clf.service;

import com.baizhi.clf.dao.OrderDAO;
import com.baizhi.clf.dao.ProductDAO;
import com.baizhi.clf.entity.*;
import com.baizhi.clf.util.OrderNumUtil;
import com.baizhi.clf.vo.CartCarVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by Administrator on 2018/3/27.
 */
@Service
@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAO orderDAO;
    @Autowired
    private ProductDAO productDAO;

    @Override
    @Transactional
    public String createOrder(String salary) {

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        HttpSession session = request.getSession();

        //获取当前店主信息
        Admin admin = (Admin) session.getAttribute("adminMsg");

        SorderEntity order = new SorderEntity();

        order.setId(UUID.randomUUID().toString());
        String orderNo = OrderNumUtil.getOrderNo();
        order.setOrderNum(orderNo);
        order.setOrderSalary(new Double(salary));
        order.setOrderStatus("待处理");
        order.setTime(new Date());

        //判断当前店铺是否是仓库 如果是仓库 添加外键为 shop_id
        if (admin.getUsername().equals("SuperAdmin")) {

            //获取当前登录用户信息
            Admin logadmin = (Admin) session.getAttribute("user");

            order.setShopId(logadmin.getId());
        } else {

            //获取当前登录用户信息
            SuserEntity user = (SuserEntity) session.getAttribute("user");

            order.setUserId(user.getId());
        }
        order.setAdminId(admin.getId());


        //插入订单数据
        orderDAO.insertOrder(order);

        //添加当前订单信息入库 并添加订单项
        Map<String, CartCarVO> cartCar = (Map<String, CartCarVO>) session.getAttribute("cartCar");

        //构建订单项数据并插入
        for (String s : cartCar.keySet()) {
            SorderItemEntity orderItem = new SorderItemEntity();
            CartCarVO cartCarVO = cartCar.get(s);
            SproductEntity sproductEntity = cartCarVO.getSproductEntity();

            orderItem.setId(UUID.randomUUID().toString());
            orderItem.setPrice(sproductEntity.getPrice());
            orderItem.setProductId(sproductEntity.getId());
            orderItem.setCount(cartCarVO.getCount());
            orderItem.setOrderId(orderNo);
            orderItem.setName(sproductEntity.getName());
            orderItem.setDescription(sproductEntity.getDescription());
            orderItem.setImgsrc(sproductEntity.getImgsrc());
            orderItem.setProductNum(sproductEntity.getProductNum());

            orderDAO.insertOrderItem(orderItem);
        }
        //插入完数据清空购物车
        session.setAttribute("cartCar", null);
        return "success";
    }

    @Override
    public List<Map<SorderEntity, List<CartCarVO>>> findOrders() {

        //订单项数据   包含 订单对象 -- >对应多个 购物车对象
        List<Map<SorderEntity, List<CartCarVO>>> data = new ArrayList<Map<SorderEntity, List<CartCarVO>>>();

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        HttpSession session = request.getSession();

        //获取当前店主信息
        Admin admin = (Admin) session.getAttribute("adminMsg");

        SorderEntity sorderEntity = new SorderEntity();
        sorderEntity.setAdminId(admin.getId());
        if (admin.getUsername().equals("SuperAdmin")) {
            //根据店主外键去获取订单
            Admin logadmin = (Admin) session.getAttribute("user");
            sorderEntity.setShopId(logadmin.getId());
        } else {
            SuserEntity user = (SuserEntity) session.getAttribute("user");
            sorderEntity.setUserId(user.getId());
        }
        //通过  外键和 店主id 获取用户在当前店铺的订单数据
        List<SorderEntity> sorderEntities = orderDAO.selectOrders(sorderEntity);

        //构建订单页数据
        for (SorderEntity entity : sorderEntities) {
            //通过订单获取用户的订单项数据
            HashMap<SorderEntity, List<CartCarVO>> map = new HashMap<>();

            ArrayList<CartCarVO> cartCarVOs = new ArrayList<>();

            String orderNum = entity.getOrderNum();

            List<SorderItemEntity> sorderItemEntities = orderDAO.selectOrderItem(orderNum);

            for (SorderItemEntity sorderItemEntity : sorderItemEntities) {

                CartCarVO cartCarVO = new CartCarVO();

                cartCarVO.setCount(sorderItemEntity.getCount());

                SproductEntity sproductEntity = new SproductEntity();
                //添加商品对象数据
                sproductEntity.setPrice(sorderItemEntity.getPrice());
                sproductEntity.setImgsrc(sorderItemEntity.getImgsrc());
                sproductEntity.setDescription(sorderItemEntity.getDescription());
                sproductEntity.setName(sorderItemEntity.getName());

                cartCarVO.setSproductEntity(sproductEntity);

                cartCarVOs.add(cartCarVO);
            }
            //构建一个订单页数据
            map.put(entity, cartCarVOs);

            data.add(map);
        }

        return data;
    }
}
