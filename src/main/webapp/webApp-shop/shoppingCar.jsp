<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="${pageContext.request.contextPath}/webApp-shop/js/ContextPath.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>购物车</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/iconfont.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/shoppingCar.css">
</head>
<body>s
<!-- 头部 -->
<header>
    <div class="left"></div>
    <div class="title">购物车</div>
    <div class="right"></div>
</header>

<div id="cart-shop" class="cart-shop">
    <!-- 购物车为空 -->
    <div id="shopping-car" class="shopping-car">
        <div class="ico-shoppingCar">
            <span class="iconfont icon-cart"></span>
        </div>
        <div class="txt">购物车是空的</div>
        <div>
            <div class="btn btnSure m0"><a href="home.jsp">再去逛逛</a></div>
        </div>
    </div>

    <!--         <div class="cart-shop-content">
                <div class="cart-shop-content-right">
                    <a href="#" class="product-img">
                        <img src="images/01.jpg" alt=""/>
                    </a>
                    <div class="product-info">
                        <a href="#" class="info-txt">华为（HUAWEI）荣耀平板优享版 Wifi 8英寸平板电脑（高通骁龙 64位四核1280×800 2G/16G 4800mAh）香槟金</a>
                        <p class="price">¥1000.00</p>
                        <div class="option">
                            <div class="pull-left">
                                <span>-</span>
                                <input type="text"/>
                                <span>+</span>
                            </div>
                            <div class="pull-right">
                                <span class="iconfont icon-cart"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->
</div>
<!-- 创建订单 -->
<script>

    function createOrder() {
        var totalPrice = $("#btnPrice").text().substring(2);
        if (${sessionScope.user != null}) {
            $.ajax({
                url: getHostName() + '/order/createOrder',
                type: 'POST',
                dataType: 'JSON',
                data: {salary: totalPrice},
                success: function (data) {
                   location.href="${pageContext.request.contextPath}/webApp-shop/orderList.jsp";
                }
            })
        }
        else {
            window.location.href = "${pageContext.request.contextPath}/webApp-shop/login.jsp";
        }
    }
</script>
<div id="createList" class="createList">
    <div id="btnPrice" class="btnPrice">€ 0.00</div>
    <div id="btnPay" class="btnPay" onclick="createOrder()">创建订单</div>
</div>

<!--     <div id="mask" class="mask">
        <div class="close"><span id="close">X</span></div>
        <p class="txt">确认要将此商品从购物车移除吗？</p>
        <div class="btn">
            <button id="btnSure" class="btnSure">确定</button>
            <button id="btnCancel" class="btnCancel">取消</button>
        </div>
    </div>
    <div id="maskBody" class="maskBody"></div> -->

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
<script src="js/shoppingCar.js"></script>
</body>
</html>