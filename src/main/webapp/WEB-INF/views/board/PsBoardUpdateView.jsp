<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시글 수정</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<script src="htpagetps://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	<style>
			div#board-container{width:1200px; margin:0 auto; text-align:center; margin-top:8%;}
		div#board-container input,div#board-container button{margin-bottom:15px;}
		/* 부트스트랩 : 파일라벨명 정렬*/
		div#board-container label.custom-file-label{text-align:left;}
		#ncontent{width:1200px; position:relative; left:-10.5%; }
		#attach1{width:1200px; margin-left:0%; margin-top:-1%;}
		#attselect1{width:1140px; margin-left:5%; margin-top:-2%; }
		#attach2{width:1200px; margin-left:0%; margin-top:-1.7%; }
		#attselect2{width:1140px; margin-left:5%; margin-top:-2%; }
		#ncontent{margin-left:10.5%;}
		#comple{margin-left:90.3%;}
		#exampleSelect1{ margin-left : 15%; margin-top: 0%;}	
  		#exampleSelect{ width:30%;  margin-top: 3%; margin-left: -3.8%;}
	</style>
	<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var qnaContent = $("[name=nContent]").val();
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
	
	function fileDownload(oldName, newName){
		//한글파일명이 있을 수 있으므로, 명시적으로 encoding
		oldName = encodeURIComponent(oldName);
		location.href="${pageContext.request.contextPath}/board/fileDownload.do?oName="+oldName+"&newName="+newName;
	}

	function fileDelete(obj, afNo, rName){
		$.ajax({
			url : '${pageContext.request.contextPath}/board/fileDelete.do',
			data : { afNo : afNo, rName : rName }, 
			dataType : 'json',
			success : function(data){
				if(data == true) {
					alert("첨부파일 삭제 완료!");
					$(obj).parent().remove();
				} else {
					alert("첨부파일 삭제 실패!");
				}
			}, error : function(req, status, error){
				console.log(req);
				console.log(status);
				console.log(error);
			}
		});
	}
	</script>
</head>
<body>
	<div id="container">
	<c:import url="../common/header.jsp"/>
		<div id="board-container">
		<a href="/camp/board/PsBoardList.do"   class="text1" style="font-size:40px; text-decoration: none; color:black;" >CampGo!</a>
			<form name="boardFrm" action="${pageContext.request.contextPath}/board/boardUpdate.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
				<input type="hidden" name="nNo" value="${ psboard.NNo }" />
				<input type="text" class="form-control" placeholder="제목" name="NTitle" id="boardTitle" value="${psboard.NTitle}" required>
				<input type="text" class="form-control" name="NWriter" value="${member.userId}" readonly required>
					<div class="col-lg-4">
									<div class="checkout__input">
										
										<div class="form-group" >
										  <label id="exampleSelect" class="input-group-text">카테고리</label>
											<select class="custom-file-label" id="exampleSelect1" name="campNo"  >
												<option value="-" selected="selected">선택하세요
												<option value="1">양평금물산하늘소캠핑장
												<option value="2">청계산골든밸리캠핑장
											    <option value="3">용인반딧불캠핑장
												<option value="4">광명도덕산캠핑장
											</select>
										</div>
									</div>
								</div>				
								
								<c:forEach items="${attachmentList}" var="a" varStatus="vs">
					<div class="rows">
						<button type="button" class="btn btn-outline-success col-8"
							onclick="fileDownload('${a.originalFileName}','${a.renamedFileName }');" download>
						첨부파일${vs.count} - ${a.originalFileName }
					</button>
					<button type="button" class="btn btn-outline-danger col-3"
							onclick="fileDelete(this, '${a.attachmentNo}', '${a.renamedFileName }');">파일 삭제</button>
					</div>
				</c:forEach>
				<br>
				<div class="input-group mb-3" style="padding:0px;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text" id="attach1">첨부파일1</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" name="upFile" id="upFile1" multiple>
				    <label class="custom-file-label" id="attselect1"for="upFile1">파일을 선택하세요</label>
				  </div>
				</div>
				<div class="input-group mb-3" style="padding:0px;">
				  <div class="input-group-prepend" style="padding:0px;">
				    <span class="input-group-text" id="attach2">첨부파일2</span>
				  </div>
				  <div class="custom-file">
				    <input type="file" class="custom-file-input" name="upFile" id="upFile2">
				    <label class="custom-file-label" id="attselect2" for="upFile2">파일을 선택하세요</label>
				  </div>
				</div>
			    <textarea class="form-control" id="ncontent" name="NContent" placeholder="내용" rows=16; required>${psboard.NContent}</textarea>
				<br />
				<input type="submit" class="btn btn-outline-success" id="comple" value="수정 완료" /> &nbsp;
				<input type="button" class="btn btn-outline-danger" id="delete" value="삭제" onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?nNo=${psboard.NNo}'"/>
			</form>
		</div>
		<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>