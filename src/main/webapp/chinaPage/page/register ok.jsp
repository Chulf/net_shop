<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册 - 福田食品</title>
<link type="text/css" href="${pageContext.request.contextPath}/chinaPage/css/register_150706.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/chinaPage/css/unite_header_1129.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/chinaPage/js/zhuce/pagetop_20121010.js"type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/chinaPage/js/jquery.min.js"></script>
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
							<!--<span class="dd_more"><a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" class="home">当当首页</a><a href=" ${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">注册帮助</a></span>
							<a href="javascript:void(0);" class="head_a head_a1">新用户注册</a>-->

						</div>
						<div class="body zccg">
							<p>恭喜您，注册成功！</p>
                            <ul><li class="first">手机号码</li><li class="last">${sessionScope.user.phone}</li></ul>
                            <div class="zccg_btn"><a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">立即购物</a><span><em id="time">6</em>秒后自动返回……</span></div>
						</div>
					</div>
				</div>
			</div>
            <input id="btn_confirm" style="display: none" type="submit">
			<input name="hdn_username" id="hdn_username" type="hidden">
			<input name="hdn_mobile" id="hdn_mobile" type="hidden">
			<input name="hdn_password" id="hdn_password" type="hidden">
			<input name="action_post" id="action_post" value="register" type="hidden">

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
        <div class="validator"><a href=" ${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" target="_blank" class="footer_img"><img src="${pageContext.request.contextPath}/chinaPage/img/validate.gif"></a></div>
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
            <a href=" ${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" tabindex="-1" id="urlknet" target="_blank" rel="nofollow"><img alt="可信网站" name="CNNIC_seal" src="${pageContext.request.contextPath}/chinaPage/img/knetSealLogo.png" oncontextmenu="return false;" onclick="CNNIC_change('urlknet')" width="128" height="47" border="true"></a><!-- 可信网站LOGO安装结束 -->
        </div>
        <div class="validator"><a href=" ${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" target="_blank" class="footer_img"><img src="${pageContext.request.contextPath}/chinaPage/img/7d593c48-48f6-4fc9-85e0-7d6e10dfc2a2.hpvgUvc9"></a></div>
        <div class="validator"><a id="_pingansec_bottomimagesmall_brand" href=" ${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" target="_blank"><img src="${pageContext.request.contextPath}/chinaPage/img/brand_128_47.png"></a></div>
        <div class="clear"></div>
    </div>
</div>
<script>
	$(function(){
		var s = 5;
		var i = setInterval(function(){
			$("#time").html(s--);
			if(s===0){
				window.location="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}";
				clearInterval(i);
			}
		},1000)
	})

</script>
</body>
</html>