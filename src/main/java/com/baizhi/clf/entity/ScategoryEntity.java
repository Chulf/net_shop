package com.baizhi.clf.entity;


public class ScategoryEntity implements java.io.Serializable {
	/**主键*/
	private String id;
	/**类别名字*/
	private String name;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  主键
	 * **/

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
	 *@return: java.lang.String  类别名字
	 */

	public String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  类别名字
	 */
	public void setName(String name){
		this.name = name;
	}
}
