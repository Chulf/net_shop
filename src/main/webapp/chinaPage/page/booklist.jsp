<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/chinaPage/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/chinaPage/css/booklist-style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/chinaPage/css/login-dialog.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/chinaPage/js/jquery.min.js"></script>
</head>
<body>
<%@include file="header.jsp" %>

<div class="wrap" style="margin-top: 20px">
    <div class="fl nav_aside">
        <ul id="category" class="nav_aside_box">
            <h1>该店铺空空如也，敬请期待！</h1>
        </ul>
    </div>
    <fieldset id="productList" class="content_box">
        <legend>商品列表
            <select id='condition' onchange='orderByCondition();'>
                <option value='1'>名字升序</option>
                <option value='2'>编号升序</option>
                <option value='3'>名字降序</option>
                <option value='4'>编号降序</option>
            </select>
        </legend>
        <div id="main_box" class="main_box">
            <center><h1 style="margin-top: 100px;margin-bottom: 100px;">该店铺空空如也，敬请期待！</h1></center>
        </div>
    </fieldset>
    <p class="pages" id="pages">
        <a href="#" class="befor_nt">上一页</a>
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">7</a>
        <a href="#">...</a>
        <a href="#" class="befor_nt">下一页</a>
    </p>
</div>
<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
    //构建菜单数据
    var content = "<li><a href='javascript:void(0)' onclick='clickCategory(null)'>所有类别</a></li>";

    $.ajax({
        url: "${pageContext.request.contextPath}/category/findCategorys.do",
        dataType: "json",
        data: "adminId=${sessionScope.adminMsg.id}",
        success: function (data) {
            $.each(data, function (index, o) {
                content += "<li><a href='javascript:void(0)' onclick='clickCategory(\"" + o.id + "\")'>" + o.name + "</a></li>";
            })
            document.getElementById("category").innerHTML = content;
        }
    })
</script>
<script type="text/javascript">

    function jumpToDetail(id) {
        if (${sessionScope.user != null}) {
            location.href = "${pageContext.request.contextPath}/chinaPage/page/details.jsp?id=" + id + "&adminId=${sessionScope.adminMsg.id}"
        } else {
//            alert("请先完成登录！")
            $(".container").show();
            $("#login").hide();
            $("#Account").show();
        }
    }

    //查询条件
    var condition = "";

    if (${sessionScope.adminMsg.username eq "SuperAdmin"}) {
        condition = "where flag='Y'";
    } else {
        condition = "where admin_id='${sessionScope.adminMsg.id}'";
    }

    createBookDetail(1, condition);

    function createBookDetail(pageIndex, condition) {
        //alert(pageIndex);
        //图书列表
        var content2 = "";
        $.ajax({
            url: "${pageContext.request.contextPath}/product/findProductsByDsql.do",
            data: "condition=" + condition + "&index=" + pageIndex,
            type: "post",
            dataType: "json",
            success: function (data) {
                $.each(data, function (index, o) {
                    if(${sessionScope.user != null}){
                        content2 += "<div class='content fl' title='"+ o.name +"  "+ o.description +"' style='box-shadow:2px 6px 8px rgba(100,100,100,0.2), 3px 10px 20px rgba(200,200,200,0.2);' onclick='jumpToDetail(\"" + o.id + "\");'>"
                            + "<img src='http://${pageContext.request.serverName}/net_shop_manager/" + o.imgsrc + "' width='150' height='150'/>"
                            + "<p style='color:red;font-size:14px;max-width: 148px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;'>" + o.name + "</p>"
                            + "<p style='color:#666;font-size:14px;max-width: 148px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;'>" + o.description + "</p>"
                            + "</div>"

                    }else{
                        content2 += "<div class='content fl' title='"+ o.name +"' style='box-shadow:2px 6px 8px rgba(100,100,100,0.2), 3px 10px 20px rgba(200,200,200,0.2);' onclick='jumpToDetail(\"" + o.id + "\");'>"
                                + "<img src='http://${pageContext.request.serverName}/net_shop_manager/" + o.imgsrc + "' width='150' height='150'/>"
                                + "<p style='color:red;font-size:14px;max-width: 148px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;'>" + o.name + "</p>"
                                + "</div>"
                    }
                })
                document.getElementById("main_box").innerHTML = content2;

                //构建分页信息
                $.ajax({
                    url: "${pageContext.request.contextPath}/product/findPageMsg",
                    success: function (data) {
                        createPageDetail(data);
                    }
                })
            }
        })
    }
    function createBookDetail2(index) {
        createBookDetail(index, condition);
    }
    function clickCategory(id) {

        //通过类别查询
        if (id) {
            //查询当前类别下商品
            //查询所有类别
            if (${sessionScope.adminMsg.username eq "SuperAdmin"}) {
                condition = "where flag='Y' and category_id ='" + id + "'";
            } else {
                condition = "where admin_id='${sessionScope.adminMsg.id}' and category_id ='" + id + "'";
            }

        } else {
            //查询所有类别
            if (${sessionScope.adminMsg.username eq "SuperAdmin"}) {
                condition = "where flag='Y'";
            } else {
                condition = "where admin_id='${sessionScope.adminMsg.id}'";
            }
        }
        createBookDetail(1, condition);
    }
    function orderByCondition() {
        //通过条件排序
        var select = $('#condition').val();
        //去掉多余的order by
        condition = condition.split("order by")[0];
        if (select == 1) {
            condition = condition + "order by name asc";
        }
        if (select == 2) {
            condition = condition + "order by productNum asc";
        }
        if (select == 3) {
            condition = condition + "order by name desc";
        }
        if (select == 4) {
            condition = condition + "order by productNum desc";
        }
        createBookDetail(1, condition);
    }
