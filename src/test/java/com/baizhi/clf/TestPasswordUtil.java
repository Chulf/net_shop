package com.baizhi.clf;

import com.baizhi.clf.util.PasswordUtil;
import org.junit.Test;

/**
 * Created by Administrator on 2018/3/28.
 */
public class TestPasswordUtil {

    @Test
    public void test(){
        String encrypt = PasswordUtil.encrypt("SuperAdmin","123123", PasswordUtil.getStaticSalt());

        System.out.println(encrypt);
    }
}
