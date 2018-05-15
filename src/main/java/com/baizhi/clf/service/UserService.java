package com.baizhi.clf.service;

import com.baizhi.clf.entity.SuserEntity;

/**
 * Created by Administrator on 2018/3/27.
 */
public interface UserService {

    public String login(String  username,String password);

    public String checkUser(String username);

    public String regist(SuserEntity suserEntity);
}
