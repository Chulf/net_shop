package com.baizhi.clf.dao;

import com.baizhi.clf.entity.SproductEntity;
import com.baizhi.clf.vo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2018/3/21.
 */
public interface ProductDAO {

    //通过条件获得图书列表
    public List<SproductEntity> selectProducts(@Param("sproductEntity") SproductEntity sproductEntity,@Param("page") Page page,@Param("condition")String condition);

    //通过id获得图书详情
    public SproductEntity  selectProductById(String id);

    //查询超级管理员商品数量
    public Integer selectCounts(@Param("categoryId") String categoryId);

    //通过动态sql 查询图书列表
    public List<SproductEntity> selectProductByDsql(@Param("page") Page page,@Param("condition")String condition);

    //通过动态sql 查询总数量
    public Integer selectCountsByDsql(@Param("condition")String condition);
}
