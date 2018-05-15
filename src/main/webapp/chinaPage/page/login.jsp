<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>登录 - 福田食品</title>
<link href="${pageContext.request.contextPath}/chinaPage/css/login.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/chinaPage/css/pop_cheat.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/chinaPage/js/jquery.min.js"></script>
<script>
  $(function () {
      $("#validate_val").blur(function () {
          var   validate   =   $("#validate_val").val()
          if(validate.trim()==""){
              $("#validate_error").text("验证码错误")
              return false;
          }else{
          $.ajax({
              url :  "${pageContext.request.contextPath}/code/validateCheck",
              data :  {"validate":validate},
              type : "post",
              success :  function (result) {
                  if(result=="success"){
                      $("#validate_error").empty()
                  }else{
                      $("#validate_error").text("验证码错误")
                  }
              }
          })}
      })

      $("#submitLoginBtn").click(function () {
          $("#validate_val").blur()
          var  username =  $("#txtUsername").val()
          var  password =  $("#txtPassword").val()
          var  tip  =  check()
          if(tip!=""){
              return false;
          }else{
          $.ajax({
              url :  "${pageContext.request.contextPath}/user/login",
              data :  {"username":username,"password":password},
              type : "post",
              dataType : "json",
              success :  function (result) {
                  if(result=="success"){
                    location.href = "${pageContext.request.contextPath}/chinaPage/page/booklist.jsp"
                  }else{
                     alert("您输入有误")
                  }
              }
          })}

      })
  })

  function  check(){
      var tips = $("#validate_error").text()
      return tips;
  }

  function  changeImage(){
    $("#validateImage").prop("src","${pageContext.request.contextPath}/code/getCode.do?"+(new Date()).toLocaleString())
  }
</script>
</head>
<body>
<div class="head"> <a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}"> <img src="${pageContext.request.contextPath}/chinaPage/img/sp3_3.png" style="width:190px;"/> </a>
  <div class="improve"><img src="${pageContext.request.contextPath}/chinaPage/img/bz.jpg" width="118" height="61" /> </div>
</div>

<div class="login_bg" style="width:960px; margin:0 auto;"> <img src="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" style="display: none;">
<div id="J_cheatProofTop" class="new_tip" >
  <div id="component_2747856"></div>
  <div> 为保障账户安全，请勿设置与邮箱及其他网站相同的账户登录密码或支付密码，<a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">谨防诈骗</a>！ </div>
