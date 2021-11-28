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
			//한글파일명이 있을 수 있으므로, 명시적으로 encoding
			oldName = encodeURIComponent(oldName);
			location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oldName+"&newName="+newName;
		}
	</script>
</head>
<body>
	<div id="container">
		<c:import url="../common/header.jsp"/>
		<div id="board-container">
		<a href="/camp/board/PsBoardList.do"   class="text1" style="font-size:40px; text-decoration: none; color:black;" >CampGo!</a>
		<span	>제목 :
			<input type="text" id="ntitle" class="form-control" placeholder="제목" name="NTitle" id="boardTitle" value="${PsBoard.NTitle }" readonly required>
		</span>
		<p>작성자:</p>	
			<input type="text" id="nwriter" class="form-control" name="NWriter" value="${PsBoard.NWriter}" readonly required>
			<c:forEach items="${attachmentList}" var="a" varStatus="vs">
				<button type="button" 
						class="btn btn-outline-success btn-block"
						onclick="fileDownload('${a.oldName}','${a.newName }');">
					첨부파일${vs.count} - ${a.oldName }
				</button>
			</c:forEach>
			<p>내용:</p>
		    <textarea class="form-control" name="NContent" placeholder="내용"  rows="18" required>${PsBoard.NContent }</textarea>
		    <br>
		    <button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/board/PsBoardList.do'">리스트로</button>
		    <c:if test="${member.userId eq PsBoard.NWriter}">
		    &nbsp;
			<button class="btn btn-outline-info" type="button" onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateView.do?nNo=${PsBoard.NNo}'">수정 페이지</button>
			</c:if>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>