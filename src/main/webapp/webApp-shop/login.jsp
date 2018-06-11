<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="${pageContext.request.contextPath}/webApp-shop/js/ContextPath.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/login.css">
	<title>login</title>
</head>
<body style="background-color: white">
	<div class="container">
		<!-- Header -->
		<header>
			<!-- <div class="left"></div> -->
			<div class="title">登录</div>
		</header>
		<section class="login">
			<img src="${pageContext.request.contextPath}/webApp-shop/images/sp3_3.png" alt="" style="width: 60%;margin: 0 auto" >
			<br>
			<form action="#">
				<div class="login-email">
					<span class="ico-email"></span>
					<input id="iptEmail" class="iptEmail" type="text" placeholder="请输入用户名" maxlength="20" required />
				</div>
				<div class="login-pwd">
					<span class="ico-lock"></span>
					<input id="iptPwd" class="iptPwd" type="password" placeholder="请输入密码" maxlength="20" required />
				</div>
				<div class="runRegeister">
					<a href="getAccount.jsp" class="txtRegeister" style="margin-left: auto;color: red">获取账号</a>
				</div>
				<div class="login-button">
					<input id="btnLogin" class="iptButton" type="button" value="登录" />
				</div>
			</form>
		</section>
	</div>
	<script src="js/lib/zepto.min.js"></script>
	<script src="js/login_regeister.js"></script>
</body>
</html>