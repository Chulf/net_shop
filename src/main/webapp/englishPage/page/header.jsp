<%@ page pageEncoding="UTF-8" %>
<div class="index_top">
    <div class="index_logo">
        <div class="fl bz-logo">
            <a href="${pageContext.request.contextPath}/englishPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}"><img
                    src="${pageContext.request.contextPath}/englishPage/img/sp3_3.png"/></a>
        </div>
        <div class="fl search">
            <input id="search_box" type="text" name="search_box" placeholder="Find it out, take a stroll……" class="search_box fl"/>
            <input type="button" onclick="search();" name="search_btn" value="" class="fl search_btn"/>
        </div>
        <div class="fr my">
            <input id="changeLang" type="button" value="China" onclick="changeLang()" class="fl my_commodity"/>
            <input id="btnLogin" type="button" value="Login" onclick="toLogin()" class="fl my_commodity"/>
            <input type="button" value="Become a business" onclick="toAdmin()" class="fl my_order"/>
        </div>
        <script type="text/javascript">
            function changeLang() {
                var href = location.href;
                location.href = href.replace("englishPage", "chinaPage");
            }
            function jumpToPage(url) {
                location.href = url + "?adminId=${sessionScope.adminMsg.id}"
            }
            function toLogin() {
                //jumpToPage("${pageContext.request.contextPath}/englishPage/page/login.jsp");
                $(".container").show();
                $("#login").hide();
                $("#Account").show();
            }
            function toRegist() {
                jumpToPage("${pageContext.request.contextPath}/englishPage/page/register.jsp");
            }
            function toAdmin() {
                location.href = "http://mainriversoft.com/file/toabout";
            }
        </script>

        <script type="text/javascript">
            function search() {
                if (${sessionScope.adminMsg.username eq "SuperAdmin"}) {
                    condition = "where flag='Y' and name like '%25" + $('#search_box').val() + "%25'";
                } else {
                    condition = "where admin_id='${sessionScope.adminMsg.id}' and name like '%25" + $('#search_box').val() + "%25'";
                }
                createBookDetail(1, condition);
            }
        </script>

        <script>
            var userLogin = "${sessionScope.user}";
            if (userLogin != "") {

                $("#btnLogin").css("display", "none");
            }


            function toCart() {
                window.location = "${pageContext.request.contextPath}/englishPage/page/car.jsp?adminId=${sessionScope.adminMsg.id}";
            }
            function toOrder() {
                console.log(userLogin);
                if (userLogin != "") {
                    // console.log("非空");
                    window.location = "${pageContext.request.contextPath}/englishPage/page/order.jsp?adminId=${sessionScope.adminMsg.id}";
                }
                else {
                    $(".container").show();
                    $("#login").hide();
                    $("#Account").show();
                }
            }
        </script>

    </div>
</div>
<div class="banner_box">
    <div class="long_banner" style="padding-left: 224px;">
        <div class="lord_box">
            <input type="button" value="Cart" onclick="toCart()" class="lord_commodity">
            <input type="button" value="My Order" onclick="toOrder()" class="lord_order">
        </div>
        <p style="font-family:'楷体';text-shadow:5px 8px 12px rgba(255,116,1,0.6);margin: 0 auto;text-align: center;font-size: 50px;line-height:  120px;">
            ${sessionScope.shopMsg.name2}
        </p>
    </div>
</div>