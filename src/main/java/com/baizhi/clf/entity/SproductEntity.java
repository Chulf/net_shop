package com.baizhi.clf.entity;

import java.math.BigDecimal;
import java.util.Date;


@SuppressWarnings("serial")
public class SproductEntity implements java.io.Serializable {
	/**主键*/
	private String id;
	/**商品标题*/
	private String name;
	/**商品描述*/
	private String description;
	/**商品价格*/
	private Double price;
	/**商品主图*/
	private String imgsrc;
	/**类别外键*/
	private String categoryId;
	/**商品内容*/
	private String content;
	/**仓库商品标志*/
	private String flag;

	private String chinaUnit = "";

	private String italyUnit = "";

	private String categoryName;

	private String productNum;

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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
	 *@return: java.lang.String  商品标题
	 */

	public String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品标题
	 */
	public void setName(String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商品描述
	 */

	public String getDescription(){
		return this.description;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品描述
	 */
	public void setDescription(String description){
		this.description = description;
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
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  商品主图
	 */

	public String getImgsrc(){
		return this.imgsrc;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  商品主图
	 */
	public void setImgsrc(String imgsrc){
		this.imgsrc = imgsrc;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  类别外键
	 */

	public String getCategoryId(){
		return this.categoryId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  类别外键
	 */
	public void setCategoryId(String categoryId){
		this.categoryId = categoryId;
	}
	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  商品内容
	 */

	public String getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  商品内容
	 */
	public void setContent(String content){
		this.content = content;
	}

	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  仓库商品标志
	 */

	public String getFlag(){
		return this.flag;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  商品内容
	 */
	public void setFlag(String flag){
		this.flag = flag;
	}

	public String getProductNum() {
		return productNum;
	}

	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}

	public String getChinaUnit() {
		return chinaUnit;
	}

	public void setChinaUnit(String chinaUnit) {
		this.chinaUnit = chinaUnit;
	}

	public String getItalyUnit() {
		return italyUnit;
	}

	public void setItalyUnit(String italyUnit) {
		this.italyUnit = italyUnit;
	}
}
