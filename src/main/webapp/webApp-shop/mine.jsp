<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>个人中心</title>
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/iconfont.css">
	<link rel="stylesheet" href="css/header.css">
	<link rel="stylesheet" href="css/footer.css">
	<link rel="stylesheet" href="css/mine.css">
</head>
<body>
	<!-- 头部 -->
	<header>
		<div class="left"></div>
		<div class="title">我的订单</div>
		<div class="right"></div>
	</header>

	<section>
		<!-- 个人信息 -->
			<div class="mine">
				<!-- <div class="avatar">
					<img src="images/avatar.jpg" alt="">
				</div> -->
				<div class="info">
					<p>
						您好<span id="username"></span>，尊敬的用户
					</p>
					<div class="id" id="cont">
						用户名:<font color="green"> ${sessionScope.user.username}</font>
					</div>
				</div>
				<div id="btnLogin" class="btn btnLogin" onclick="jumpToLogin()">登录</div>
			</div>
		<!-- 列表 -->
		<script>

			if(${sessionScope.user == null}){
				//document.getElementById("btnLogin")
				document.querySelector("#cont").innerHTML = "请先登录";
			}else{
				document.querySelector("#btnLogin").remove();
			}

			// 登录
			function jumpToLogin(){
				window.location.href = "${pageContext.request.contextPath}/webApp-shop/login.jsp";
			}

			// 我的订单
			function jumpToOrder(){
				if(${sessionScope.user != null}){

					window.location.href = "${pageContext.request.contextPath}/webApp-shop//orderList.jsp";
				}else {
					window.location.href = "${pageContext.request.contextPath}/webApp-shop/login.jsp";
				}
			}

		</script>
			<ul>
				<li id="myOrder" onclick="jumpToOrder()">
					<i class="iconfont icon-form"></i>
					<span>我的订单</span>
					<b class="iconfont icon-more"></b>
				</li>
			</ul>
		<div class="copyright">网站制作：<a href=" ">mainriversoft.com</a ></div>
	</section>

	<!-- 底部 -->
	<footer>
		<ul>
			<a href="home.jsp">
				<li>
					<i class="iconfont icon-category"></i>
					<span>选购</span>
				</li>
			</a>
			<a href="shoppingCar.jsp">
				<li>
					<i class="iconfont icon-cart"></i>
					<span>购物车</span>
				</li>
			</a>
			<a href="mine.jsp">
				<li>
					<i class="iconfont icon-account"></i>
					<span>个人中心</span>
				</li>
			</a>
		</ul>
	</footer>
	<script src="js/lib/zepto.min.js"></script>

</body>
</html>