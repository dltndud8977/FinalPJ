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
        <a href="/camp/board/PsBoardList.do">review</a>
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
	    
	    
	    <!-- memberEnroll form container 
	    
	    <div class="memberEnroll-form-container"> 
	    	<i class="fas fa-times" id="form-close"></i>
	    	
	    	<form id="insertMemberForm" action="memberEnrollEnd.do" method="post">
		<ul>
			<li id="memberType">
			<button >일반회원</button>
			
			<button  onclick="location.href='bsMemberEnroll.do'">사업자회원</button>
			</li>
		
			<li><label>아이디<br />
			<input type="text" name="userId" id="userId_" size="61" required />
			<input type="text" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
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
			<input type="tel" name="phone" id="tel" size="61" placeholder="번호를 입력하세요" required/>
			
			</li>
			
			<!--  
			<li><label>회원타입</label><br />
			<input type="radio" name="userType" value="1"/><label id="type" >일반회원</label> 
			<input type="radio" name="userType" value="2"/><label id="type" >사업자회원</label>
			<input type="radio" name="userType" value="3"/><label id="type" >관리자</label>
			</li>
			-->
			
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
			
			/* 아이디 중복검사 이벤트 추가 */
			$("#userId_").on("keyup", function(){
		        var userId = $(this).val().trim();
		        
		        if(userId.length<4) {
		        	$(".guide.error").hide();
		        	$(".guide.ok").hide();
		        	$(".guide.invalid").show();
		        	return;
		        	
		        } else {
		        	
			        $.ajax({
			            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
			            data : {userId:userId},
			            dataType: "json",
			            success : function(data){
			                console.log(data);
			                // if(data==true)  //stream 방식
			                	
			                if(data.isUsable==true){ //viewName 방식
			                    $(".guide.error").hide();
			                    $(".guide.invalid").hide();
			                    $(".guide.ok").show();
			                    $("#idDuplicateCheck").val(1);
			                } else {
			                    $(".guide.error").show();
			                    $(".guide.invalid").hide();
			                    $(".guide.ok").hide();
			                    $("#idDuplicateCheck").val(0);
			                }
			            }, error : function(jqxhr, textStatus, errorThrown){
			                console.log("ajax 처리 실패");
			                //에러로그
			                console.log(jqxhr);
			                console.log(textStatus);
			                console.log(errorThrown);
			            }
			       });
		     	}
		     //console.log(userId);
			});
		
		
		function validate(){
			var userId = $("#userId_");
			if(userId.val().trim().length<4){
				alert("아이디는 최소 4자리이상이어야 합니다.");
				userId.focus();
				return false;
			}
			
			//아이디중복체크여부
		    if($("#idDuplicateCheck").val()==0){
		        alert("사용가능한 아이디를 입력해주세요.");
		        return false();
		    }
			
			return true;
		}
			
			
			
	</script>
	
	    
	    </div>
	    
		
	</header>
	
	<script src="/camp/resources/js/script.js"></script>