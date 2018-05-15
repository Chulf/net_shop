package com.baizhi.clf.controller;

import com.baizhi.clf.service.CartCarService;
import com.baizhi.clf.vo.CartCarVO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
@RequestMapping("cartCar")
public class CartCarController {

    @Resource
    private CartCarService cartCarService;

    @RequestMapping("show")
    public  List<CartCarVO>  showCars(HttpServletRequest request){
        List<CartCarVO> cartCarVOS = cartCarService.queryCarGoods(request);
        return  cartCarVOS;
    }

    @RequestMapping("append")
    public  String  appendCartCarGood(HttpServletRequest request, String id ){
        try {
            cartCarService.addCarGood(request, id);
            return  "success";
        } catch (Exception e) {
            e.printStackTrace();
            return  "error";
        }
    }

    @RequestMapping("changeCount")
    public  String  changeCartCarGoodCount(HttpServletRequest request,int  count,String id){
        try {
            cartCarService.modifyCarGood(request, count, id);
            return  "修改成功";
        } catch (Exception e) {
            e.printStackTrace();
            return  "修改失败";
        }
    }

    @RequestMapping("dropCartGood")
    public  String  dropCartCarGood(HttpServletRequest request,String id){
        try {
            cartCarService.dropCarGood(request, id);
            return  "删除成功";
        } catch (Exception e) {
            e.printStackTrace();
            return  "删除失败";
        }
    }


    @RequestMapping("appendCount")
    public String appendCartCarGoodAndCount(HttpServletRequest request, String id,int count){
        try {
            cartCarService.addCarGoodAndCount(request, id, count);
            return  "success";
        } catch (Exception e) {
            e.printStackTrace();
            return  "error";
        }
    }


}
