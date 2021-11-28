<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
<style>

.pw_find{
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

<div class="pw_find">
	<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/shadowlogo.png" alt="logo" /></a>
<form class = "content" action="pw_findEnd.do" method="post">
	<div class="textbox">
  		<label for>아이디</label> <br />
  		<input id="text" name=userId type="text" placeholder="아이디를 입력하세요" />
 	</div>
	<div class="textbox" style="margin-top: 20px;">
  		<label>이메일</label> <br />
  		<input id="email" name=email required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i" type="email" placeholder="이메일을 입력하세요" />
  	
	</div><br><br>
	
   	<input type="submit" id="check"  name="check" value="비밀번호찾기" >
 
   	
</form>
</div>

</body>
</html>