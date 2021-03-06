<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/enroll.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">



<!--  header section -->
	<header>
		
	
	
		<a href="/camp/" class="logo"><img src="${pageContext.request.contextPath}/resources/images/shadowlogo.png" alt="logo" "/></a>
		
		<nav class="navbar" style="margin-left: 15%;">
        <a href="${pageContext.request.contextPath }">Home</a>
        
         <a href="${pageContext.request.contextPath }/reserve/reserveList.do">Camp</a>

        <a href="/camp/board/PsBoardList.do">Review</a>
        <a href="${pageContext.request.contextPath }/weather/weatherView.do">Weather&Traffic</a>
        <a href="${pageContext.request.contextPath }/qnaboard/qnaBoardList.do">Contact</a>
        
       <c:if test="${!empty member}">
       <a href="${pageContext.request.contextPath }/reserve/goCheck.do?userId=${member.userId}">MyReservation</a>
      </c:if>
      
         <c:if test="${member.userType==3}">
        <a href="${pageContext.request.contextPath }/weather/mapRegist.do">Map registration</a>
        <a href="${pageContext.request.contextPath }/admin/reserManage.do">Admin</a>
      </c:if>
        
    	</nav>
    	
    	<c:if test="${!empty member}">
		   <div class="icons" id="lsy">
		        <i class="fas fa-user" id="memberView-btn" style="color:#1C3145;"></i>
		    </div>
	    </c:if>
    	
    	<c:if test="${empty member}">
		    <div class="icons" id="lsy">
		        <i class="fas fa-user" id="login-btn"></i>
		    </div>
	    </c:if>
    
 
    
   
   
    
    
   <!-- login form container  -->

<c:if test="${empty member}">
	<div class="login-form-container" id="lsy">
	
		<i class="fas fa-times" id="form-close"></i>
		
	    <form action="${pageContext.request.contextPath}/member/memberLogin.do">
	        <h3>login</h3> 
	        <input type="text" class="box" name="userId" placeholder="???????????? ???????????????">
	        <input type="password" class="box" name="userPw" placeholder="??????????????? ???????????????">
	        <input type="submit" value="login now" class="btn">
	        <p>forget password? <a href="${pageContext.request.contextPath }/member/pw_find.do">click here</a></p>
	        <p>don't have and account? <a href="/camp/member/memberEnroll.do">????????????</a></p>
	    </form>
	
	</c:if>
	
	<!-- pwFind form contatiner -->
	
	
	
	
	<!-- memberView ????????? -->
	<c:if test="${!empty member}">
	<div class="memberView-form-container" id="lsy">
	
		<i class="fas fa-times" id="form-close"></i>
		<div id="update-container">
		<form name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
			<label>????????? <br />
			<input type="text" class="form-control" name="userId" id="userId_" value="${member.userId}"  size="61" readonly required> <br /><br />
			</label>
			
			<label> ?????? <br />
			<input type="text" class="form-control" placeholder="??????" name="userName" id="userName" value="${member.userName}" size="61" required> <br /> <br />
			</label> 
			
			<label>Email <br />
			<input type="email" class="form-control" placeholder="?????????" name="email" id="email" value="${member.email}" size="61" required> <br /> <br />
			</label>
			
			<label> ????????? <br />
			<input type="tel" class="form-control" placeholder="???????????? (???:01012345678)" name="phone" id="phone" maxlength="11" value="${member.phone}" size="61" required> <br /> <br />
			</label>

			<br />
			<input type="button" class="btn btn-outline-success" id="btn" onclick="location.href='${pageContext.request.contextPath}/member/memberLogout.do'" value="????????????">&nbsp;
			<input type="submit" class="btn btn-outline-success" id="btn" value="??????" >&nbsp;
			<input type="reset" class="btn btn-outline-success" id="btn" value="??????">&nbsp;
			<input type="button" class="btn btn-outline-success" id="btn" onclick="location.href='${pageContext.request.contextPath}/member/memberDelete.do'" value="??????">
		</form>
	</div>
	
	</div>
	</c:if>
	    
	  
			
			
	</script>
	
	    
	    </div>
	    
		
	</header>
	
	
	
	