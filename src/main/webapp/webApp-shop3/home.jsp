<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<script src="${pageContext.request.contextPath}/webApp-shop3/js/ContextPath.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>Lu-food</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/iconfont.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/cate.css">
    <link rel="stylesheet" href="css/login-dialog.css">
    <script src="${pageContext.request.contextPath}/chinaPage/js/jquery.min.js"></script>
    <script>$.noConflict();</script>
    <script src="js/lib/zepto.min.js"></script>
    <script>
        //判断否显示价格
        function booleanLogin(price, unit,description) {
            if (${sessionScope.user != null}) {
                return "<div class='product-name'>"+description+"</div>" +
                    "<div class='product-price'>€" + price + "/" + unit + "</div>"
            } else {
                return "";
            }
        }
        //判断是否登录
        function booleanLogin2() {
            if (${sessionScope.user == null}) {
                $(".container").show();
                $("#login").hide();
                $("#Account").show();
            }
        }
    </script>
    <script src="js/cate.js"></script>
    <style>
        .addOne {
            display: inline-block;
            width: 20px;
            height: 20px;
            background-color: #e8401f;
            line-height: 20px;
            text-align: center;
            border-radius: 10px;
            color: #fff;
            font-weight: bold;
        }

        .minusOne {
            width: 20px;
            height: 20px;
            border-radius: 10px;
            color: #e8401f;
            font-weight: bold;
            line-height: 19px;
            text-align: center;
            border: 1px solid #e8401f;
        }

        #language {
            font-size: 14px;
            background: #f7f7f7;
            border: 1px solid #dcdcdc;
            padding: 8px 12px 8px 12px;
            margin: 0 6px;
            border-radius: 5px;
            color: #8d8d8d;
            cursor: pointer;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
<!-- 头部 -->
<header>
    <div class="left">
        <img src="images/sp3_3.png" alt="">
    </div>
    <div class="title">${sessionScope.shopMsg.name2}</div>
    <div class="right" style="margin-right: 30px;"><input id="language" type="button" value="China"
                                                          onclick="toItalyPage();"></div>
    <script>
        // 去意大利界面
        function toItalyPage() {
            location.href = getHostName() + "/webApp-shop/home.jsp";
        }
    </script>
</header>
<div class="categary">
    <div class="searchTop">
        <div class="iptSearch">
            <input id="iptGoodsName" type="text" placeholder="Please enter the product name">
            <div id="btnSearch" class="btn btnSure m0">Search</div>
        </div>
    </div>
    <div id="categary-left" class="categary-left" style="position: relative">
        <ul>
            <!--            <li class=""><a href="javascript:;">热门推荐</a></li>
                            <li class="active"><a href="javascript:;">潮流女装</a></li>
                            <li class=""><a href="javascript:;">品牌男装</a></li>
                            <li class=""><a href="javascript:;">内衣配饰</a></li>
                            <li class=""><a href="javascript:;">家用电器</a></li>
                            <li class=""><a href="javascript:;">电脑办公</a></li>-->
        </ul>
        <div style="position:absolute;width:100%;bottom:80px;left:0;text-align:center;color:#d8505c;text-align: center">
            total:<span id="shangpinshuliang"></span><br>products
        </div>
    </div>
    <div class="categary-right" id="scrolldiv">
        <div class="right-in">
            <ul id="product-info" class="product-info">
                <!-- 					<li>
                                        <div class="left-img">
                                            <a href="#">
                                                <img src="images/01.jpg" alt="">
                                            </a>
                                        </div>
                                        <div class="middle-info">
                                            <div class="product-name">菲律宾帝皇蕉菲律宾帝皇蕉菲律
                                            </div>
                                            <div class="product-price">
                                                €2.50/kg
                                            </div>
                                        </div>
                                        <div class="right-num">
                                            <span id="minusOne" class="iconfont  icon-jian minusOne"></span>
                                            <span id="num" class="num"> 0 </span>
                                            <span id="addOne" class="iconfont  icon-jia addOne"></span>
                                        </div>
                                    </li> -->
            </ul>
        </div>
    </div>
</div>

<!-- 商品列表Max -->
<div id="maxGoodsList" class="maxGoodsList">
    <div id="maxIn" class="maxIn">
        <div class="head">
            <span class="iconfont icon-cart"></span>
        </div>
        <ul id="maxShoppingList">
            <!-- 	    		<li>
                                <div class="shopInfo">
                                    <div class="shopName">2153中国芹菜 China Celery</div>
                                    <div class="shopPrice">€3</div>
                                    <div class="shopNum">4kg</div>
                                </div>
                                <div class="btnDel">
                                    <span class="btnClear iconfont icon-cart"></span>
                                    <span class="btnAdd iconfont icon-cart"></span>
                                    <span class="btnMinus iconfont icon-cart"></span>
                                </div>
                            </li> -->

            <!-- 	    		<div id="btnClear" class="clear">
                                <span class="iconfont icon-cart"></span>清空购物车
                            </div> -->
        </ul>
    </div>
