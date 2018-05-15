package com.baizhi.clf.entity;


public class SorderItemEntity implements java.io.Serializable {
    /**
     * 主键
     */
    private String id;
    /**
     * 订单主键
     */
    private String orderId;
    /**
     * 商品主键
     */
    private String productId;
    /**
     * 商品标题
     */
    private String name;
    /**
     * 商品描述
     */
    private String description;
    /**
     * 商品价格
     */
    private Double price;
    /**
     * 商品主图
     */
    private String imgsrc;
    /**
     * 数量
     */
    private Integer count;

    private String productNum;

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  主键
     */


    public String getId() {
        return this.id;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  主键
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  订单主键
     */

    public String getOrderId() {
        return this.orderId;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  订单主键
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  商品主键
     */

    public String getProductId() {
        return this.productId;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  商品主键
     */
    public void setProductId(String productId) {
        this.productId = productId;
    }

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  商品标题
     */

    public String getName() {
        return this.name;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  商品标题
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  商品描述
     */

    public String getDescription() {
        return this.description;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  商品描述
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * 方法: 取得java.lang.Double
     *
     * @return: java.lang.Double  商品价格
     */

    public Double getPrice() {
        return this.price;
    }

    /**
     * 方法: 设置java.lang.Double
     *
     * @param: java.lang.Double  商品价格
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * 方法: 取得java.lang.String
     *
     * @return: java.lang.String  商品主图
     */

    public String getImgsrc() {
        return this.imgsrc;
    }

    /**
     * 方法: 设置java.lang.String
     *
     * @param: java.lang.String  商品主图
     */
    public void setImgsrc(String imgsrc) {
        this.imgsrc = imgsrc;
    }

    /**
     * 方法: 取得java.lang.Integer
     *
     * @return: java.lang.Integer  数量
     */

    public Integer getCount() {
        return this.count;
    }

    /**
     * 方法: 设置java.lang.Integer
     *
     * @param: java.lang.Integer  数量
     */
    public void setCount(Integer count) {
        this.count = count;
    }

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum;
    }
}
