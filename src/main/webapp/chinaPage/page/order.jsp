<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单-福田食品</title>
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/order-style.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/chinaPage/js/jquery.min.js"></script>
    <style>
        .empty {
            padding: 90px 0 0 30%;
            background-position: left;
            height: 220px
        }

        .empty p {
            font-size: 14px;
            color: #8a8888
        }

        .empty a.btn {
            width: 116px;
            height: 38px;
            display: inline-block;
            background-color: #ff2832;
            color: #fff;
            text-align: center;
            line-height: 38px;
            font-size: 18px;
            margin: 30px 20px 0 0;
            border-radius: 2px
        }

        .empty a.btn:hover, .login_tip .btn:hover {
            background-color: #d21f2b
        }
    </style>
</head>
<body>
<%@include file="header.jsp" %>
<table class="table_top">
    <tr>
        <td style="text-align: center;">商品详情</td>
        <td>单价</td>
        <td>数量</td>
        <td>总价</td>
    </tr>
</table>


<div id="orderList">

</div>
<div class="empty" id="empty" hidden>
    <p style="font-weight:bold;font-size:18px;color:#313131;">您暂时还没有下单，您可以：</p>
    <a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}"
       class="btn">去购物</a>
</div>
<script type="text/javascript">
    $.ajax({
        url: "${pageContext.request.contextPath}/order/findMyOrder.do",
        type: 'post',
        dataType: 'json',
        success: function (data) {
            if (data.length == 0) {
                $("#empty").show();
                $(".table_top").hide();
            }
            var content2 = "";
            $.each(data, function (index, o) {
                var legend = "<fieldset class='order_list'>"
                        + "<legend>订单编号:" + o.sorderEntity.orderNum + "</legend>"
                        + "<table>";


                var content = "";
                $.each(o.cartCarVO, function (index2, o2) {
                    content += "<tr> <td> <img src='http://${pageContext.request.serverName}/net_shop_manager/" + o2.sproductEntity.imgsrc + "'  class='fl' width='150' height='150' />"
                            + "<div class='fl commodity' style='margin-left:10px'>"
                            + "<p class='commodity_title'>" + o2.sproductEntity.name + "</p>"
                            + "<div class='commodity_info'  style='height:100px;overflow: hidden'>" + o2.sproductEntity.description + "</div>"
                            + "</div> </td> <td>€" + parseFloat(o2.sproductEntity.price).toFixed(2) + "</td> <td>" + o2.count + "</td> <td>€" + parseFloat(o2.sproductEntity.price * o2.count).toFixed(2) + "</td> </tr>"
                })

                var end = "<tr><td colspan='4'>"
                        + "<input type='button' name='' id='' value='删除订单' class='delete fr'/>"
                        + "<div class='order_status fr'>"
                        + "订单状态：<span>" + o.sorderEntity.orderStatus + "</span>"
                        + "</div> <div class='order_price_total fr'>"
                        + "订单总价：<span>€" + parseFloat(o.sorderEntity.orderSalary).toFixed(2) + "</span>"
                        + "</div> </td> </tr> </table> </fieldset>";

                content2 += legend + content + end;

            })
            document.getElementById("orderList").innerHTML = content2;
        }
    })
</script>

<%@include file="footer.jsp" %>
</body>
</html>