</script>
<script type="text/javascript">
    //分页对象
    var data1 = "";
    function createPageDetail(data) {
        //构建分页列表
        var content3 = "";
        data1 = data;
        for (var i = 1; i <= data.endPage; i++) {
            if (data.pageIndex == i) {
                content3 += "<a href=\"javascript:void(0)\" style=\"color:red\" onclick='createBookDetail2(" + i + ")'>" + i + "</a>";
            } else {
                content3 += "<a href=\"javascript:void(0)\" onclick='createBookDetail2(" + i + ")'>" + i + "</a>";
            }
        }
        document.getElementById("pages").innerHTML = "<a href='javascript:void(0)' onclick='lastIndex()' class='befor_nt'>上一页</a>" + content3 + "<a href='javascript:void(0)' onclick='afterIndex()' class='befor_nt'>下一页</a>";
    }
    console.info(data1);
    function lastIndex() {
        if (data1.pageIndex == 1) {
            alert("当前已经是第一页！")
        } else {
            createBookDetail(data1.pageIndex - 1, condition)
            data1.pageIndex -= 1;
        }
    }
    function afterIndex() {
        if (data1.pageIndex == data1.endPage) {
            alert("当前已经是最后一页！")
        } else {
            createBookDetail(data1.pageIndex + 1, condition)
            data1.pageIndex += 1;
        }
    }
</script>

<div class="container">
    <div id="close" class="close">X</div>
    <div id="login" class="login">
        <div class="title">
            <h3>账号登录</h3>
            <a href="javascript:;" class="regeister" id="getAccount">获取账号</a>
        </div>
        <div class="username">
            <input class="iptUser" type="text" id="iptUser" required placeholder="输入用户名">
        </div>
        <div class="pwd">
            <input class="iptPwd" type="password" id="iptPwd" required placeholder="输入密码">
        </div>
        <div class="other">
            <div class="other-left">
                <input id="autoLogin" type="checkbox" checked>下次自动登录
            </div>
        </div>
        <button class="btnLogin" onclick="btnLogin();">登录</button>
    </div>
    <div id="Account" class="getAccount">
        <div class="title">
            <h3>获取账号</h3>
            <a href="javascript:;" class="regeister" id="getLogin">账号登录</a>
        </div>
        <div class="contentList" style="text-align: center;border: dotted;margin: auto">

                <p>如需要获取账号请与我们联系：</p>
                <p style="color: red;font-size: 18px;margin-top: 15px">电话:${sessionScope.shopMsg.tel}</p>
                <p style="color: red;font-size: 18px">微信:${sessionScope.shopMsg.wx}</p>
                <p style="color: red;font-size: 18px">手机/WhatsApp:${sessionScope.shopMsg.whatsapp}</p>

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

        $("#close").click(function () {
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
                    alert("您不是当前店铺用户或输入有误");
                }
            }
        })

    }
</script>

</html>
