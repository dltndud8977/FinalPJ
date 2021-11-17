<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<script>
		function fn_goBoardForm(){
			location.href = "${pageContext.request.contextPath}/board/PsBoardForm.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var boardNo = $(this).attr("id");
				console.log("nNo="+nNo);
				location.href = "${pageContext.request.contextPath}/board/boardView.do?no="+nNo;
			});
		});
	</script>
	</head>
<body>
	<div class="container">
	   <c:import url="../common/header.jsp"/>
	   	  <section id ="board-container">
	     	 <div class="tableArea">
	      
	     		 <input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goBoardForm();/>
	        		 <table id="listArea" class="table table-striped table-hover">
			            <tr>
			               <th>번호</th>
			               <th >제목</th>               
			               <th>내용</th>               
			               <th>작성일</th>                            
			               <th>작성자</th>
			            </tr>
	         			   <c:forEach items="${list}" var="ps">
					            <tr id="${ps.nNo}">
					               <td>${ps.nNo}</td>
					               <td>${ps.nTitle}</td>
					               <td>${ps.nContent} </td>
					               <td>${ps.nDate}</td>
					               <td>${ps.nWriter}</td>
					               <td align="center">
					               	   <c:if test="${ps.fileCount>0 }">
					               	   	   <img alt="첨부파일" src="${pageContext.request.contextPath }>
			               	   </c:if>
			               </td>
			               
			            </tr>
	             </c:forEach>
	         </table>
	      <c:out value="${pageBar}" escapeXml="false"/>
	    </section>
	 <c:import url="../common/footer.jsp"/>
 </div>
</body>
</html>