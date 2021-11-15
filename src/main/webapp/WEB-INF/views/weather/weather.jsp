<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 / 교통 정보</title>

<style>

ol, ul {
	list-style : none;
}
.content{width:720px; height:780px; margin:0 auto; border:1px solid black}
.nav{
	display : inline-block;
	margin : 70px;
}
.nav ul li{
	float:left;
	width: 160px;
	font-weight : bold;
}
.nav ul li a{
	display : #3E4756;
	text-decoration : none;
	color : black;
}
.nav ul li a:hover{
	color : #0081CF;
	text-decoration : underline;
}

----------------
#mapImg{
	position : relative;
}
.content a{
	position : absolute;
	width : 50px;
	height : 50px;
	border-radius : 50%;
	background : rgba(255, 255, 255, 0.6);
	text-align : center;
	text-decoration : none;
}
.seoul{
	right: 750px;    
	bottom: 121px;
}
</style>
</head>
<script>


</script>
<body>
<c:import url="../common/header.jsp"/>
<div class="nav">
<ul>
	<li><a href="${pageContext.request.contextPath }/weather/weatherView.do">날씨 정보</a></li>
	<li><a href="${pageContext.request.contextPath }">교통 정보</a></li>
</ul>
</div>

<div class="content">
	<h4>지도 api 자리</h4>
	<img id="mapImg" src="${pageContext.request.contextPath}/resources/images/map1.png" alt="koreaMap" />
	<a href="" class="seoul">서울</a>
</div>

</body>
</html>