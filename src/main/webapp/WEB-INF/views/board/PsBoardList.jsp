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
			location.href = "${pageContext.request.contextPath}/board/PsBoardForm.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var nNo = $(this).attr("id");
				console.log("nNo="+nNo);
				location.href = "${pageContext.request.contextPath}/board/PsBoardView.do?nNo="+nNo;
			});
		});
	</script>
	 <style>
  
  	
  	#board-container{
  		
  		 position : relative;
  		margin-left: -15%;
  		margin-top: 10%;
  		width : 130%;
 		
  	}
  	#btn-add{
  	position : relative;
  	 margint-top: -10%;
  	}
 
  	
  </style>
	</head>
<body>
 <c:import url="../common/header.jsp"/>
	<div class="container">   
	   	  <section id ="board-container">
	     	 <div class="tableArea">
	     	<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-info" onclick="fn_goBoardForm()"; />
                  <table id="listArea" class="table table-striped table-hover">
                     <tr class="table-info">
                        <th>번호</th>
                        <th>제목</th>               
                        <th>내용</th>               
                        <th>작성일</th>                            
                        <th>작성자</th>
                     </tr>
                        <c:forEach items = "${list}" var="ps">
                           <tr id="${ps.NNo}">
                              <td>${ps.NNo}</td>
                              <td>${ps.NTitle}</td>
                              <td>${ps.NContent} </td>
                              <td>${ps.NDate}</td>
                              <td>${ps.NWriter}</td>
                              <td align="center">
                                    <c:if test="${ps.fileCount>0 }">
                                          <img alt="첨부파일" src="${pageContext.request.contextPath }>
                              </c:if>
                        </td>
                     </tr>
                </c:forEach>
            </table>
                  <!-- pagination{e} -->

		<!-- search{s} -->

		<div class="form-group row justify-content-center">

			<div class="w100" style="padding-right:10px">

				<select class="form-control form-control-sm" name="searchType" id="searchType">

					<option value="title">제목</option>

					<option value="Content">본문</option>

					<option value="reg_id">작성자</option>

				</select>

			</div>

			<div class="w300" style="padding-right:10px">

				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">

			</div>

			<div>

				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>

			</div>

		</div>

		<!-- search{e} -->

	</div>

	</article>	
	      <c:out value="${pageBar}" escapeXml="false"/>	    	    
	    </section>
		 
 </div>
<c:import url="../common/footer.jsp"/>

</body>
</html>