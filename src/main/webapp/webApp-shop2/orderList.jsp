<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="${pageContext.request.contextPath}/webApp-shop/js/ContextPath.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>Il mio ordine</title>
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/iconfont.css">
	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/orderList.css">
</head>
<body>s
	<!-- 头部 -->
	<header>
		<div class="left"></div>
		<div class="title">Il mio ordine</div>
		<div class="right"></div>
	</header>

    <div id="cart-shop" class="cart-shop">
		<!-- <div class="orderDetail">
			<div class="orderListHeader">
	        	<div class="orderNumber">订单编号:2018050411546589479353</div>
	        	<div class="orderStatus">订单状态：<span>待处理</span></div>
	        </div>

	        <div class="cart-shop-content">
	            <div class="cart-shop-content-right">
	                <a href="#" class="product-img">
	                    <img src="images/IMG_0760.JPG" alt=""/>
	                </a>
	                <div class="product-info">
	                    <a href="#" class="info-txt">华为（HUAWEI）荣耀平板优享版 Wifi 8英寸平板电脑</a>
	                    <div class="option">
	                        <div class="pull-left">
	                    		<p class="price">商品单价：€ <b>1000.00</b></p>
	                            <span class="num">购买数量：<b>2</b></span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>

	        <div class="cart-shop-content">
	            <div class="cart-shop-content-right">
	                <a href="#" class="product-img">
	                    <img src="images/IMG_0760.JPG" alt=""/>
	                </a>
	                <div class="product-info">
	                    <a href="#" class="info-txt">华为（HUAWEI）荣耀平板优享版 Wifi 8英寸平板电脑</a>
	                    <div class="option">
	                        <div class="pull-left">
	                    		<p class="price">商品单价：€ <b>1000.00</b></p>
	                            <span class="num">购买数量：<b>2</b></span>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>

	        <div class="orderListFooter">
	        	<div>共<span class="totalNum">2</span>件商品 合计：$ <span class="totalPrice">99.99</span></div>
	        </div>
		</div> -->
    </div>

	<!-- 底部 -->
	<footer>
		<ul>
			<a href="home.jsp">
				<li>
					<i class="iconfont icon-category"></i>
					<span>Scegliere</span>
				</li>
			</a>
			<a href="shoppingCar.jsp">
				<li>
					<i class="iconfont icon-cart"></i>
					<span>Carrello della spesa</span>
				</li>
			</a>
			<a href="mine.jsp">
				<li>
					<i class="iconfont icon-account"></i>
					<span>Centro personale</span>
				</li>
			</a>
		</ul>
	</footer>
	<script src="js/lib/zepto.min.js"></script>
    <script src="js/orderList.js"></script>
</body>
</html>