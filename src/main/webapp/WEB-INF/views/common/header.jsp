<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />


<div class="logobox">
	
	<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/shadowlogo.png" alt="logo" /></a>
</div>

        
<div class="loginbox">

	<form class="form" id="login-form" action="${pageContext.request.contextPath}/member/memberLogin.do">
		<div class="int-area">
		 <c:if test="${empty member}">
			<input type="text" name="userId" id="id"  autocomplete="off" required/>
			<label for="id">UserName</label>
		</div>
		<br />
		
		<div class="int-area">
			<input type="password" name="userPw" id="pw"  autocomplete="off" required/>
			<label for="pw">Password</label>
		</div>
	 	<div class="btn-area">
	 		<button type="submit" >Login</button>
	 	</div>
	 	<div class="caption">
	 		<a href="/camp/member/memberEnroll.do">회원가입</a>
	 	</div>
	 	<div class="caption">
	 		<a href="">비밀번호 찾기</a>
	 		 </c:if>
	 	</div>
	 	
	 		  <c:if test="${!empty member}">
		        <span><a href="${pageContext.request.contextPath}/member/memberView.do?userId=${member.userId}" title="내정보보기">${member.userName}</a> 님, 안녕하세요</span>
		        &nbsp;
		        <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'">로그아웃</button>
		    </c:if>
	</form>
	

	
	
</div>

<div class="menubar">
	<button class="btn-menu">
		<a href="#">캠핑장</a>
	</button>
	<button class="btn-menu">
		<a href="#">캠핑장 후기</a>
	</button>
	<button class="btn-menu">
		<a href="${pageContext.request.contextPath }/weather/weatherView.do">교통/날씨 정보</a>
	</button>
	<button class="btn-menu">
		<a href="#">문의사항</a>
	</button>
	<button id="menu">
		<a href="#">예약확인</a>
	</button>
</div>
	

	 
	 


        
        


