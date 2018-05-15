<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<div class="footbox">
    <div class="footer">
        <div class="foot_imgbox">
            <img src="${pageContext.request.contextPath}/italyPage/img/logo_baidu.jpg"/>
            <img src="${pageContext.request.contextPath}/italyPage/img/logo_taobao.jpg"/>
            <img src="${pageContext.request.contextPath}/italyPage/img/logo_wangyi.jpg"/>
            <img src="${pageContext.request.contextPath}/italyPage/img/logo_jd.jpg"/>
            <img src="${pageContext.request.contextPath}/italyPage/img/logo_tengxun.jpg"/>
        </div>
        <p>
            <a style="font-size: 20px;" href="http://mainriversoft.com/file/toabout">Made by:MainRiverSoft.com
                <br>
        	<a style="color:#666" href="${pageContext.request.contextPath}/italyPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">Home page</a> |
            <a style="color:#666" href="${pageContext.request.contextPath}/italyPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">Le presentazioni</a> |
            <a style="color:#666" href="${pageContext.request.contextPath}/italyPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">Dichiarazione legale</a>
            </a>
        </p>
    </div>
</div>