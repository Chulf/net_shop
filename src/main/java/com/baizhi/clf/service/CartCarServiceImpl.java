package com.baizhi.clf.service;


import com.baizhi.clf.dao.CategoryDAO;
import com.baizhi.clf.dao.ProductDAO;
import com.baizhi.clf.entity.SproductEntity;
import com.baizhi.clf.vo.CartCarVO;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Service
public class CartCarServiceImpl  implements  CartCarService{


    @Resource
    private ProductService productService;
    @Resource
    private CategoryDAO categoryDAO;


    @Override
    public List<CartCarVO> queryCarGoods(HttpServletRequest request) {
        ArrayList<CartCarVO> cartCars = new ArrayList<>();
        Map<String,CartCarVO> cartCar = (Map<String, CartCarVO>) request.getSession().getAttribute("cartCar");
        if(cartCar==null){
            return  null;
        }else {
            Iterator<CartCarVO> iterator = cartCar.values().iterator();
            while(iterator.hasNext()){
                cartCars.add(iterator.next());
            }
            return cartCars;
        }
    }

    @Override
    public void addCarGood(HttpServletRequest request, String  id) {
        Map<String,CartCarVO> cartCar = (Map<String, CartCarVO>) request.getSession().getAttribute("cartCar");
        if(cartCar==null){
            request.getSession().setAttribute("cartCar",new HashMap<String,CartCarVO>());
            cartCar = (Map<String, CartCarVO>) request.getSession().getAttribute("cartCar");
        }
        if(!cartCar.containsKey(id)){
            CartCarVO cartCarVO = new CartCarVO();
            cartCarVO.setCount(1);
            SproductEntity sproductEntity = productService.findProductDetail(id);
            sproductEntity.setCategoryName(categoryDAO.selectCategoryById(sproductEntity.getCategoryId()).getName());
            cartCarVO.setSproductEntity(sproductEntity);
            cartCar.put(id,cartCarVO);
            }else{
                CartCarVO cartCarVO = cartCar.get(id);
                cartCarVO.setCount(cartCarVO.getCount()+1);
                cartCar.put(id,cartCarVO);
        }
        }

    @Override
    public void modifyCarGood(HttpServletRequest request, int count,String id) {
        Map<String,CartCarVO> cartCar = (Map<String, CartCarVO>) request.getSession().getAttribute("cartCar");
        CartCarVO cartCarVO = cartCar.get(id);
        cartCarVO.setCount(count);
        cartCar.put(id,cartCarVO);
    }

    @Override
    public void dropCarGood(HttpServletRequest request, String id) {
        Map<String,CartCarVO> cartCar = (Map<String, CartCarVO>) request.getSession().getAttribute("cartCar");
        cartCar.remove(id);
    }

    @Override
    public void addCarGoodAndCount(HttpServletRequest request, String id, int count) {
        Map<String,CartCarVO> cartCar = (Map<String, CartCarVO>) request.getSession().getAttribute("cartCar");
        if(cartCar==null){
            request.getSession().setAttribute("cartCar",new HashMap<String,CartCarVO>());
            cartCar = (Map<String, CartCarVO>) request.getSession().getAttribute("cartCar");
        }
        if(!cartCar.containsKey(id)){
            CartCarVO cartCarVO = new CartCarVO();
            cartCarVO.setCount(count);
            SproductEntity sproductEntity = productService.findProductDetail(id);
            sproductEntity.setCategoryName(categoryDAO.selectCategoryById(sproductEntity.getCategoryId()).getName());
            cartCarVO.setSproductEntity(sproductEntity);
            cartCar.put(id,cartCarVO);
        }else{
            CartCarVO cartCarVO = cartCar.get(id);
            cartCarVO.setCount(count);
            cartCar.put(id,cartCarVO);
        }

    }
}
