package com.baizhi.clf.entity;

import java.math.BigDecimal;
import java.util.Date;



@SuppressWarnings("serial")
public class SurlEntity implements java.io.Serializable {
	/**主键*/
	private String id;
	/**店铺地址*/
	private String url;
	/**店铺状态*/
	private String status;
	/**店长外键*/
	private String adminId;

	//中文店名
	private String name1;
	//英文店名
	private String name2;

	//推荐状态 Y为推荐
	private String recommend;
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 */
	

	public String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  主键
	 */
	public void setId(String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  店铺地址
	 */

	public String getUrl(){
		return this.url;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  店铺地址
	 */
	public void setUrl(String url){
		this.url = url;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  店铺状态
	 */

	public String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  店铺状态
	 */
	public void setStatus(String status){
		this.status = status;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  店长外键
	 */

	public String getAdminId(){
		return this.adminId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  店长外键
	 */
	public void setAdminId(String adminId){
		this.adminId = adminId;
	}

	public String getName1() {
		return name1;
	}

	public void setName1(String name1) {
		this.name1 = name1;
	}

	public String getName2() {
		return name2;
	}

	public void setName2(String name2) {
		this.name2 = name2;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
}
