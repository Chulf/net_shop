package com.baizhi.clf.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class OrderNumUtil {

	/**
	 * 
	 * @Description: 该类产生订单号  订单号 = 10位随机数+当前时间时间戳
	 * @Class:OrderNoUtil
	 * @Method:getOrderNo  
	 * @Param:@return
	 */
	public static String getOrderNo(){
		//构建随机数字符串 10位
		String a = "1234567890";
		
		Random random = new Random();
		
		char[] ranNo = new char[10]; 
	    for (int i = 0; i < 10; i++) {
		   ranNo[i] = a.charAt(random.nextInt(a.length()));
		}
	    String ranNu = new String(ranNo);
		
	    
	    //构建时间戳字符串
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddhhss");
	    String date = format.format(new Date());
	    
	    String orderNo = date+ranNu;
		
		return orderNo;
	}
	
}
