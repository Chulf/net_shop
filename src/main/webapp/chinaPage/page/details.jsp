<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>商品-福田食品</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/chinaPage/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/chinaPage/css/details-style.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/chinaPage/js/jquery.min.js"></script>
		<style>
			img{
				display:inline !important;
			}
		</style>
	</head>
	<body>
		<%@include file="header.jsp"%>
		<div class="long_banner">
			<img src="../img/1200x65_sk_1229.jpg"/>
		</div>
		<!--商品信息-->
		<div class="recommend_info">
			<div class="recommend_img fl" id="productImg">
				<img src="../img/102.JPG"/>
			</div>
			<div class="recommend_content fl">
				<p class="recommend_title" id="productTitle">商品标题</p>
				<div class="recommend_infomation">
                	<p id="productDescription">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是商品的详细描述。这是商品的详细描述。这是商品的详细描述。这是商品的详细描述。这是商品的详细描述。这是商品的详细描述。这是商品的详细描述。这是商品的详细描述。这是商品的详细描述。这是商品的详细描述。这是商品的详细描述。这是商品的详细描述。这是商品的详细描述。
                    </p>
				</div>
				<div class="price" id="productPrice" style="color:#ff0036;font-size:18px;font-weight:bold">€65.7</div>
				<div class="count">
					<input type="number" name="" id="count" value="1" style="text-align:center"/>
					<input type="button" name="" id="" onclick="buyCart()" value="立即购买" />
					<input type="button" name="" id="" onclick="addCart()"  value="加入购物车" />
					<input type="button" name="" id="" onclick="gotoBuy()"  value="继续购买" />
				</div>
			</div>
		</div>	
		<!--商品详情-->
		<div class="recommend_details">
			<div class="details_top">
				商品详情
			</div>
			<div class="details_content" id="productContent" style="text-align:center;">
				
			</div>
		</div>
		<%@include file="footer.jsp"%>  
	</body>

    <script>
		var productId ="";
		$.ajax({
			url:"${pageContext.request.contextPath}/product/findProductDetail.do",
			data:"id=${param.id}",
			success:function (product) {

				productId = product.id;
				document.getElementById("productTitle").innerHTML = product.name;

				document.getElementById("productDescription").innerHTML = product.description;

				document.getElementById("productPrice").innerHTML = "€"+product.price+"/"+product.chinaUnit;

				document.getElementById("productContent").innerHTML = product.content;

				document.getElementById("productImg").innerHTML = "<img  src='http://${pageContext.request.serverName}/net_shop_manager/"+product.imgsrc+"'/>"
			}

		})


		function buyCart(){
			$.ajax({
				url:"${pageContext.request.contextPath}/cartCar/append.do",
				data:"id="+productId,
				success:function(data){
                   location.href="${pageContext.request.contextPath}/chinaPage/page/car.jsp?adminId=${sessionScope.adminMsg.id}";
				}
			});

		}
		function addCart(){
			alert($("#count").val());
			$.ajax({
				url:"${pageContext.request.contextPath}/cartCar/appendCount.do",
				data:"id="+productId+"&count="+$("#count").val(),
				success:function(data){
					alert("添加成功！");
				}
			});
		}

		function gotoBuy(){
		    location.href = "${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}";
		}
	</script>
</html>