</div>
  <div class="set_area clearfix" style="margin-top: 30px">
    <div class="wrap clearfix">
      <div id="J_loginDiv">
        <link href="https://login.dangdang.com/style/login_core_mobile_code.css?20160804" rel="stylesheet" type="text/css">
        <link href="https://login.dangdang.com/style/captcha.css?20160727" rel="stylesheet" type="text/css">
        <div id="J_loginCoreWrap" class="infro">
          <div class="username" id="username_div"> <span></span>
            <input style="display:none">
            <input class="user" id="txtUsername"   name="txtUsername" type="text" autocomplete="off" maxlength="40" value="" errordata="0" tabindex="1">
            <a class="text_del" id="clearUsername" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" style="display:none;"></a> <a class="replacetype01 " id="selectusertype" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" style="display:none;">更换类型</a><span class="placeholder" style="position: absolute; z-index: 20; color: rgb(176, 176, 176); width: 270px; height: 34px; font-size: 13.3333px; padding-left: 0px; font-family: 'Microsoft Yahei'; top: 0px; left: 40px; line-height: 34px; display: none; background: none;">邮箱/昵称/手机号码</span></div>
          <p id="user_mindstyle" class="tips"> <span id="liDivErrorMessage" style="display: none;">请输入邮箱/昵称/手机号码</span> <span class="error_choose" id="selecttype" style="display: none;"> <b>请选择用户类型</b>
            <input id="selusertypemail" type="radio" value="" name="selusertype">
            <label class="error_nickname">昵称</label>
            <input id="selusertypemobile" type="radio" value="" name="selusertype">
            <label class="error_mobilename">手机号码</label>
            </span> </p>
          <div class="password" id="password_div"> <span></span>
            <input class="pass" id="txtPassword" name="txtPassword" type="password" maxlength="20" autocomplete="off" errordata="0" tabindex="2">
            <span class="placeholder" style="position: absolute; z-index: 20; color: rgb(176, 176, 176); width: 270px; height: 34px; font-size: 13.3333px; padding-left: 0px; font-family: 'Microsoft Yahei'; top: 116px; left: 65px; line-height: 34px; display: none; background: none;">密码</span></div>
          <p class="tips" id="pass_mindstyle"> <span id="login_password_error" style="display: none;">请填写长度为6-20个字符的密码</span> <span class="big_tip" id="passwordCapslock" style="display: none;">键盘大写锁定已打开，请注意大小写!</span> </p>
          <div id="J_rotateVcodeWrap" style="display:none;"></div>
          <div class="username" id="validate_div"> <span style="background-position:10px -190px;"></span>
            <input style="display:none">
            <input style="width:160px" class="user" id="validate_val" name="txtUsername" type="text" autocomplete="off" maxlength="40" value="" errordata="0" tabindex="3">
            <img onclick="changeImage()" id="validateImage" src="${pageContext.request.contextPath}/code/getCode.do" class="Ucc_captcha Captcha-image">
            <a class="text_del" id="clearValidate" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" style="display:none;"></a></div>
            <div id="validate_error" style="color:red;height:30px;padding-top:4px"></div>
          <div id="J_vcodeWrap" style="display:none;">
            <div class="code_wrap" id="inputcode" style="display:block;">
              <div class="code" id="vcode_model"> <span></span>
                <input class="codes" id="txtVerifyCode" name="txtVerifyCode" type="text" maxlength="4" autocomplete="off" tabindex="3" errordata="0" style="">
                <label class="pwdReplace" id="codeReplacer" style="display: none;" for="txtVerifyCode">验证码</label>
                <span class="placeholder" style="position: absolute; z-index: 20; color: rgb(176, 176, 176); width: 0px; height: 0px; font-size: 13.3333px; padding-left: 0px; font-family: 'Microsoft Yahei'; display: none; top: 100px; left: 0px; line-height: 0px; background: none;">验证码</span></div>
              <a class="code_pic" id="vcodeImgWrap" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}"> <img id="imgVcode" tabindex="4"> </a> <a id="vcodeImgBtn" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" tabindex="5">换张图</a> </div>
            <p class="tips" id="vcode_mindstyle" style="display:block;"> <span id="login_vcode_error"></span> </p>
          </div>
          <p class="btn"><a id="submitLoginBtn"  tabindex="6">登&nbsp;录</a></p>
          <p class="register"> <a style="" id="J_loginToRegister" class="register_btn" href="${pageContext.request.contextPath}/chinaPage/page/register.jsp?adminId=${sessionScope.adminMsg.id}" tabindex="9">立即注册</a></p>

        </div>
        <div id="J_yidiLoginWrap" class="login_core infro" style="display: none;">
          <ul class="list">
            <li>
              <p class="tip">为了更好的保证您账户的安全，请进行短信验证</p>
            </li>
            <li>
              <div class="name">手机号：</div>
              <div id="J_nolocalMobile"></div>
            </li>
            <li>
              <div class="name">短信验证码：</div>
              <input id="J_ePhoneCode" name="" type="text" class="small" maxlength="6">
              <a id="J_getEPhoneCode" class="btn_check" href="javascript:;" onclick="return false;">获取验证码</a> <a id="J_unGetEPhoneCode" class="btn_uncheck unable" href="javascript:;" style="display:none;">获取验证码</a>
              <div id="J_ePhoneCodeTipInfo" class="ltip"></div>
            </li>
            <li> <a class="btn" id="J_ePhoneCodeSubmit" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" tabindex="6">登&nbsp;录</a></li>
          </ul>
        </div>
        <div id="J_yidiBindMobileWrap" class="login_core infro" style="display: none;">
          <ul class="list list-bind">
            <li>
              <p class="tip-bind">您的账户安全级别较低，建议您绑定手机，提升安全的同时享受丰富的手机服务</p>
            </li>
            <li>
              <div class="name-bind">手机号：</div>
              <input id="J_txtMobile" name="" type="text" class="long-bind" maxlength="11">
              <span id="J_txtMobileTipImg" class="icon"></span>
              <div id="J_txtMobileTipInfo" class="ltip-bind"></div>
            </li>
            <li>
              <div class="name-bind">验证码：</div>
              <input id="J_smsVCode" name="" type="text" class="small-bind" maxlength="6">
              <span id="J_smsVCodeTipImg" class="icon code_w"></span> <a id="J_getSmsVCode" class="btn-check-bind" href="javascript:;" onclick="return false;">获取验证码</a><a id="J_unGetSmsVCode" class="btn-uncheck-bind unable" href="javascript:;" style="display:none;">获取验证码</a>
              <div id="J_smsVCodeTipInfo" class="ltip-bind"></div>
            </li>
            <li><a class="btn-bind" id="J_smsVCodeSubmit" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">确&nbsp;定</a>
              <p class="later"><a id="J_laterBind" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">稍后绑定&gt;</a></p>
            </li>
          </ul>
        </div>

      </div>
    </div>

</div>
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
<div class="footer_nav_box" >
  <div class="footer_nav" style="margin-top: 30px"><a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" target="_blank" rel="nofollow">福田食品</a><span class="sep">|</span><a href="http://mainriversoft.com/main.jsp" target="_blank">MainRiverSoft.com</a><span class="sep">|</span><a href="http://mainriversoft.com/main.jsp" target="_blank">网站联盟</a><span class="sep">|</span><a href="http://mainriversoft.com/file/toabout" target="_blank">关于招商</a><span class="sep">|</span><a href="http://mainriversoft.com/file/toabout" target="_blank">官方Blog</a>
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
        <div class="validator"><a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp.jsp?adminId=${sessionScope.adminMsg.id}" target="_blank" class="footer_img"><img src="${pageContext.request.contextPath}/chinaPage/img/7d593c48-48f6-4fc9-85e0-7d6e10dfc2a2.hpvgUvc9"></a></div>
        <div class="validator"><a id="_pingansec_bottomimagesmall_brand" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" target="_blank"><img src="${pageContext.request.contextPath}/chinaPage/img/brand_128_47.png"></a></div>
        <div class="clear"></div>
    </div>
</div>
<script>
  $(function(){
    var userLogin = "${sessionScope.user}";
    if (userLogin!="") {
      // console.log("非空");
      window.location="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}";
    }

  })
</script>
</body>
</html>