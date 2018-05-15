package com.baizhi.clf.entity;


import java.util.Date;



@SuppressWarnings("serial")
public class SorderEntity implements java.io.Serializable {
	/**主键*/
	private String id;
	/**订单编号*/
	private String orderNum;
	/**订单状态*/
	private String orderStatus;
	/**订单总价*/
	private Double orderSalary;
	/**用户外键*/
	private String userId;
	/**下单时间*/
	private Date time;

	//关联的普通店主用户信息
	private String shopId;

	//关联的店铺信息
	private String adminId;

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}

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
	 *@return: java.lang.String  订单编号
	 */

	public String getOrderNum(){
		return this.orderNum;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  订单编号
	 */
	public void setOrderNum(String orderNum){
		this.orderNum = orderNum;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  订单状态
	 */

	public String getOrderStatus(){
		return this.orderStatus;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  订单状态
	 */
	public void setOrderStatus(String orderStatus){
		this.orderStatus = orderStatus;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  订单总价
	 */

	public Double getOrderSalary(){
		return this.orderSalary;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  订单总价
	 */
	public void setOrderSalary(Double orderSalary){
		this.orderSalary = orderSalary;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  用户外键
	 */

	public String getUserId(){
		return this.userId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  用户外键
	 */
	public void setUserId(String userId){
		this.userId = userId;
	}

	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  下单时间
	 */

	public Date getTime(){
		return this.time;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  下单时间
	 */
	public void setTime(Date time){
		this.time = time;
	}
}
