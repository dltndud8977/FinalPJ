<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
		
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />

<!--  header section -->
	<header>
		
	
	
		<a href="/camp/" class="logo"><img src="${pageContext.request.contextPath}/resources/images/shadowlogo.png" alt="logo" /></a>
		
		<nav class="navbar">
        <a href="#home">home</a>
        
         <a href="${pageContext.request.contextPath }/reserve/reserveList.do">reserve</a>
        
        <a href="#camp">camp</a>
        <a href="${pageContext.request.contextPath }/board/PsBoardList.do">review</a>
        <a href="${pageContext.request.contextPath }/weather/weatherView.do">weather&traffic</a>
        <a href="#contact">contact</a>
        
       <c:if test="${!empty member}">
       <a href="${pageContext.request.contextPath }/reserve/goCheck.do?userId=${member.userId}">myReservation</a>
      </c:if>
      
         <c:if test="${member.userType==3}">
        <a href="${pageContext.request.contextPath }/weather/mapRegist.do">Map registration</a>
        <a href="${pageContext.request.contextPath }/admin/reserManage.do">Admin</a>
      </c:if>
        
    	</nav>
    
    <div class="icons">
        <i class="fas fa-user" id="login-btn"></i>
    </div>
    
    <!-- 회원정보수정 아이콘 -
    <c:if test="${!empty member }">
    <div class="icons">
        <i class="fas login-user" id="memberupdate-btn"></i>
    </div>
    
    -->
    
   
    </c:if>
    
    
   <!-- login form container  -->

	<div class="login-form-container">
	
		<i class="fas fa-times" id="form-close"></i>
		
	    <form action="${pageContext.request.contextPath}/member/memberLogin.do">
	        <h3>login</h3> 
	        <input type="text" class="box" name="userId" placeholder="아이디를 입력하세요">
	        <input type="password" class="box" name="userPw" placeholder="비밀번호를 입력하세요">
	        <input type="submit" value="login now" class="btn">
	        <input type="checkbox" id="remember">
	        <label for="remember">remember me</label>
	        <p>forget password? <a href="#">click here</a></p>
	        <p>don't have and account? <a href="/camp/member/memberEnroll.do">회원가입</a></p>
	    </form>
	    
	    
	
	</form>
	    
	   
	
	    
	    </div>
	    
		
	</header>
	
	<script src="/camp/resources/js/script.js"></script>