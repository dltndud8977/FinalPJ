<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.camp.member.model.vo.Member, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/enroll.css" />

	<meta charset="UTF-8">
	<title>회원 정보 수정 페이지</title>
	
	<style>
	#btn{
	
	width : 140px;
	}
	

	</style>

	
	</head>
<body>
	<div class="memberView-form-container">
	
		<i class="fas fa-times" id="form-close"></i>
		<div id="update-container">
		<form name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
			<label>아이디 <br />
			<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="userId" id="userId_" value="${member.userId}"  size="61" readonly required> <br /><br />
			</label>
			
			<label> 이름 <br />
			<input type="text" class="form-control" placeholder="이름" name="userName" id="userName" value="${member.userName}" size="61" required> <br /> <br />
			</label> 
			
			<label>Email <br />
			<input type="email" class="form-control" placeholder="이메일" name="email" id="email" value="${member.email}" size="61" required> <br /> <br />
			</label>
			
			<label> 핸드폰 <br />
			<input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="phone" id="phone" maxlength="11" value="${member.phone}" size="61" required> <br /> <br />
			</label>

			<br />
			<input type="submit" class="btn btn-outline-success" id="btn" value="수정" >&nbsp;
			<input type="reset" class="btn btn-outline-success" id="btn" value="취소">&nbsp;
			<input type="button" class="btn btn-outline-success" id="btn" onclick="location.href='${pageContext.request.contextPath}/member/memberDelete.do'" value="탈퇴">
		</form>
	</div>
	
	</div>
</body>

<script src="/camp/resources/js/script.js"></script>

</html>