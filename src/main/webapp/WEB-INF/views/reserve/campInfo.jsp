<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=발급받은 APP KEY를 넣으시면 됩니다."></script>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 상세정보</title>
<link rel="stylesheet" href="/camp/resources/css/picture.css">

<style>

	.camping{
		
		height : 10%;
		margin : auto;
		width: 720px;
		padding : 10px;
		
	}
	
	.camp{
		position : relative;
		margin-top : 40px;
		
		
	}
	
	.btnDiv{
		width: 720px;
		
	}

   .reservationbtn{
      margin-left : 300px;
      background-color : rgba(176, 196, 222,.7);
      width : 200px;
      height : 50px;      
      cursor : pointer;
      color : white;
      border : 1px solid #B0C4DE;   
      font-size : 20px;
   }
   
   .reservationbtn:hover{
      
      background:rgba(201, 203, 202, 0);
        color:#1C3145;

   }


	.imgdiv{
		object-fit: cover;
	}	
	
	*{
		padding : auto;
	}
	
	.controller{
		position:absolute;
	}
	
	span.prev {
    top: 300px;
}

span.next {
    top: 300px;
    left: 570px;
}

</style>

</head>
<body>
	<c:import url="../common/header.jsp"/>
	
	
	
	<div id="${list.campNo}" class="camp">
	<div class="camping name"><h1>${list.campName}</h1><hr /></div>
	
	<div class="camping imgdiv" id="slideShow">
		
			<ul class="slides">
			<c:forEach items="${picture}" var="a" varStatus="vs">
				<li><img width="650px" height="630px" class= "pic" src="${pageContext.request.contextPath}/resources/images/${a.picName}"/></li>
					</c:forEach>
			</ul>

		<p class="controller">
			<span class="prev">&lang;</span>
			<span class="next">&rang;</span>
		</p>
		
	</div>
		
	<div class="camping info">
	<hr />
	<h1>상세정보</h1> <br>
		<h2>${list.explain}</h2>
		<hr />
	</div>
	<div class="camping map">
	<h1>상세위치</h1>
	<div id="map" style="width:700px;height:400px;"></div>
	<hr />
	</div>
	
	<div class="camping review">
		<h1>리뷰 </h1>
		<table>
			<c:forEach items="${board}" var="b" varStatus="vs">
			<tr>
				<td><h2>${b.NWriter} :</h2></td>
				<td><h2>&nbsp;${b.NContent}</h2></td>
			</tr>
			</c:forEach>
		</table>
		<hr />
	</div>
	
	
	<div class="camping btnDiv">
	 <c:if test="${empty member}">
	 <button class="reservationbtn" id="belogin">예약하기</button>
	</c:if>
	
	<c:if test="${!empty member}">
	<button class="reservationbtn" id="reservation">예약하기</button>
	</c:if>
	</div>
	<br />
	<br />
	<br />
	<br />
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=126ce8d3145eef8aa4efc497e048bbca"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(${list.campLa}, ${list.campLo}),
			level: 10
		};
		console.log(${list.campLa});

		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(${list.campLa}, ${list.campLo}); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null); 
	</script>
	
	
  
  	<script>
  	$(function(){
		$("#reservation").on("click",function(){
				var campNo = $(".camp").attr("id");
				console.log("campNo="+campNo);
				location.href = "${pageContext.request.contextPath}/reserve/reserve.do?campNo="+campNo;				

		});
	});
  	
	$(function(){
		$("#belogin").on("click",function(){
				alert("로그인 후 이용해주세요");
				return false;

		});
	});
  	const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너 
  	const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들 
  	let currentIdx = 0; //현재 슬라이드 index 
  	const slideCount = slideImg.length; // 슬라이드 개수 
  	const prev = document.querySelector('.prev'); //이전 버튼 
  	const next = document.querySelector('.next'); //다음 버튼 
  	const slideWidth = 650; //한개의 슬라이드 넓이 
  	const slideMargin = 100; //슬라이드간의 margin 값 
  	
  	//전체 슬라이드 컨테이너 넓이 설정 
  	slides.style.width = (slideWidth + slideMargin) * slideCount + 'px'; 
  	
  	function moveSlide(num) { 
  		slides.style.left = -num * 750 + 'px'; 
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

  
  	
  	
  	</script>

	
</div>
 <c:import url="../common/footer.jsp"/>
 
 <!-- custom js file link  -->
	<script src="/camp/resources/js/script.js"></script>
</body>
</html>