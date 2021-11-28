<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 상세보기</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="htpagetps://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	
	<style>
		div#board-container{width:1200px; margin:0 auto; text-align:center; margin-top:8%;}
		div#board-container input,div#board-container button{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
		 
	</style>
	<script>
		
		function fileDownload(oldName, newName){
			//한글파일명이 있을 수 있으므로,   명시적으로 encoding
			oldName = encodeURIComponent(oldName);
			location.href="${pageContext.request.contextPath}/qnaboard/fileDownload.do?oName="+oldName+"&newName="+newName;
		}
	</script>
</head>
<body>
	<div id="container">
		<c:import url="../common/header.jsp"/>
		<div id="board-container">
		<a href="/camp/board/PsBoardList.do"   class="text1" style="font-size:40px; text-decoration: none; color:black;" >CampGo!</a>
		<p>제목:
			<input type="text" class="form-control" placeholder="제목" name="askTitle" id="boardTitle" value="${qnaBoard.askTitle }" required>
		</p>
		<p>아이디:	
			<input type="text" class="form-control" name="userId" value="${qnaBoard.userId}" readonly required>
		</p>
			<c:forEach items="${attachmentList}" var="a" varStatus="vs">
				<button type="button" 
						class="btn btn-outline-success btn-block"
						onclick="fileDownload('${a.oldName}','${a.newName }');">
					첨부파일${vs.count} - ${a.oldName }
				</button>
			</c:forEach>
			<p>제목:
		    <textarea class="form-control" name="askContent" placeholder="내용" rows=18; required>${qnaBoard.askContent }</textarea>
		    </p>
		    <br>
		    
		    <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/qnaboard/qnaBoardList.do'">리스트로</button>
		    <c:if test="${member.userId eq qnaBoard.userId}">
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/qnaboard/qnaBoardUpdateView.do?askNo=${qnaBoard.askNo}'">수정 페이지</button>
			</c:if>
			
			
		</div>
		
		<!-- Comments Form -->
	<div class="card my-4">
		<h5 class="card-header">Leave a Comment:</h5>
		<div class="card-body">
			<form name="comment-form" action="/comment/comment/comwrite" method="post" autocomplete="off">
				<div class="form-group">
					<input type="hidden" name="comNo" th:value="*{comNo}" />
					<textarea name="comContent" class="form-control" rows="3"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>