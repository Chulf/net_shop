<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>Personal center</title>
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
		<div class="title">My Order</div>
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
						Hello<span id="username"></span>，respected user
					</p>
					<div class="id" id="cont">
						username:<font color="green"> ${sessionScope.user.username}</font>
					</div>
				</div>
				<div id="btnLogin" class="btn btnLogin" onclick="jumpToLogin()">Login</div>
			</div>
		<!-- 列表 -->
		<script>

			if(${sessionScope.user == null}){
				//document.getElementById("btnLogin")
				document.querySelector("#cont").innerHTML = "Please log in first";
			}else{
				document.querySelector("#btnLogin").remove();
			}

			// 登录
			function jumpToLogin(){
				window.location.href = "${pageContext.request.contextPath}/webApp-shop3/login.jsp";
			}

			// 我的订单
			function jumpToOrder(){
				if(${sessionScope.user != null}){

					window.location.href = "${pageContext.request.contextPath}/webApp-shop3//orderList.jsp";
				}else {
					window.location.href = "${pageContext.request.contextPath}/webApp-shop3/login.jsp";
				}
			}

		</script>
			<ul>
				<li id="myOrder" onclick="jumpToOrder()">
					<i class="iconfont icon-form"></i>
					<span>My Order</span>
					<b class="iconfont icon-more"></b>
				</li>
			</ul>
		<div class="copyright">Made by：<a href=" ">mainriversoft.com</a ></div>
	</section>

	<!-- 底部 -->
	<footer>
		<ul>
			<a href="home.jsp">
				<li>
					<i class="iconfont icon-category"></i>
					<span>Purchase</span>
				</li>
			</a>
			<a href="shoppingCar.jsp">
				<li>
					<i class="iconfont icon-cart"></i>
					<span>Shopping cart</span>
				</li>
			</a>
			<a href="mine.jsp">
				<li>
					<i class="iconfont icon-account"></i>
					<span>Personal center</span>
				</li>
			</a>
		</ul>
	</footer>
	<script src="js/lib/zepto.min.js"></script>

</body>
</html>