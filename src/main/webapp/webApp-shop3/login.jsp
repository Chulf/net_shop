<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="${pageContext.request.contextPath}/webApp-shop3/js/ContextPath.js"></script>
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
			<div class="title">Login</div>
		</header>
		<section class="login">
			<img src="${pageContext.request.contextPath}/webApp-shop3/images/sp3_3.png" alt="" style="width: 60%;margin: 0 auto" >
			<br>
			<form action="#">
				<div class="login-email">
					<span class="ico-email"></span>
					<input id="iptEmail" class="iptEmail" type="text" placeholder="Please enter user name" maxlength="20" required />
				</div>
				<div class="login-pwd">
					<span class="ico-lock"></span>
					<input id="iptPwd" class="iptPwd" type="password" placeholder="Please enter your password" maxlength="20" required />
				</div>
				<div class="runRegeister">
					<a href="getAccount.jsp" class="txtRegeister" style="margin-left: auto;color: red">Get an account</a>
				</div>
				<div class="login-button">
					<input id="btnLogin" class="iptButton" type="button" value="Login" />
				</div>
			</form>
		</section>
	</div>
	<script src="js/lib/zepto.min.js"></script>
	<script src="js/login_regeister.js"></script>
</body>
</html>