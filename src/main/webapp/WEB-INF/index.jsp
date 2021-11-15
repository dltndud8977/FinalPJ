<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camp Go!Camp Go!</title>
<script src="resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>

	<%@ include file="views/common/header.jsp" %>
	
	
	<input type="button" value="관리자페이지"  onclick="fn_goAdminPage();"/>
	<input type="button" value="예약페이지" onclick="fn_goReservePage();"/>
	<script>
	function fn_goAdminPage(){
			location.href = "${pageContext.request.contextPath}/admin/adminPage.do";
		}
		
	function fn_goReservePage(){
			location.href="${pageContext.request.contextPath}/reserve/reserveList.do";
	}
	</script>
</body>
</html>