<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset='utf-8' />
  <title>예약하기</title>
  <link rel="stylesheet" href="/camp/resources/css/picture.css">
  <!-- jquery CDN -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
  
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<style>
  /* body 스타일 */
  html, body {
      
    font-size: 14px;
  }
  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }
  #calendar-container {
  position: relative;
  	width : 50%;
  	display: inline-block;
  	
  	
  	
  }
  .camping{
		position : relative;
		height : 10%;
		margin : auto;
		width: 40%;
		padding : 10px;
		
	}
	
	.camp{
		position : relative;
		display: inline-block;	
		margin-right : 50px;
		height : 1000px;
		overflow: visible;
		float: left;
	}

	
	.outer{
		width:1700px;
		height:1000px;
		background:white;
		color:black;
		margin-left:auto;
		margin-right:20%;
		margin-top:50px;
		
		
	}
	#dateSelect{
		margin-left:auto;
		margin-right : 50px;
		margin-top : 30px;
		width : 600px;
		
	}
	.calendarDate{
		height : 40px;
		width : 200px;
	}
	.room {
		cursor:pointer;
	}
</style>
</head>
<body style="padding:30px;">

<c:import url="../common/header.jsp"/>

<div class="outer">

	<div class="camp">
	<div class="camping imgdiv" id="slideShow">
		<ul class="slides">
		<c:forEach items="${picture}" var="a" varStatus="vs">
			<li><img width="700px" height="630px"src="${pageContext.request.contextPath}/resources/images/${a.picName}"/></li>
		</c:forEach>
		</ul>
	</div>
	
		
		<p class="controller">
			<span class="prev">&lang;</span>
			<span class="next">&rang;</span>
		</p>
		
	</div>
  <!-- calendar 태그 -->
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
  
	<div id="dateSelect">
	<input type="text" class="calendarDate" name="start" id="start" placeholder="입실일"/> ~ <input type="text" class="calendarDate" name="finish" id="finish" placeholder="퇴실일" />
	</div>
	
  <table border="1">
  		<tr>
  			<th>사진</th>
  			<th>이름</th>
  			<th>가격</th>
  		</tr>
  		<c:forEach items="${room}" var="r" varStatus="vs">
  		<tr id="${r.roomNo}" class="room">
  			<td><img width="300px" height="200px" src="${pageContext.request.contextPath}/resources/images/${r.roomPicture}"/></td>
  			<td>${r.roomName}</td>
  			<td>${r.roomPrice}</td>
  		</tr>
  		</c:forEach>
  </table>
  </div>
  
  <script>
  (function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
         // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
       
   /*
      // 이벤트 
        events: [
          {
            title: 'All Day Event',
            start: '2021-07-01',
          },
          {
            title: 'Long Event',
            start: '2021-07-07',
            end: '2021-07-10'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2021-07-09T16:00:00'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2021-07-16T16:00:00'
          },
          {
            title: 'Conference',
            start: '2021-07-11',
            end: '2021-07-13'
          },
          {
            title: 'Meeting',
            start: '2021-07-12T10:30:00',
            end: '2021-07-12T12:30:00'
          },
          {
            title: 'Lunch',
            start: '2021-07-12T12:00:00'
          },
          {
            title: 'Meeting',
            start: '2021-07-12T14:30:00'
          },
          {
            title: 'Happy Hour',
            start: '2021-07-12T17:30:00'
          },
          {
            title: 'Dinner',
            start: '2021-07-12T20:00:00'
          },
          {
            title: 'Birthday Party',
            start: '2021-07-13T07:00:00'
          },
          {
            title: 'Click for Google',
            url: 'http://google.com/', // 클릭시 해당 url로 이동
            start: '2021-07-28'
          }
         
        ]  
         */
      });
    
      // 캘린더 랜더링
      calendar.render();
    });
  })();
  
  
  const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너 
	const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들 
	let currentIdx = 0; //현재 슬라이드 index 
	const slideCount = slideImg.length; // 슬라이드 개수 
	const prev = document.querySelector('.prev'); //이전 버튼 
	const next = document.querySelector('.next'); //다음 버튼 
	const slideWidth = 700; //한개의 슬라이드 넓이 
	const slideMargin = 100; //슬라이드간의 margin 값 
	
	//전체 슬라이드 컨테이너 넓이 설정 
	slides.style.width = (slideWidth + slideMargin) * slideCount + 'px'; 
	
	function moveSlide(num) { 
		slides.style.left = -num * 780 + 'px'; 
		currentIdx = num; 
		} 
	
	prev.addEventListener('click', function () { 
		/*첫 번째 슬라이드로 표시 됐을때는 
		이전 버튼 눌러도 아무런 반응 없게 하기 위해 
		currentIdx !==0일때만 moveSlide 함수 불러옴 */
		
		if (currentIdx !== 0) moveSlide(currentIdx - 1); 
		}); 
	
	next.addEventListener('click', function () { 
		/* 마지막 슬라이드로 표시 됐을때는 
		다음 버튼 눌러도 아무런 반응 없게 하기 위해 
		currentIdx !==slideCount - 1 일때만 moveSlide 함수 불러옴 */ 
		
		if (currentIdx !== slideCount - 1) { 
			moveSlide(currentIdx + 1);
			} 
		});

	
	
	$(function(){
		$("td[data-date]").on("click",function(){
			var date = $(this).attr('data-date');
			// input:text 누르면 value = null
			$(function(){
				$("#start").on("click",function(){
					$('#start').attr('value',null);
				});
				$("#finish").on("click",function(){
					$('#finish').attr('value',null);
				});
			});
			// start, finish 여부에 따라 start, finish 값 넣기
			if($('#start').attr('value') == null && $('#finish').attr('value') == null){
				$('#start').attr('value',date);
			} else if($('#start').attr('value') != null && $('#finish').attr('value') == null){
				$('#finish').attr('value',date);
				
			} else if($('#start').attr('value') == null && $('#finish').attr('value') != null){
				$('#start').attr('value',date);
			} else {
				$('#finish').attr('value',date);
			}
			// start가 finish보다 늦은 날일 경우
			if($('#start').attr('value') >= $('#finish').attr('value')){
				$('#start').attr('value',date);
				$('#finish').attr('value',null);
			}
			
		});
	});
	
	$(function(){
		$("tr[id]").on("click",function(){
			var roomNo = $(this).attr("id");
			var start = $('#start').attr('value');
			var finish = $('#finish').attr('value');
			console.log("roomNo="+roomNo);
			location.href = "${pageContext.request.contextPath}/reserve/roomReserve.do?roomNo="+roomNo+"&checkIn="+start+"&checkOut="+finish;
		});
	});
	
	
</script>

</body>
</html>