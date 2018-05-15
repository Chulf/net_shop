package com.baizhi.clf.dao;

import com.baizhi.clf.entity.Admin;

/**
 * Created by Administrator on 2018/3/23.
 */
public interface AdminDAO {

    public Admin selectAdminById(String adminId);

    public Admin selectAdminByUsername(String username);
}