</div>

<!-- 商品列表Min -->
<div id="minGoodsList" class="minGoodsList">
    <div class="sign">
        <div id="GoodsNum" class="GoodsNum">0</div>
        <span class="iconfont icon-cart"><span>
    </div>
    <div id="btnPrice" class="btnPrice">€ 0.00</div>
    <script>
        // 去结算
        function btnPay(user) {
            location.href = getHostName() + "/webApp-shop3/shoppingCar.jsp";
        }
    </script>
    <div id="btnPay" class="btnPay" onclick="btnPay()">Clearing</div>
</div>
<!-- 模态框 -->
<div id="mask" class="mask">
    <div class="close"><span id="close">X</span></div>
    <p class="txt">Are you sure you want to remove this item from your shopping cart?</p>
    <div class="btn">
        <button id="btnSure" class="btnSure">Determine</button>
        <button id="btnCancel" class="btnCancel">Cancel</button>
    </div>
</div>

<div id="maskBody" class="maskBody"></div>
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

<script>
    $(function () {
        //alert();
        loadRemoteData("${sessionScope.adminMsg.id}", "${sessionScope.adminMsg.username}");
    })
</script>
<div class="container">
    <div id="close2" class="close2">X</div>
    <div id="login" class="login">
        <div class="title">
            <h3>Account login</h3>
            <a href="javascript:;" class="regeister" id="getAccount">Get an account</a>
        </div>
        <div class="username">
            <input class="iptUser" type="text" id="iptUser" required placeholder="Enter your user name">
        </div>
        <div class="pwd">
            <input class="iptPwd" type="password" id="iptPwd" required placeholder="Enter password">
        </div>
        <div class="other">
            <div class="other-left">
                <input id="autoLogin" type="checkbox" checked>Remember login
            </div>
        </div>
        <button class="btnLogin" onclick="btnLogin();">Login</button>
    </div>
    <div id="Account" class="getAccount">
        <div class="title">
            <h3>Get an account</h3>
            <a href="javascript:;" class="regeister" id="getLogin">Account login</a>
        </div>
        <div class="contentList" style="text-align: center;border: dotted;margin: auto">

            <p>If you need to get an account, please contact us：</p>
            <p style="color: red;font-size: 18px;margin-top: 15px">Tel:${sessionScope.shopMsg.tel}</p>
            <p style="color: red;font-size: 18px">Wechat:${sessionScope.shopMsg.wx}</p>
            <p style="color: red;font-size: 18px">Handy/WhatsApp:${sessionScope.shopMsg.whatsapp}</p>

        </div>
    </div>
</div>
<script>
    $(function () {

        $("#getAccount").click(function () {
            $(".container").show();
            $("#login").hide();
            $("#Account").show();
        })


        $("#getLogin").click(function () {
            $(".container").show();
            $("#Account").hide();
            $("#login").show();
        })

        $("#close2").click(function () {
            $(".container").hide();
            $("#Account").hide();
            $("#login").hide();
        })
    })

    function btnLogin() {
        var username = $("#iptUser").val()
        var password = $("#iptPwd").val()
        $.ajax({
            url: "${pageContext.request.contextPath}/user/login",
            data: {"username": username, "password": password},
            type: "post",
            dataType: "json",
            success: function (result) {
                if (result == "success") {
                    location.reload();
                } else {
                    alert("You are not the current store user or the input is incorrect");
                }
            }
        })
    }
</script>
</body>
</html>
<script>
    $(function () {
        var nScrollHight = 0; //滚动距离总长(注意不是滚动条的长度)
        var nScrollTop = 0;   //滚动到的当前位置
        var nDivHight = $("#scrolldiv").height();

        var maxIndex
        //构建分页信息
        jQuery.ajax({
            url: "${pageContext.request.contextPath}/product/findPageMsg",
            success: function (data) {
                maxIndex = data.endPage;
                jQuery("#shangpinshuliang").text(data.totalRows);

                window.currentIndex = 1;

                jQuery("#scrolldiv").scroll(function(){
                    nScrollHight = jQuery(this)[0].scrollHeight;
                    nScrollTop = jQuery(this)[0].scrollTop;
                    if(nScrollTop + nDivHight >= nScrollHight){
                        if(currentIndex + 1 > maxIndex){
                            return;
                        }
                        currentIndex ++;
                        console.log(currentIndex);
                        getCateGoods_w("${sessionScope.adminMsg.id}",currentIndex,condition,true);
                    }
                });
            }
        })
    })

</script>