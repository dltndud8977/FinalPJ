<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 비밀번호</title>


<style>

.pw_new{
	width : 500px;
	margin-left : 37%
}

input{

width : 460px;

height : 40px;

margin : 0;

margin-top : 20px;

}

img{
	margin-left : 28%;
}

label{

margin-top : 30px;
	
}

input:hover{
	border-radius : .5rem;
	box-shadow: 0 1rem 2rem rgba(135,206,235,.5);
	transition: all .2s linear;
}

#check{
	color : white;
	background : #B0C4DE;
	border : 1px solid #B0C4DE;
	cursor : pointer;
	
}

#check:hover{
	background : rgba(201, 203, 202, 0);
	color : #1C3145;
	transition: all .2s linear;
	border-radius : .5rem;
}


</style>
</head>
<body>

<div class="pw_new">
	<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/shadowlogo.png" alt="logo" /></a>
<form action="${pageContext.request.contextPath}/member/pw_new.do" method="POST" class="content">
	<div class="textbox">
	<input type="hidden" name="userId" value="${ userId }"/>
		<label>새비밀번호</label>  <br />
			<input id="pw" name="userPw" type="password" required> 
	</div>
	<div class="textbox" style="margin-top: 20px;">
		<label>새비밀번호 확인</label> <br />
			<input id="pw2" type="password"  required>
		
	</div>

	<br><br>
	<input type="submit" id="check" name="check" value="비밀번호변경">
	
</form>
</div>
</body>
</html>