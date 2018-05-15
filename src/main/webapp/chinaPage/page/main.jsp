<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>

<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/chinaPage/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/chinaPage/css/index-style.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/chinaPage/js/jquery.min.js"></script>
</head>
<body>
<%@include file="header.jsp" %>
<div class="long_banner">
    <img src="${pageContext.request.contextPath}/chinaPage/img/1200x65_sk_1229.jpg"/>
</div>
<div class="nav">
    <div class="fl nav_aside">
        <ul id="category" class="nav_aside_box">
            <!-- 这里是商品的类别  -->
        </ul>
    </div>
    <div class="fl slider_banner">
        <div class="slider_img_box">
            <img src="${pageContext.request.contextPath}/chinaPage/img/750x315wen0103.jpg"/>
        </div>
    </div>
    <div class="fr owner">
        <div class="owner_box">
            <div class="owner_img fl">
                <img src="${pageContext.request.contextPath}/chinaPage/img/cscs-0105.jpg"/>
                <div class="owner_name_box">
                    <p class="owner_name">${sessionScope.adminMsg.username}</p>
                </div>
            </div>
            <div class="owner_user fr">
                <ul>
                    <li>等级:<h1>5</h1></li>
                    <li>信用:<h1>5</h1></li>
                    <li>销量:<h1>100</h1></li>
                </ul>
            </div>
        </div>


        <div class="owner_btns">
            <input id="btnLogin" type="button" name="" onclick="toLogin()" value="登录"/>
            <input type="button" name="" onclick="toRegist()" value="注册"/>
            <input type="button" name="" onclick="toAdmin()" value="成为商家"/>
        </div>
        <script type="text/javascript">
            var userLogin = "${sessionScope.user}";
            console.info("用户信息："+userLogin);
            if (userLogin != "") {

                $("#btnLogin").css("display", "none");
            }
        </script>
        <script type="text/javascript">
            function jumpToPage(url) {
                location.href = url + "?adminId=${sessionScope.adminMsg.id}"
            }
            function toLogin() {
                jumpToPage("${pageContext.request.contextPath}/chinaPage/page/login.jsp");
            }
            function toRegist() {
                jumpToPage("${pageContext.request.contextPath}/chinaPage/page/register.jsp");
            }
            function toAdmin() {
                jumpToPage("${pageContext.request.contextPath}/chinaPage/page/login.jsp");
            }
        </script>

    </div>
</div>
<div class="content_wrap">
    <fieldset id="sellByShop" class="recommend fl">
        <legend>店家推荐</legend>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
    </fieldset>
    <fieldset id="sellByCount" class="hot fr">
        <legend>单品热卖</legend>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
        <div class="content fl">
            <img src="../img/1900513383-1_l_3.jpg"/>
            <p>这是商品标题</p>
        </div>
    </fieldset>
</div>
<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
    //构建菜单数据
    var content = "";

    $.ajax({
        url: "${pageContext.request.contextPath}/category/findCategorys.do",
        dataType: "json",
        data: "adminId=${sessionScope.adminMsg.id}",
        success: function (data) {
            $.each(data, function (index, o) {
                content += "<li><a href='${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?id=" + o.id + "&name=" + o.name + "&adminId=${sessionScope.adminMsg.id}'>" + o.name + "</a></li>";
            })
            document.getElementById("category").innerHTML = content;
        }
    })
</script>
<script type="text/javascript">

    function jumpToDetail(id) {
        location.href = "${pageContext.request.contextPath}/chinaPage/page/details.jsp?id=" + id + "&adminId=${sessionScope.adminMsg.id}"
    }


    //构建店家推荐数据
    var content2 = "<legend>店家推荐</legend>";

    $.ajax({
        url: "${pageContext.request.contextPath}/product/findProductsMain.do",
        data: "adminId=${sessionScope.adminMsg.id}",
        dataType: "json",
        success: function (data) {
            console.info(data);
            $.each(data, function (index, o) {
                content2 += "<div class='content fl' onclick='jumpToDetail(\"" + o.id + "\");'>"
                        + "<img src='http://${pageContext.request.serverName}/net_shop_manager/" + o.imgsrc + "' width='150' height='150'/>"
                        + "<p>" + o.name + "</p>"
                        + "</div>"
            })
            document.getElementById("sellByShop").innerHTML = content2;
        }
    })
</script>
<script type="text/javascript">
    //构建单品热卖数据
    var content3 = "<legend>单品热卖</legend>";

    $.ajax({
        url: "${pageContext.request.contextPath}/product/findProductsMain.do",
        data: "adminId=${sessionScope.adminMsg.id}",
        dataType: "json",
        success: function (data) {
            console.info(data);
            $.each(data, function (index, o) {
                content3 += "<div class='content fl' onclick='jumpToDetail(\"" + o.id + "\");'>"
                        + "<img src='http://${pageContext.request.serverName}/net_shop_manager/" + o.imgsrc + "' width='150' height='150'/>"
                        + "<p>" + o.name + "</p>"
                        + "</div>"
            })
            document.getElementById("sellByCount").innerHTML = content3;
        }
    })
</script>
</html>
