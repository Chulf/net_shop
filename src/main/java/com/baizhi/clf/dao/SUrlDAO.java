package com.baizhi.clf.dao;

import com.baizhi.clf.entity.SurlEntity;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Administrator on 2018/3/23.
 */
public interface SUrlDAO {

    public SurlEntity selectAdminIdByUrl(String url);

    public SurlEntity selectSurlByAdminId(String adminId);

    public SurlEntity selectSurlByCondition(@Param("condition") String condition);
}
