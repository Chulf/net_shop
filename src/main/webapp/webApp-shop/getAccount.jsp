<%@ page pageEncoding="UTF-8" %>
<html style="background: url('images/timg.jpg') no-repeat;background-size:100% 100%">
<title>获取帐号</title>

    <div style="text-align: center;font-size: 50px;border: dotted;margin-top: 500px;" >

        <p>如需要获取账号请与我们联系：</p>
        <p style="color: red;font-size: 50px;margin-top: 15px">电话:${sessionScope.shopMsg.tel}</p>
        <p style="color: red;font-size: 50px">微信:${sessionScope.shopMsg.wx}</p>
        <p style="color: red;font-size: 50px">手机/WhatsApp:${sessionScope.shopMsg.whatsapp}</p>
    </div>
</html>