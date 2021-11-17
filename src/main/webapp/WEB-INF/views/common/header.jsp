<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<script src="/camp/resources/js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="/camp/resources/css/style.css" />


<div class="logobox">
	
	 <img src="/camp/resources/images/shadowlogo.png" alt="#" />
</div>

        
<div class="loginbox">

	<form class="form">
		<div class="int-area">
			<input type="text" name="id" id="id"  autocomplete="off" required/>
			<label for="id">UserName</label>
		</div>
		<br />
		
		<div class="int-area">
			<input type="password" name="pw" id="pw"  autocomplete="off" required/>
			<label for="pw">Password</label>
		</div>
	 	<div class="btn-area">
	 		<button type="submit">Login</button>
	 	</div>
	 	<div class="caption">
	 		<a href="/camp/member/memberEnroll.do">회원가입</a>
	 	</div>
	 	<div class="caption">
	 		<a href="">비밀번호 찾기</a>
	 	</div>
	</form>
</div>

<div class="menubar">
	<button class="btn-menu">
		<a href="${ pageContext.request.contextPath }/reserve/reserveList.do">캠핑장</a>
	</button>
	<button class="btn-menu">
	<a href="${ pageContext.request.contextPath }/board/PsBoardList.do" >캠핑장 후기</a>
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


        
        


