<%@ page pageEncoding="UTF-8" %>
<html style="background: url('images/timg.jpg') no-repeat;background-size:100% 100%">
<title>获取帐号</title>

    <div style="text-align: center;font-size: 50px;border: dotted;margin-top: 500px;" >

        <p>如需要获取账号请与我们店长联系：</p>
        <p style="color: red;font-size: 50px;margin-top: 15px">tel:${sessionScope.shopMsg.tel}</p>
        <p style="color: red;font-size: 50px">wechat:${sessionScope.shopMsg.wx}</p>
        <p style="color: red;font-size: 50px">handy whatsapp:${sessionScope.shopMsg.whatsapp}</p>
    </div>
</html>