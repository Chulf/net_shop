<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册 - 福田食品</title>
<link type="text/css" href="${pageContext.request.contextPath}/chinaPage/css/register_150706.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/chinaPage/css/unite_header_1129.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/chinaPage/js/zhuce/pagetop_20121010.js"type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/chinaPage/js/jquery.min.js"></script>
<script src="" ></script>
<script >
	$(function () {
        $("#txt_vcode").blur(function () {
            var   validate   =   $("#txt_vcode").val()
            $.ajax({
                url :  "${pageContext.request.contextPath}/code/validateCheck",
                data :  {"validate":validate},
                type : "post",
                success :  function (result) {
                    if(result=="success"){
                        $("#J_tipVcode").empty()
                    }else{
                        $("#J_tipVcode").text("验证码错误")
                    }
                }
            })
        })
        $("#ueamil").blur(function () {
            var   mail   =   $("#ueamil").val()
            if(mail.trim()!=""){
                var corr = /^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/
				if(!corr.test(mail)){
					$("#J_tipSureEmail").text("邮箱格式错误")
				}else{
                    $("#J_tipSureEmail").empty()
				}
			}else{
                $("#J_tipSureEmail").empty()
			}
        })

		$("#txt_username").blur(function () {
		    var  username = $("#txt_username").val()
			$.ajax({
                url :  "${pageContext.request.contextPath}/user/checkUsername",
                data :  {"username":username},
                type : "post",
                success :  function (result) {
                    if(username.trim()==""){
                        $("#J_tipUsername").text("用户名不能为空")
                    }else{
                        if(result=="success") {
                            $("#J_tipUsername").html("<font  color = 'green'>恭喜，用户名可以使用</font>")
                        }else{
                            $("#J_tipUsername").text("用户名已经被使用")
                        }
                    }
                }
            })
        })

    $("#txt_password").blur(function () {
        if($("#txt_password").val().trim()==""){
			$("#J_tipPassword").text("密码不能为空")
        }else{
            $("#J_tipPassword").empty()
		}
    })

   $("#txt_repassword").blur(function () {
         if($("#txt_repassword").val()!=$("#txt_password").val()){
            $("#J_tipSurePassword").text("两次密码不一致")
         }else{
             $("#J_tipSurePassword").empty()
		 }
    })

        $("#telphone").blur(function () {
            var myreg=/^[0-9][0-9][0-9]{8,10}$/;
            if($("#telphone").val().trim()==""){
                $("#J_tipSureTel").text("手机号不能为空")
            }else{
                if(!myreg.test($("#telphone").val())){
                    $("#J_tipSureTel").text("手机号不合法")
				}else{
                    $("#J_tipSureTel").html("<font color = 'green'>手机号合法</font>")
				}

			}
        })

        $("#J_submitRegister").click(function () {
            if($("#txt_vcode").val().trim()==""){
                alert("请输入验证码!")
				return false
			}else{
            var  flag = true
            $("#txt_username").blur()
			$("#txt_password").blur()
            $("#telphone").blur()
			$("#ueamil").blur()
            var  utip =  $("#J_tipUsername").text()
			var  ptip = $("#J_tipPassword").text()
            var retip = $("#J_tipSurePassword").text()
            var teltip = $("#J_tipSureTel").text()
			var mailtip = $("#J_tipSureEmail").text()

			if(utip!="恭喜，用户名可以使用"){
				flag =false
			}
            if(ptip!=""){
                flag =false
            }
            if(retip!=""){
                flag =false
            }
            if(teltip!="手机号合法"){
                flag =false
            }
            if(mailtip!=""){
                flag =false
			}

            if(flag == true){
            $("#txt_vcode").blur()
			var  tips = 	check()
			if(tips==""){
            var  username =  $("#txt_username").val()
            var  password =  $("#txt_password").val()
            var  tel =  $("#telphone").val()
			var  email = $("#ueamil").val()
            $.ajax({
                url :  "${pageContext.request.contextPath}/user/register",
                data :  {"username":username,"password":password,"phone":tel,"email":email},
                type : "post",
                success :  function (result) {
                    location.href = "${pageContext.request.contextPath}/chinaPage/page/register ok.jsp"
                }
            })}else{
			    alert("请输入正确的验证码")
            }
            }else{
            	alert("您输入有误，请检查输入")
            }
            }
        })

	})

    function  changeImage(){
        $("#imgVcode").prop("src","${pageContext.request.contextPath}/code/getCode.do?"+(new Date()).toLocaleString())
    }

    function  check(){
        var tips = $("#J_tipVcode").text()
        return tips;
    }


