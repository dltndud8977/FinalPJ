<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/enroll.css" />



</head>
<body>
	
	
	<div class="memberEnroll">
	<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/shadowlogo.png" alt="logo" /></a>
	<form id="insertMemberForm" action="memberEnrollEnd.do" method="post">
		<ul>
			<li><label>아이디<br />
			<input type="text" name="userId" id="id" size="61" required />
			</label></li>
			
			<li><label>비밀번호<br />
	 		<input type="password" name="userPw" id="pw" size="61" required/>
			</label></li>
			
			<li><label>비밀번호 확인<br />
	 		<input type="password" id="pw2" size="61" required/>
			</label></li>
			
			<li><label>이름<br />
			<input type="text" name="userName" id="name"  size="61" required/>
			</label></li>	
			
			<li><label>이메일<br />
			<input type="email" name="email" id="email" size="61"/>
			</label></li>
			
			<li><label>핸드폰</label><br />
			<input type="tel" name="phone" id="tel" size="32" placeholder="번호를 입력하세요" required/>
			<button type="button" id="btn-security">인증번호받기</button>
			</li>
			<input type="text" id="security" size="61" placeholder="인증번호를 입력하세요" required/>
			
			<li><label>회원타입</label><br />
			<input type="radio" name="userType" value="1"/><label id="type" >일반회원</label> 
			<input type="radio" name="userType" value="2"/><label id="type" >사업자회원</label>
			<input type="radio" name="userType" value="3"/><label id="type" >관리자</label>
			</li>
			
			<li><button type="button" onclick="sendInsert();">가입하기</button> <br />
			<button type="reset">취소</button></li>
			
		</ul>
	</form>
	
	<script>
			function sendInsert(){
				var p1=$("#pw").val(), p2=$("#pw2").val();
				if(p1!=p2){
					alert("패스워드가 일치하지 않습니다.");
					$("#pw").focus();
				} else {
					$('#insertMemberForm').submit();
				}
			}

	</script>
	
	</div>
			

	

</body>
</html>