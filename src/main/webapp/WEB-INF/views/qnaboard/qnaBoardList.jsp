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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script>
		function fn_goBoardForm(){
			location.href = "${pageContext.request.contextPath}/qnaboard/qnaBoardForm.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var askNo = $(this).attr("id");
				console.log("nNo="+askNo);
				location.href = "${pageContext.request.contextPath}/qnaboard/qnaBoardView.do?askNo="+askNo;
			});
		});
	</script>
	
	</head>
<body>
	<div class="container">

	   	  <section id ="board-container">
	     	 <div class="tableArea">
	      
	     	<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goBoardForm()";/>
                  <table id="listArea" class="table table-striped table-hover">
                     <tr>
                        <th>번호</th>
                        <th>제목</th>               
                        <th>내용</th>               
                        <th>작성일</th>                            
                        <th>작성자</th>
                     </tr>
                        <c:forEach items = "${list}" var="qna">
                           <tr id="${qna.askNo}">
                              <td>${qna.askNo}</td>
                              <td>${qna.askTitle}</td>
                              <td>${qna.askContent} </td>
                              <td>${qna.qnaDate}</td>
                              <td>${qna.userId}</td>
                              <td align="center">
                                    <c:if test="${qna.fileCount>0 }">
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