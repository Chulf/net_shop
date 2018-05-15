package com.baizhi.clf.entity;


@SuppressWarnings("serial")
public class SadminCategoryEntity implements java.io.Serializable {
	/**主键*/
	private String id;
	/**类别外键*/
	private String categoryId;
	/**管理员外键*/
	private String adminId;
	

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

	public String getCategoryId(){
		return this.categoryId;
	}


	public void setCategoryId(String categoryId){
		this.categoryId = categoryId;
	}

	public String getAdminId(){
		return this.adminId;
	}


	public void setAdminId(String adminId){
		this.adminId = adminId;
	}
}
