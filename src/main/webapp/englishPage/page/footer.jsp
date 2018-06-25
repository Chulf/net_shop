<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<div class="footbox">
    <div class="footer">
        <div class="foot_imgbox">
            <img src="${pageContext.request.contextPath}/englishPage/img/logo_baidu.jpg"/>
            <img src="${pageContext.request.contextPath}/englishPage/img/logo_taobao.jpg"/>
            <img src="${pageContext.request.contextPath}/englishPage/img/logo_wangyi.jpg"/>
            <img src="${pageContext.request.contextPath}/englishPage/img/logo_jd.jpg"/>
            <img src="${pageContext.request.contextPath}/englishPage/img/logo_tengxun.jpg"/>
        </div>
        <p>
            <a style="font-size: 20px;" href="http://mainriversoft.com/file/toabout">Made By:MainRiverSoft.com
                <br>
        	<a style="color:#666" href="${pageContext.request.contextPath}/englishPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">Home</a> |
            <a style="color:#666" href="${pageContext.request.contextPath}/englishPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">Company Profile</a> |
            <a style="color:#666" href="${pageContext.request.contextPath}/englishPage/page/booklist.jsp?adminId=${sessionScope.adminMsg.id}">Legal Notices</a>
            </a>
        </p>
    </div>
</div>