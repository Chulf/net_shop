<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<script src="${pageContext.request.contextPath}/webApp-shop/js/ContextPath.js"></script>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>Lu-Food</title>
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/iconfont.css">
	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/cate.css">
	<script src="js/lib/zepto.min.js"></script>
	<script src="js/cate.js"></script>
	<style>
		.addOne{
			display:inline-block;
			width:20px;
			height:20px;
			background-color:#e8401f;
			line-height:20px;
			text-align:center;
			border-radius:10px;
			color:#fff;
			font-weight: bold;
		}
		.minusOne{
			width:20px;
			height:20px;
			border-radius:10px;
			color:#e8401f;
			font-weight: bold;
			line-height:19px;
			text-align:center;
			border:1px solid #e8401f;
		}
		#language{
			font-size: 14px;
			background: #f7f7f7;
			border: 1px solid #dcdcdc;
			padding: 8px 12px 8px 12px;
			margin: 0 6px;
			border-radius: 5px;
			color: #8d8d8d;
			cursor: pointer;
			background-repeat: no-repeat;
		}
	</style>
</head>
<body>
	<!-- 头部 -->
	<header>
		<div class="left">
			<img src="images/sp3_3.png" alt="">
		</div>
		<div class="title">${sessionScope.shopMsg.name2}</div>
		<div class="right" style="margin-right: 30px;"><input id="language" type="button" value="china" onclick="toChinaPage();"></div>
		<script>
			// 去中文界面
			function toChinaPage(){
				location.href = getHostName()+"/webApp-shop/home.jsp";
			}
		</script></header>
    <div class="categary">
    	<div class="searchTop">
    		<div class="iptSearch">
    			<input id="iptGoodsName" type="text" placeholder="Si prega di inserire il nome del prodotto">
    			<div id="btnSearch" class="btn btnSure m0">ricerca</div>
    		</div>
    	</div>
        <div id="categary-left" class="categary-left">
            <ul>
<!--            <li class=""><a href="javascript:;">热门推荐</a></li>
                <li class="active"><a href="javascript:;">潮流女装</a></li>
                <li class=""><a href="javascript:;">品牌男装</a></li>
                <li class=""><a href="javascript:;">内衣配饰</a></li>
                <li class=""><a href="javascript:;">家用电器</a></li>
                <li class=""><a href="javascript:;">电脑办公</a></li>-->
            </ul>
        </div>
        <div class="categary-right">
            <div class="right-in">
				<ul id="product-info" class="product-info">
<!-- 					<li>
						<div class="left-img">
							<a href="#">
								<img src="images/01.jpg" alt="">
							</a>
						</div>
						<div class="middle-info">
							<div class="product-name">菲律宾帝皇蕉菲律宾帝皇蕉菲律
							</div>
							<div class="product-price">
								€2.50/kg
							</div>
						</div>
						<div class="right-num">
							<span id="minusOne" class="iconfont  icon-jian minusOne"></span>
							<span id="num" class="num"> 0 </span>
							<span id="addOne" class="iconfont  icon-jia addOne"></span>
						</div>
					</li> -->
				</ul>
            </div>
        </div>
    </div>

    <!-- 商品列表Max -->
    <div id="maxGoodsList" class="maxGoodsList">
    	<div id="maxIn" class="maxIn">
	    	<div class="head">
    			<span class="iconfont icon-cart"></span>
	    	</div>
	    	<ul id="maxShoppingList">
<!-- 	    		<li>
	    			<div class="shopInfo">
		    			<div class="shopName">2153中国芹菜 China Celery</div>
		    			<div class="shopPrice">€3</div>
		    			<div class="shopNum">4kg</div>
	    			</div>
	    			<div class="btnDel">
	    				<span class="btnClear iconfont icon-cart"></span>
	    				<span class="btnAdd iconfont icon-cart"></span>
	    				<span class="btnMinus iconfont icon-cart"></span>
	    			</div>
	    		</li> -->

<!-- 	    		<div id="btnClear" class="clear">
	    			<span class="iconfont icon-cart"></span>清空购物车
	    		</div> -->
	    	</ul>
    	</div>
    </div>

    <!-- 商品列表Min -->
    <div id="minGoodsList" class="minGoodsList">
    	<div class="sign">
    		<div id="GoodsNum" class="GoodsNum">0</div>
    		<span class="iconfont icon-cart"><span>
    	</div>
    	<div id="btnPrice" class="btnPrice">€ 0.00</div>
		<script>
			// 去结算
			function btnPay(user){
					location.href = getHostName()+"/webApp-shop2/shoppingCar.jsp";
			}
		</script>
    	<div id="btnPay" class="btnPay" onclick="btnPay()">insediamento</div>
    </div>
	<!-- 模态框 -->
    <div id="mask" class="mask">
    	<div class="close"><span id="close">X</span></div>
    	<p class="txt">Sei sicuro di voler rimuovere questo articolo dal tuo carrello?</p>
    	<div class="btn">
    		<button id="btnSure" class="btnSure">determinare</button>
    		<button id="btnCancel" class="btnCancel">annullato</button>
    	</div>
    </div>

    <div id="maskBody" class="maskBody"></div>
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

	<script>
		$(function(){
			if(${sessionScope.user == null}){
				//用户没有登录跳转登录页面
				location.href = "${pageContext.request.contextPath}/webApp-shop2/login.jsp";
			}else{
				loadRemoteData("${sessionScope.adminMsg.id}","${sessionScope.adminMsg.username}");
			}
		})
	</script>
</body>
</html>