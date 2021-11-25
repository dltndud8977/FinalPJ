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
<title> 예약 확인 페이지</title>
 <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  
  <style>
  	.text{
  		 top : 30%;
  		 position: absolute;
 		 left: 10%;
 		 width : 1000px;
  	}
  	
  	#calendar-container{
  		 position: absolute;
  		 top: 50%;
 		 left: 10%;
 		 width : 1300px;
 		 height : 1000px;
  	}
  	* {
  		font-size : 0.7em;
  	}
  	
  	.btn{
  		width : 100px;
  	}
  </style>
</head>
<body>

<c:import url="../common/header.jsp"/>

  <!-- calendar 태그 -->
 

		 <div class="text">
               <table id="tbl-board" class="table table-striped table-hover" border="1">
					<tr>
						<th>캠핑장</th>
						<th>체크인</th>
						<th>체크아웃</th>
						<th>방이름</th>
						<th>예약 취소</th>
					</tr>
					
					<c:forEach items="${list}" var="m"> 
					<tr id="${m.RNo}">
						<td>${m.campName}</td>
						<td>${m.checkIn}</td>
						<td>${m.checkOut}</td>
						<td>${m.roomName}</td>
						<td> <button class="cancelBtn" >취소하기</button></td>
					</tr>
					</c:forEach>
				</table>
				
				<div id="count">
				<c:out value="${pageBar}" escapeXml="false"/>
				</div>
           </div>
       
           
            <div id='calendar-container'>
  				  <div id='calendar'></div>
 		   </div>
 		   
           <script>
          
           $(function(){
   			$("tr[id]").find('.cancelBtn').on("click",function(){
   				
   				var check = confirm("해당 예약을 취소하시겠습니까?");
   				if(check){
   				var rNo = $("tr[id]").attr('id');
   				console.log(rNo);
   				location.href = "${pageContext.request.contextPath}/reserve/cancel.do?rNo="+rNo;
   				} else {
   					return false;
   				}
   			});
   		});
           
           
           
           
           function formatDate(date) {
        	   var d= new Date(date),
        	   	month = '' + (d.getMonth() + 1),
        	   	day = '' + (d.getDate()),
        	   	year = d.getFullYear();
        	   
        	   if(month.length < 2)
        		   month = '0' + month;
        	   if(day.length <2)
        		   day ='0' + day;
        	   
        	   return [year, month, day].join('-');
           }
           
           $.ajax({
   	       	url: "schedule.do",
   	       	type: "post",
   	       	data:{userId:"${member.userId}"},
   	       	success: function(data){  
   	       		console.log(data);
   	       		for(var i=0, result=[]; i<data.length;i++){
   	       		var start = formatDate(new Date(data[i].checkIn));
   	       		var end = formatDate(new Date(data[i].checkOut+(86401*1000)));
   	       		var title = data[i].campName;    
   	       		result.push({"start":start,"end":end,"title":title})
   	       		}
   	       		console.log(end);
   	       		
   	       		
        	    $(function(){
        	      // calendar element 취득
        	      var calendarEl = $('#calendar')[0];
        	      // full-calendar 생성하기
        	      var calendar = new FullCalendar.Calendar(calendarEl, {
        	        height: '700px', // calendar 높이 설정
        	        expandRows: true, // 화면에 맞게 높이 재설정
        	        slotMinTime: '00:00', // Day 캘린더에서 시작 시간
        	        slotMaxTime: '24:00', // Day 캘린더에서 종료 시간
        	        nextDayThreshold: '00:00',
        	        // 해더에 표시할 툴바
        	        headerToolbar: {
        	          left: 'prev,next today',
        	          center: 'title',
        	          right: ''
        	        },
        	        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        	         // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        	       
        	        //editable: true, // 수정 가능?
        	        selectable: true, // 달력 일자 드래그 설정가능
        	        nowIndicator: true, // 현재 시간 마크
        	        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        	        locale: 'ko', // 한국어 설정
        	       
        	        events: result
        	       
        	      });
        	    
        	      // 캘린더 랜더링
        	      calendar.render();
        	    });
   	     },
	       	error: function(errorCode){
	       		alert("불러오기 실패");
	       		console.log(errorCode);
	       	},
	    });
          
           </script>
</body>
</html>