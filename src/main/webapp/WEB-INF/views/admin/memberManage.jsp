<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<!-- 부트스트랩관련 라이브러리 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<html>
<head>
<meta charset="UTF-8">

 <style>
        body{
          
        }
        header{ 
            font-size: 30px;
            border: 1px solid green;
            text-align: center;
            background: lightpink;
            
        }
        main{
            display:inline-table;
            position:absolute;
            top : 20%;
            left : 10%;
            align : center;
            
        } 

      


        .text{
       	    position: absolute;
            width: 800px;
            height: 700px;
            top:300%;
                     
            font-size: 15pt;
            text-align: left;
            background: rgba(245, 243, 243, 0.979);
            color: black;
           
        }

             
        #count{
        		position : absolute;
				height: 100px;
				width : 400px;
				left : 25%;
				
			}
        table {
        	text-align : center;
        }
      .page-item{
      	width : 70px;
      	border : none;
      }
      .page-link {
      	width:50px;
      	
      }
			
    </style>
<title>관리자 페이지</title>
</head>
<body>

<c:import url="../common/header.jsp"/>

 <main>
  <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link" aria-current="page" href="${pageContext.request.contextPath }/admin/reserManage.do">예약관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active" href="${pageContext.request.contextPath }/admin/memberManage.do">일반회원관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath }/admin/bsMemberManage.do">사업자회원관리</a>
  </li>
 
</ul>
    
     <div class="text">
               <table id="tbl-board" class="table table-striped table-hover" border="1">
					<tr>
						<th>회원ID</th>
						<th>회원 이름</th>
						<th>휴대폰 번호</th>
						<th>이메일</th>
					</tr>
					
					<c:forEach items="${list}" var="m"> 
					<tr id="${m.userId}">
						<td>${m.userId}</td>
						<td>${m.userName}</td>
						<td>${m.phone}</td>
						<td>${m.email}</td>
					</tr>
					</c:forEach>
				</table>
				
				<div id="count">
				<c:out value="${pageBar}" escapeXml="false"/>
				</div>
            </div>
            </li>
            
    </main>
    
    <script>
    $(function() {
		$("#reservation").on("click",function(){
			location.href = "${pageContext.request.contextPath}/admin/reserManage.do";
		});
		
	});
	$(function() {
		$("#member").on("click",function(){
			location.href = "${pageContext.request.contextPath}/admin/memberManage.do";
		});
	});
	$(function() {
		$("#bsMember").on("click",function(){
			location.href = "${pageContext.request.contextPath}/admin/bsMemberManage.do";
		});
	});
   
    </script>
</body>
</html>