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
<title>캠핑장 선택</title>
<style>
	.camping{
		
		height : 10%;
		
		width: 720px;
		padding : 10px;
		
	}
	
	.camp{
		margin : auto;
		position : relative;
		margin-top : 20px;
		cursor:pointer; 
		width : 720px;
		
	}
	
	.img{
		width : 700px;
		height : 9%; 
	}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>
	
<div id="1" class="camp">
	<div class="camping imgdiv">
		<img class="img" src="/camp/resources/images/geumMulSan.png"  alt="" />		
	</div>
	<div class="camping info">
		양평 금물산하늘소캠프
	</div>
	<hr />
</div>



<div id="2" class="camp">
	<div class="camping imgdiv">
		<img class="img" src="/camp/resources/images/goldenValley.jpg"  alt="" />		
	</div>
	<div class="camping info">
		청계산 골든밸리캠핑장
	</div>
	<hr />
</div>


<div id="3" class="camp">
	<div class="camping imgdiv">
		<img class="img" src="/camp/resources/images/banDitBul.png"  alt="" />		
	</div>
	<div class="camping info">
		용인 반딧불캠핑장
	</div>
	<hr />
</div>

<div id="4" class="camp">
	<div class="camping imgdiv">
		<img class="img" src="/camp/resources/images/doDuckSan.jpg" alt="" />		
	</div>
	<div class="camping info">
		광명 도덕산캠핑장
	</div>
	<hr />
</div>



<script>
		
		$(function(){
			$("div[id]").on("click",function(){
				var campNo = $(this).attr("id");
				console.log("campNo="+campNo);
				location.href = "${pageContext.request.contextPath}/reserve/campInfo.do?campNo="+campNo;
			});
		});
	</script>
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>