</script>
</head>

<body>
<div class="ddnewhead_wrap">
    <div class="ddnewhead_content ddnewhead_content2">
        <div class="ddnewhead_operate" id="__ddnav_menu">

    </div>
             <div class="ddnewhead_logo"><a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" title="返回首页" name="ddnav_logo"><img src="${pageContext.request.contextPath}/chinaPage/img/sp3_3.png" style="width:100%" alt="福田食品"></a></div>
      <div class="clear"></div>
    </div>
     <div class="ddnewcarthead_bottom"></div>
</div>
<form id="register_form" method="post" action="register.php" onsubmit="return false;">
        	<input style="display: none;" type="password">
            <div id="bd">
				<!--默认-->
				<div class="shadow_box">
					<div class="register_box">
						<div class="head">
							<span class="dd_more"><a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" class="home">首页</a><a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">注册帮助</a></span>
							<a href="javascript:void(0);" class="head_a head_a1">新用户注册</a>

						</div>
						<div class="body">
							<div id="J_cheatProofTop" class="new_tip" style="display:none;">贴心提示：请勿设置与邮箱密码相同的账户登录密码或支付密码，防止不法分子窃取您的账户信息，<a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">谨防诈骗</a>！</div>
							<table width="100%" cellspacing="0" cellpadding="0" border="0">
								<tbody><tr>
									<td class="t">用户名</td>
									<td class="z_index2">
										<input name="username" id="txt_username" autocomplete="off" maxlength="40" tabindex="1" value="" placeholder="请输入您的用户名" class="text" type="text"><%--<span id="spn_username_ok" class="icon_wrong" style="display: inline-block;">--%></span>
										<span id="J_tipUsername" class="cue"><a href="signin.php?Email=15901551248" name="mobile_login _link" class="more"></a></span>
										<ul class="email_select" id="select_emaildomain" style="display: none;"><li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin=""></li><li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@qq.com"></li><li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@163.com"></li>
                                        <li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@126.com"></li><li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@sina.com"></li> <li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@hotmail.com"></li><li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@sohu.com"></li> <li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@gmail.com"></li><li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@tom.com"></li> <li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@139.com"></li><li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@21cn.com"></li> <li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@yeah.net"></li><li onmouseout="this.className=&quot;&quot;" onmouseover="this.className=&quot;hover_domain&quot;" title="" domin="@sina.cn"></li></ul>
									</td>
								</tr>
								<tr>
									<td class="t">登录密码</td>
									<td>
										<input name="password" id="txt_password" onpaste="return false;" tabindex="2" class="text" maxlength="20" type="password">
										<span id="spn_password_ok" class="icon_yes" style="display: none;"></span>
										<span id="J_tipPassword" class="cue"></span>
										<span id="J_tipUpperCaseBox" class="prompt" style="display: none;"><span class="icon"></span>键盘大写锁定已打开，请注意大小写!</span>
										<span id="spnPwdStrongTips">
											<span id="spnPwdStrong1" class="cue warn j_pwdStrong" style="display: none;">
												<span class="msg_level"><span class="s1"></span><span></span><span></span></span>密码过于简单
											</span>
											<span id="spnPwdStrong2" class="cue warn j_pwdStrong" style="display: none;">
												<span class="msg_level"><span class="s1"></span><span class="s2"></span><span></span></span>试试字母、符号、数字的组合更安全
											</span>
											<span id="spnPwdStrong3" class="cue warn j_pwdStrong" style="display: none;">
												<span class="msg_level"><span class="s1"></span><span class="s2"></span><span class="s3"></span></span>密码设置安全，放心使用
											</span>
										</span>
									</td>
								</tr>
								<tr>
									<td class="t">确认密码</td>
									<td>
										<input  id="txt_repassword" name="txt_repassword" onpaste="return false" tabindex="3" class="text" maxlength="20" type="password"><span id="spn_repassword_ok" class="icon_wrong" style="display: none;"></span>
										<span id="J_tipSurePassword" class="cue"></span>
									</td>
								</tr>
								<tr>
									<td class="t">手机号</td>
									<td>
										<input  id="telphone" name="phone" onpaste="return false" tabindex="3" class="text" maxlength="20" type="text"><span id="spn_repassword_ok" class="icon_wrong" style="display: none;"></span>
										<span  id = "J_tipSureTel" class="cue"></span>
									</td>
								</tr>
								<tr>
									<td class="t">邮箱</td>
									<td>
										<input id="ueamil" name="email" onpaste="return false" tabindex="3" class="text" maxlength="20" type="text"><span id="spn_repassword_ok" class="icon_wrong" style="display: none;"></span>
										<span  id = "J_tipSureEmail" class="cue"></span>
									</td>
								</tr>
								<tr id="J_mobileV" style="display:none">
									<td class="t">手机验证</td>
									<td>
										<input name="mobile" id="txt_mobile" maxlength="11" tabindex="4" class="text" placeholder="请输入你要验证的手机号码" type="text"><span id="spn_mobile_ok" class="icon_yes" style="display: none;"></span>
										<span id="J_tipMobile" class="cue warn"></span>
									</td>
								</tr>
								<tr>
									<!-- 图形验证码 -->
									<td class="t j-vcode">验证码</td>
									<td class="j-vcode">
										<input class="text pin" id="txt_vcode" name="txt_vcode" autocomplete="off" placeholder="请输入验证码" maxlength="5" tabindex="5" type="text">
										<a class="code_pic" id="vcodeImgWrap" name="change_code_img">
											<img id="imgVcode" onclick="changeImage()" title="点击更换验证码" alt="点击更换验证码" src="${pageContext.request.contextPath}/code/getCode.do" width="100" height="37">
										</a>
										<a id="vcodeImgBtn" name="change_code_link" class="code_picww"  onclick="changeImage()">换张图</a>
										<span id="spn_vcode" class="icon_yes pin_i" style="display: none;"></span>
										<span id="J_tipVcode" class="cue warn"></span>
										<!--<span class="icon_wrong pin_i"></span>-->
									</td>
									<!-- 短信验证码 -->
									<td class="t j-phoneVcode" style="display: none">短信验证码</td>
									<td class="j-phoneVcode" style="display: none">
										<input id="J_MobileCode" name="txt_pop_sms_vcode" autocomplete="off" maxlength="6" tabindex="6" class="text pin" placeholder="请填写短信验证码" type="text">
										<a class="get_pin get_pinUnClick" id="J_countDownTip" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" style="display: none;" tabindex="5">2分钟后重新获取</a>
										<a class="get_pin" id="sendMobileCode" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" tabindex="5">获取短信验证码</a>
										<span id="spn_mobileCode_ok" class="icon_yes" style="display: none;"></span>
										<span id="J_tipMobileCode" class="cue"></span>
									</td>
								</tr>
								<tr>
									<td class="t">&nbsp;</td>
									<td class="clause">
										<span class="float_l">
											<input id="chb_agreement" name="chb_agreement" onmouseover="this.style.cursor='pointer';this.style.cursor='hand';" tabindex="7" checked="checked" type="checkbox">我已阅读并同意
										</span>
										<span id="J_tipAgreement" class="cue"></span>
									</td>
								</tr>
								<tr>
									<td class="t">&nbsp;</td>
									<td><a id="J_submitRegister"   class="btn_login" tabindex="10">立即注册</a><a id="J_submitRegisterUnclick" style="display: none;" class="btn_login">注册中...</a></td>
								</tr>
							</tbody></table>
						</div>
					</div>
				</div>
			</div>
            <input id="btn_confirm" style="display: none" type="submit">
			<input name="hdn_username" id="hdn_username" type="hidden">
			<input name="hdn_mobile" id="hdn_mobile" type="hidden">
			<input name="hdn_password" id="hdn_password" type="hidden">
			<input name="action_post" id="action_post" value="register" type="hidden">
			<input name="returnurl" id="returnurl" value="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" type="hidden">
        </form>
        <style type="text/css">
    .footer_nav_box{border-top: 1px solid #ebebeb;width:100%;_width:expression(this.scrollWidth < 960 ? "960px" : "auto");min-width: 960px;padding: 17px 0 50px;}
    .footer_nav_box a,.footer_nav_box{color: #8c8c8c;font-size: 12px;text-decoration: none;}
    .footer_nav_box a:hover{color: #f48570;text-decoration: underline;}
    .footer_nav_box .footer_nav{text-align: center;line-height: 20px;padding-bottom: 17px;padding-top: 25px;}
    .footer_nav_box .footer_nav span.sep{margin: 0 17px 0 19px;}
    .footer_nav_box .footer_copyright{line-height: 20px;text-align: center;width: 960px;margin: 0 auto;}
    .footer_nav_box .footer_copyright span.sep{margin:0 17px 0 19px;}
    .footer_nav_box .footer_icon{padding: 10px 0 0 340px;width: 640px;margin: 0 auto;height: 77px;}
    .footer_nav_box .validator,.footer_nav_box .knet{float:left;display:inline;padding:15px 5px 15px;width:135px;height:47px;}

    .footer_copyright {padding: 10px 0 0 0; margin: 0 auto;float: none; width: auto;text-align: center;color: #8c8c8c;}
    .footer_copyright span, .public_footer .footer_copyright a.footer_img { display: inline-block; float: none; }
    .footer_copyright a { padding: 0 4px; color: #8c8c8c;font-size: 12px;text-decoration: none;}
    .footer_copyright a:hover{color: #f48570;text-decoration: underline;}
    .footer_nav_box .footer_nav .footer_hot_search{display:inline-block;*display:inline;width:50px;position:relative}
    .footer_nav_box .footer_nav .pos_a_box{position:absolute;left:-251px;top:22px;background-color:#f48570;width:300px;border-radius:8px;text-align:center;height:14px;line-height:14px}
    .footer_nav_box .footer_nav .pos_a_box a,.footer_nav_box .footer_nav .pos_a_box a:hover,.footer_nav_box .footer_nav .pos_a_box span{padding:0 2px;color:#fff;text-decoration:none}
    .footer_nav_box .footer_nav .pos_a_box i{display:block;width:0;height:0;line-height:0;font-size:0;border-width:0 4px 4px;border-style:solid;border-color:#fff #fff #f48570 #fff;position:absolute;right:20px;top:-4px}
</style>
<div class="footer_nav_box">
	<div class="footer_nav"><a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" target="_blank" rel="nofollow">福田食品</a><span class="sep">|</span><a href="http://mainriversoft.com/main.jsp" target="_blank">MainRiverSoft.com</a><span class="sep">|</span><a href="http://mainriversoft.com/main.jsp" target="_blank">网站联盟</a><span class="sep">|</span><a href="http://mainriversoft.com/file/toabout" target="_blank">关于招商</a><span class="sep">|</span><a href="http://mainriversoft.com/file/toabout" target="_blank">官方Blog</a>
		<script>
            var setTo = null;
            function showghotsearch() {
                clearTimeout(setTo);
                document.getElementById("hot_search_content").style.display = "block";
            }
            function hidehotsearch() {
                setTo = setTimeout(function() {
                    document.getElementById("hot_search_content").style.display = "none";
                }, 100)
            }
        </script>
    </div>
    <div class="footer_copyright"><span>Copyright (C) 福田食品 2000-2018, All Rights Reserved</span></div>
    <!-- 有三个icon的时候加footer_icon2 -->
    <div class="footer_icon footer_icon2" style="padding-left: 55px;">
        <div class="validator"><a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" target="_blank" class="footer_img"><img src="${pageContext.request.contextPath}/chinaPage/img/validate.gif"></a></div>
        <div class="knet"><!-- 可信网站LOGO安装开始 -->
            <script type="text/JavaScript">
                function CNNIC_change(eleId) {
                var str = document.getElementById(eleId).href;
                var str1 = str.substring(0, (str.length - 6));
                str1 += CNNIC_RndNum(6);
                document.getElementById(eleId).href = str1;
                }

                function CNNIC_RndNum(k) {
                var rnd = "";
                for (var i = 0; i < k; i++)
                rnd += Math.floor(Math.random() * 10);
                return rnd;
                }
            </script>
            <a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" tabindex="-1" id="urlknet" target="_blank" rel="nofollow"><img alt="可信网站" name="CNNIC_seal" src="${pageContext.request.contextPath}/chinaPage/img/knetSealLogo.png" oncontextmenu="return false;" onclick="CNNIC_change('urlknet')" width="128" height="47" border="true"></a><!-- 可信网站LOGO安装结束 -->
        </div>
        <div class="validator"><a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" target="_blank" class="footer_img"><img src="${pageContext.request.contextPath}/chinaPage/img/7d593c48-48f6-4fc9-85e0-7d6e10dfc2a2.hpvgUvc9"></a></div>
        <div class="validator"><a id="_pingansec_bottomimagesmall_brand" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" target="_blank"><img src="${pageContext.request.contextPath}/chinaPage/img/brand_128_47.png"></a></div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>
