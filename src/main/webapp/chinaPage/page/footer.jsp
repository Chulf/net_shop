<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<div class="footbox">
    <div class="footer">
        <div class="foot_imgbox">
            <img src="${pageContext.request.contextPath}/chinaPage/img/logo_baidu.jpg"/>
            <img src="${pageContext.request.contextPath}/chinaPage/img/logo_taobao.jpg"/>
            <img src="${pageContext.request.contextPath}/chinaPage/img/logo_wangyi.jpg"/>
            <img src="${pageContext.request.contextPath}/chinaPage/img/logo_jd.jpg"/>
            <img src="${pageContext.request.contextPath}/chinaPage/img/logo_tengxun.jpg"/>
        </div>
        <p>
            <a style="font-size: 20px;" href="http://mainriversoft.com/file/toabout">网站制作:MainRiverSoft.com
                <br>
        	<a style="color:#666" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">首页</a> |
            <a style="color:#666" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">公司介绍</a> |
            <a style="color:#666" href="${pageContext.request.contextPath}/chinaPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">法律声明</a>
            </a>
        </p>
    </div>
</div>