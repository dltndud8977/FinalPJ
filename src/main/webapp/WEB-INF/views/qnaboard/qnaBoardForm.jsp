<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 작성</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	<script src="htpagetps://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	<script src="${Context.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=nContent]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;	
	}
 
	
	var category = document.boardFrm.campNo.value;
	if (category == "-") {
		alert('카테고리를 선택해주세요.');
		document.boardFrm.campNo.focus();
		return false;

	}
	
	
	
	
	/*부트스트랩 : file 변경시 파일명 보이기 */
	$(function(){
		$('[name=upFile]').on('change',function(){
		    var fileName = $(this).prop('files')[0].name;//파일명(jquery)
		    console.log($(this).val());
		    $(this).next('.custom-file-label').html(fileName);
		})
	});
	
	$(document).ready(function() {
		  $('#summernote').summernote();
		});
	
	</script>
	 <style>
	div#board-container{width:1200px; margin:0 auto; text-align:center; margin-top:7.9%;}
	#comple{margin-left:93.3%;}
  	#board-container{
  		
  		 position : relative;
  		margin-left: 9.5%;
  		margin-top: 2%;
  		width : 80%;
 		
  	}
  	#exampleSelect1{
  	 margin-left : 15%;
  	 margin-top: 0%;
  	 
  	}
  	
  	#exampleSelect{
  		width:30%;
  		 margin-top: 3%;
  		 margin-left: -3.8%;
  		
  	}
 
 	#boardname{
 	margin-top: 1%;
 	}
 	.banner{
 	width:9%;
 	
 	margin-top: -69%;
 	margin-left: 90.5%;
 	}
 	
 	.banner1{
 	width:9%;
 	
 	margin-top: -35%;
 	margin-left: 90.5%;
 	}
 	
  
  </style>
</head>
<body>
	<div id="container">
		<c:import url="../common/header.jsp"/>
		<div id="board-container">
			<form name="boardFrm" action="${pageContext.request.contextPath}/qnaboard/qnaBoardFormEnd.do" method="post"  enctype="multipart/form-data">
				<input type="text" class="form-control" placeholder="제목" name="askTitle" id="boardTitle" required>
				<input type="text" class="form-control" name="userId" value="${member.userId}" readonly required>
				<div class="col-lg-4">
									<div class="checkout__input">
										<div class="form-group">
										<label id="exampleSelect" class="input-group-text">카테고리</label>
											<select id="exampleSelect1" name="askCategory" class="custom-file-label">
												<option value="-" selected="selected">선택하세요
												<option value="1">문의사항
												<option value="2">사업자 등록
											    
											</select>
										</div>
									</div>
								</div>
				<!-- input:file소스 : https://getbootstrap.com/docs/4.1/components/input-group/#custom-file-input -->
				<!-- style.css에서 div의  padding:10px을 제거함 -->
				<div class="input-group mb-3" style="padding:0px;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text">첨부파일1</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
				    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
				  </div>
				</div>
				<div class="input-group mb-3" style="padding:0px;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text">첨부파일2</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
				    <label class="custom-file-label" for="upFile2">파일을  선택하세요</label>
				  </div>
				</div>
				
			    <textarea class="form-control"  name="askContent" placeholder="내용" rows=22; required></textarea>
				<br />
					<input type="submit" class="btn btn-outline-success" id="comple" value="저장" >
			<input type="button" class="btn btn-outline-danger" id="delete" value="취소" onclick="location.href='${pageContext.request.contextPath}/qnaboard/qnaBoardList.do'"/>
			</form>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
	
	<div>
	<aside>
	<img src="/camp/resources/images/campban.gif" art="배너" class="banner">
	<img src="/camp/resources/images/ban2.gif" art="배너" class="banner1">
	</aside>
	</div>
</body>
</html>