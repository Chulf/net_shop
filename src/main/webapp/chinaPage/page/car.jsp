<%@ page contentType="text/html;charset=UTF-8"  language="java" pageEncoding="UTF-8"  %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>购物车-福田食品</title>
		<link rel="stylesheet" type="text/css" href="../css/common.css"/>
		<link rel="stylesheet" type="text/css" href="../css/car-style.css"/>
		<script src="${pageContext.request.contextPath}/chinaPage/js/jquery.min.js"></script>
		<script>
			$(function () {
				$.ajax({
					url : "${pageContext.request.contextPath}/cartCar/show",
					type : "post",
                    success : function (result) {
					    var  total = 0
                        if(result.length==0){
                                $("#empty").show();
                                $(".table_top").hide();
                                $(".create").hide();
                            }
						for( var  i  in  result){
						    var  obj = result[i];
						    var  littlePrice = obj.sproductEntity.price*obj.count
							total+=littlePrice
							$("#goods").append("<fieldset class='electronic car_table'><legend>"+obj.sproductEntity.categoryName+"</legend>" +
								"<table><tr><td><div hidden>"+obj.sproductEntity.id+"</div></td><td><img style='height: 120px;width: 100px;' src='http://${pageContext.request.serverName}/net_shop_manager/"+obj.sproductEntity.imgsrc+"'/> </td><td>" +
								"<p class='title'>"+obj.sproductEntity.name+"</p><div class='info' style='height:100px;overflow: hidden'>"+obj.sproductEntity.description+"</div></td>" +
								"<td class='txt-cet'>€"+obj.sproductEntity.price+"</td><td class='txt-cet'>" +
								"<input type='number' onblur='chg(this)' onchange='numb()' min='1' name='' id='coun' value='"+obj.count+"' class='count'/></td>" +
								"<td class='txt-cet'>€"+obj.sproductEntity.price*obj.count+"</td><td class='txt-cet'>" +
								"<a href='#' onclick='del(this)' >删除</a></td></tr></table></fieldset>")
                        }
                        $("#totalPrice").text(total)
                    }
				})
            })
            function numb(){
                var num = $("#coun").val();
                if(num*1<=0){
                $("#coun").val(1);
                }
            }
            function del(obj) {
                var  id = $(obj).parent().parent().children(":first").text()
                $.ajax({
                    url : "${pageContext.request.contextPath}/cartCar/dropCartGood",
                    data :  {"id":id},
                    type : "post",
                    success : function (result) {
                        console.log(result)
						location.reload()
                    }
                })
            }

            function chg(obj) {
                var  count =  $(obj).val()
				var  id = $(obj).parent().parent().children(":first").text()
				$.ajax({
                    url : "${pageContext.request.contextPath}/cartCar/changeCount",
					data :  {"id":id,"count":count},
                    type : "post",
					success : function (result) {
						console.log(result)
                        location.reload()
                    }
				})
            }
		</script>
	</head>
	<body>
		<%@include file="header.jsp"%>
		<table class="table_top" >
			<tr>
                <td style="width:20%"></td>
				<td style="text-align: center;">商品详情</td>
				<td  style="text-align:center"><span style="margin-left:50%">单价</span></td>
				<td>数量</td>
				<td>总价</td>
				<td>操作</td>
			</tr>
		</table>
		<div id="goods">

		</div>
    <div class="empty" id="empty" hidden>
    <p  style="font-weight:bold;font-size:18px;color:#313131;">您的购物车还是空的，您可以：</p>
    <a href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" class="btn">去逛逛</a>
    </div>
        <div class="pay_end">
            <div class="total">
                <div class="total_box">
                   
                    <div class="total_price">
                        总计：
                        <span id="totalPrice">
                            €197.1
                        </span>
                    </div>
                     <a href="javascript:void(0)" class="create" onclick="createOrder()" >
                        创建订单
                    </a>
                </div>
            </div>
        </div>
		<%@include file="footer.jsp"%>   
	</body>
    <script type="text/javascript">
        function createOrder(){
            $.ajax({
                url:"${pageContext.request.contextPath}/order/createOrder.do",
                data:"salary="+$("#totalPrice").text(),
                success:function(data){
                    location.href ="${pageContext.request.contextPath}/chinaPage/page/order.jsp?adminId=${sessionScope.adminMsg.id}";
                }
            })
        }
    </script>
</html>













