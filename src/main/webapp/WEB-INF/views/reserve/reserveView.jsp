<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset='utf-8' />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
		overflow: visible;
		float: left;
	}

	
	.outer{
		width:1700px;
		height:1500px;
		background:white;
		color:black;
		margin-left:100px;
		margin-right:20%;
		margin-top:100px;
		
		
		
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
		
	
	
	input{
		 border:.1rem solid rgba(0,0,0,.9);
	}

	.image{
		background-size: cover;
	}	
.footer{
		float:left;
		width : 2000px;
	}
	
	.controller{
		position:absolute;
	}
	span.prev{
		top:-400px;
	}

	span.next{
		top: -400px;
		right: -650px;
	}
	
	#table{
		width : 600px;
		height : 500px;
	}
</style>
</head>
<body style="padding:30px;">

<c:import url="../common/header.jsp"/>

<div class="outer">
	<input type="hidden" id="userId" value="${member.userId}"/>
	<input type="hidden" id="campName" value="${list.campName}" />
	
	<h1>${list.campName}</h1>
	<div class="camp">
	<div class="camping imgdiv" id="slideShow">
		<ul class="slides">
		<c:forEach items="${picture}" var="a" varStatus="vs">
			<li><img class="image" width="670px" height="630px" src="${pageContext.request.contextPath}/resources/images/${a.picName}"/></li>
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
	<br />
	<br />
	<br />
	<br />
	
	<div class = "camp" id="table">
	
	<table class="table table-hover">
<tr>
  			<th><h2>사진</h2></th>
  			<th><h2>이름</h2></th>
  			<th><h2>가격</h2></th>
  		</tr>
  		<c:forEach items="${room}" var="r" varStatus="vs">
  		
  		<tr id="${r.roomName}" class="room">
  			<td>
  			<img width="200px" height="120px" src="${pageContext.request.contextPath}/resources/images/${r.roomPicture}"/></td>
  			<td width="300px" id="roomName"><h3>${r.roomName}</h3></td>
  			<td width="200px" id="roomPrice"><h3>${r.roomPrice}</h3></td>
  		</tr>
  		</c:forEach>
</table>

  </div>
    
  </div>
  <c:import url="../common/footer.jsp"/>
  <script type="text/javascript"
		src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  <script>
  
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
	       	url: "reserveFull.do",
	       	type: "post",
	       	data:{campName:"${list.campName}"},
	       	success: (function(data){
	       		console.log(data)
	       		for(var i=0, result=[]; i<data.length;i++){
	   	       		var start = formatDate(new Date(data[i].checkIn));
	   	       		var end = formatDate(new Date(data[i].checkOut+(86401*1000)));
	   	       		var title = data[i].roomName;    
	   	       		result.push({"start":start,"end":end,"title":title, "color" : "red"})
	   	       		}
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
          right: ''
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
         // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
       
        //editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        //dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
		
        events: result,
        
        // 달력 클릭으로 데이터 가져오기
        dateClick: function(info) {           
            var date = info.dateStr;
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
			var day = new Date();
			var today = formatDate(day);
			if($('#start').attr('value') < today || $('#finish').attr('value') < today){
				alert('해당 날짜는 선택할 수 없습니다.');
				$('#start').attr('value',null);
				$('#finish').attr('value',null);
			}
        	
			console.log("start = " + $('#start').attr('value'))
			console.log("finish = " + $('#finish').attr('value'))
 
        }
      });
    
      // 캘린더 랜더링
      calendar.render();
    });
  })
  });
  
  // 사진 슬라이드
    const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너 
	const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들 
	let currentIdx = 0; //현재 슬라이드 index 
	const slideCount = slideImg.length; // 슬라이드 개수 
	const prev = document.querySelector('.prev'); //이전 버튼 
	const next = document.querySelector('.next'); //다음 버튼 
	const slideWidth = 670; //한개의 슬라이드 넓이 
	const slideMargin = 100; //슬라이드간의 margin 값 
	
	//전체 슬라이드 컨테이너 넓이 설정 
	slides.style.width = (slideWidth + slideMargin) * slideCount + 'px'; 
	
	function moveSlide(num) { 
		slides.style.left = -num * 770 + 'px'; 
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

	
	
	var IMP = window.IMP; // 생략가능
	var iamportKey = 'imp92712602';
	
	$(function() {
		IMP.init( iamportKey );
	}); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	$(function(){
		$("tr[id]").on("click",function(){
			console.log(this)
			var roomName = $(this).attr("id");
			var start = $('#start').attr('value');
			var finish = $('#finish').attr('value');
			var userId= $('#userId').val();
			
			var sdt = new Date(start);
			var edt = new Date(finish);
			
			var dateDiff = Math.ceil((edt.getTime()-sdt.getTime())/(1000*3600*24));
			
			var roomName = $(this).find('#roomName').text();
			var roomPrice = $(this).find('#roomPrice').text();
			var campName = $("#campName").val();
			console.log(campName);
			
			
			if(start==null || finish==null){
				alert("입실일과 퇴실일을 확인해주세요");
				return false;
			} else {
				var check = confirm(roomName +"을 예약하시겠습니까?");
				if(check){
			
			IMP.request_pay({
				pg : 'kakao',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:' + roomName,
				amount : parseInt(roomPrice) * dateDiff,
				buyer_email : 'test@example.com',
				buyer_name : '홍길동',
				buyer_tel : '010-1111-2222',
				buyer_addr : '서울시 강남구 역삼동',
				buyer_postcode : '01234'
			}, function(rsp) {
				if (rsp.success) {
					//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					$.ajax({
						url : "/reserve/roomReserve.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
						type : 'POST',
						dataType : 'json',
						data : {
							roomName : roomName,
							checkIn : start,
							checkOut : finish,
							userId : userId,
							campName : campName,
							code : 'P0001',
							imp_uid : rsp.imp_uid,
							pay_method : rsp.pay_method,
							price : rsp.paid_amount,
							status : rsp.status,
							title : rsp.name,
							pg_tid : rsp.pg_tid,
							buyer_name : rsp.buyer_name,
							paid_at : rsp.paid_at,
							receipt_url : rsp.receipt_url
						//기타 필요한 데이터가 있으면 추가 전달
						}
					});
					location.href= "${pageContext.request.contextPath}/reserve/roomReserve.do?roomName="+roomName+"&checkIn="+start+"&checkOut="+finish+"&userId="+userId+"&campName="+campName;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '\n에러내용 : ' + rsp.error_msg;
					alert(msg);
				}
			});
				}
				else {
					return false;
				}
			}
			
			
		});
	});
</script>

<!-- custom js file link  -->
	<script src="/camp/resources/js/script.js"></script>

</body>
</html>