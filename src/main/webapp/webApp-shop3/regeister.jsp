<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<script src="${pageContext.request.contextPath}/webApp-shop/js/ContextPath.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/login.css">
	<title>Registered</title>
</head>
<body style="background-color: white">
	<div class="container">
		<!-- Header -->
		<header>
			<div class="title">Registered</div>
		</header>

		<section class="regeister">
			<form action="#">
				<div class="login-username">
					<span class="ico-username"></span>
					<input id="iptUsername" class="iptUsername" type="text" placeholder="Please enter user name" />
					<i class="errorUsername"></i>
				</div>
				<div class="login-pwd">
					<span class="ico-lock"></span>
					<input id="iptPwd" class="iptPwd" type="password" placeholder="Please enter your password" />
					<i class="errorPwd"></i>
				</div>
				<div class="login-confirmPwd">
					<span class="ico-lock"></span>
					<input id="iptConfirmPwd" class="iptConfirmPwd" type="password" placeholder="Please enter the confirmation password" />
					<i class="errorConfirmPwd"></i>
				</div>
				<div class="login-tel">
					<span class="ico-tel"></span>
					<input id="iptTel" class="iptTel" type="text" placeholder="Please enter the phone number" />
					<i class="errorTel"></i>
				</div>
				<div class="login-email">
					<span class="ico-email"></span>
					<input id="iptEmail" class="iptEmail" type="text" placeholder="Please input your email" />
					<i class="errorEmail"></i>
				</div>
				<div class="login-code">
					<input id="iptCode" class="iptCode" type="text" placeholder="Please enter verification code" />
					<img id="VerCode" src="" alt="">
					<i class="errorCode"></i>
				</div>
				<div class="login-button">
					<input id="btnRegeister" class="iptButton" type="button" value="Registered" />
				</div>
			</form>
		</section>
	</div>
	<script src="js/lib/zepto.min.js"></script>
	<script src="js/login_regeister.js"></script>
</body>
</html>