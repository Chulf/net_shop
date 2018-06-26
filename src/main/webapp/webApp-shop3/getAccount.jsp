<%@ page pageEncoding="UTF-8" %>
<html style="background: url('images/timg.jpg') no-repeat;background-size:100% 100%">
<title>Get account</title>

    <div style="text-align: center;font-size: 50px;border: dotted;margin-top: 500px;" >

        <p>If you need to get an account, please contact us：</p>
        <p style="color: red;font-size: 50px;margin-top: 15px">Tel:${sessionScope.shopMsg.tel}</p>
        <p style="color: red;font-size: 50px">Wechat:${sessionScope.shopMsg.wx}</p>
        <p style="color: red;font-size: 50px">handy/WhatsApp:${sessionScope.shopMsg.whatsapp}</p>
    </div>
</html>