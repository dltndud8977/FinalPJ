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
	</script>
</head>
<body>
	<div id="container">
	
		<div id="board-container">
			<form name="boardFrm" action="${pageContext.request.contextPath}/qnaboard/qnaBoardFormEnd.do" method="post"  enctype="multipart/form-data">
				<input type="text" class="form-control" placeholder="제목" name="askTitle" id="boardTitle" required>
				<input type="text" class="form-control" name="userId" value="${member.userId}" readonly required>
				<div class="col-lg-4">
									<div class="checkout__input">
										<p>
											카테고리
												<span>
													*
												</span>
										</p>
										<div>
											<select id="campNo" name="askCategory" class="form">
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
				    <label class="custom-file-label" for="upFile2">파일을 선택하세요</label>
				  </div>
				</div>
			    <textarea class="form-control" name="askContent" placeholder="내용" required></textarea>
				<br />
				<input type="submit" class="btn btn-outline-success"  value="저장" >
			</form>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>