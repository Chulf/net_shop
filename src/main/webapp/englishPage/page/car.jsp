<%@ page contentType="text/html;charset=UTF-8"  language="java" pageEncoding="UTF-8"  %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Car-Lu-food</title>
		<link rel="stylesheet" type="text/css" href="../css/common.css"/>
		<link rel="stylesheet" type="text/css" href="../css/car-style.css"/>
		<script src="${pageContext.request.contextPath}/englishPage/js/jquery.min.js"></script>
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
								"<a href='#' onclick='del(this)' >delete</a></td></tr></table></fieldset>")
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
				<td style="text-align: center;">Product Details</td>
				<td  style="text-align:center"><span style="margin-left:50%">Unit Price</span></td>
				<td>Quantity</td>
				<td>Total Price</td>
				<td>Options</td>
			</tr>
		</table>
		<div id="goods">

		</div>
    <div class="empty" id="empty" hidden>
    <p  style="font-weight:bold;font-size:18px;color:#313131;">Your shopping cart is still empty, you can:</p>
    <a href="${pageContext.request.contextPath}/englishPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}" class="btn">Go to visit</a>
    </div>
        <div class="pay_end">
            <div class="total">
                <div class="total_box">
                   
                    <div class="total_price">
						Total：
                        <span id="totalPrice">
                            €197.1
                        </span>
                    </div>
                     <a href="javascript:void(0)" class="create" onclick="createOrder()" >
						 Create Order
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
                    location.href ="${pageContext.request.contextPath}/englishPage/page/order.jsp?adminId=${sessionScope.adminMsg.id}";
                }
            })
        }
    </script>
</html>













