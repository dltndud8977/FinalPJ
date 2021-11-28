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

			<li><label>아이디
			<div id="userId-container" style="margin-top : 0;">
			<input type="text" name="userId" id="userId_" size="61" required style="display:block;"/>
			<!-- 아이디중복검사 코멘트추가 -->
				<span class="guide ok" style="color : green;">사용 가능</span>
 	          	<span class="guide error" style="color: red;">사용 불가</span>
				<span class="guide invalid" style="color: red;"> 4글자 미만</span>
			<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0"/>
			</div>
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
			
			
			<li><label>회원타입</label><br />
			<input type="radio" name="userType" value="1" onclick="showForm(1);"/><label id="type"  onclick="showForm(1);">일반회원</label> 
			<input type="radio" name="userType" value="2" onclick="showForm(2);"/><label id="type" onclick="showForm(2);" >사업자회원</label>
			<input type="radio" name="userType" value="3" onclick="showForm(3);"/><label id="type" onclick="showForm(3);">관리자</label>
			</li>
			
			<div id="bs">
			<li><label>사업장 번호<br />
			<input type="text" name="bsNo" id="no" size="61" required />
			</label></li>
			<li><label>사업장 명<br />
			<input type="text" name="bsName" id="name" size="61" required />
			</label></li>
			</div>
			
			
			<li class="lsy"><button type="button" onclick="sendInsert();" >가입하기</button> <br />
			<a href="${pageContext.request.contextPath}" style="text-decoration : none;"><button type="reset" >취소</button></a></li>
			
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
			$(".guide").hide();
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
		
		function showForm(no){
			if( no == 1) {
				$("#bs").hide();                            // 나타내기. 영역도 같이 지움.
			} else if (no == 2) {
			    $("#bs").show();                            // 나타내기. 영역도 같이 나타남.
			} else if (no == 3) {
				$("#bs").hide();                            // 나타내기. 영역도 같이 지움.
			}
		}
		
		$("#bs").hide();  
			
	</script>
	
	</div>
			

	

</body>
</html>