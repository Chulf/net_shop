<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/englishPage/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/englishPage/css/booklist-style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/englishPage/css/login-dialog.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/englishPage/js/jquery.min.js"></script>
</head>
<body>
<%@include file="header.jsp" %>

<div class="wrap" style="margin-top: 20px">
    <div class="fl nav_aside">
        <ul id="category" class="nav_aside_box">
            <h1>The shop is empty, so stay tuned!</h1>
        </ul>
    </div>
    <fieldset id="productList" class="content_box">
        <legend>Product list
            <select id='condition' onchange='orderByCondition();'>
                <option value='1'>Ascending name</option>
                <option value='2'>Ascending number</option>
                <option value='3'>Descending name</option>
                <option value='4'>Number descending</option>
            </select>
        </legend>
        <div id="main_box" class="main_box">
            <center><h1 style="margin-top: 100px;margin-bottom: 100px;">The shop is empty, so stay tuned!</h1></center>
        </div>
    </fieldset>
    <p class="pages" id="pages">
        <a href="#" class="befor_nt">Previous page</a>
        <a href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">7</a>
        <a href="#">...</a>
        <a href="#" class="befor_nt">Next page</a>
    </p>
</div>
<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
    //构建菜单数据
    var content = "<li><a href='javascript:void(0)' onclick='clickCategory(null)'>All categories</a></li>";

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
            location.href = "${pageContext.request.contextPath}/englishPage/page/details.jsp?id=" + id + "&adminId=${sessionScope.adminMsg.id}"
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
        document.getElementById("pages").innerHTML = "<a href='javascript:void(0)' onclick='lastIndex()' class='befor_nt'>Up</a>" + content3 + "<a href='javascript:void(0)' onclick='afterIndex()' class='befor_nt'>Next</a>";
    }
    console.info(data1);
    function lastIndex() {
        if (data1.pageIndex == 1) {
            alert("Currently is the first page！")
        } else {
            createBookDetail(data1.pageIndex - 1, condition)
            data1.pageIndex -= 1;
        }
    }
    function afterIndex() {
        if (data1.pageIndex == data1.endPage) {
            alert("It is currently the last page！")
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
            <h>Account login</h>
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
        <button class="btnLogin" onclick="btnLogin();">Log in</button>
    </div>
    <div id="Account" class="getAccount">
        <div class="title">
            <h3>Get an account</h3>
            <a href="javascript:;" class="regeister" id="getLogin">Account login</a>
        </div>
        <div class="contentList" style="text-align: center;border: dotted;margin: auto">

                <p>If you need to get an account, please contact us：</p>
                <p style="color: red;font-size: 18px;margin-top: 15px">Tel:${sessionScope.shopMsg.tel}</p>
                <p style="color: red;font-size: 18px">WeChat:${sessionScope.shopMsg.wx}</p>
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
                    alert("You are not the current store user or the input is incorrect!");
                }
            }
        })

    }
</script>

</html>
