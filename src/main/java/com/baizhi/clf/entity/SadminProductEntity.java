package com.baizhi.clf.entity;




@SuppressWarnings("serial")
public class SadminProductEntity implements java.io.Serializable {
	/**主键 */
	private String id;
	/**商品外键*/
	private String productId;
	/**管理员外键*/
	private String adminId;
	/**商品价格*/
	private Double price;
	
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
	 *@return: java.lang.String  商品外键
	 */
	public String getProductId(){
		return this.productId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品外键
	 */
	public void setProductId(String productId){
		this.productId = productId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  管理员外键
	 */

	public String getAdminId(){
		return this.adminId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  管理员外键
	 */
	public void setAdminId(String adminId){
		this.adminId = adminId;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  商品价格
	 */

	public Double getPrice(){
		return this.price;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  商品价格
	 */
	public void setPrice(Double price){
		this.price = price;
	}
}
