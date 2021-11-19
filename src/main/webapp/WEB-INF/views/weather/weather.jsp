<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 / 교통 정보</title>

<style>

ol, ul {
	list-style : none;
}
#mapImg{
	width:524px; 
	height:673px; 
	margin:0px 70px; 
}
.nav{
   
	margin : 70px;
}
.nav ul li{
	float:left;
	width: 160px;
	font-weight : bold;
}
.nav ul li a{
	display : #3E4756;
	text-decoration : none;
	color : black;
}
.nav ul li a:hover{
	color : #0081CF;
	text-decoration : underline;
}
.campName{
	color: white; 
	padding:5px; 
	background:grey;
}
.temp, .wind{
	padding:5px;
}
#map{
	display : block; 
	margin: 0; 
	float:left;
}
.infoDiv{
	display : block;
	width: 100px; 
	height:100px; 
	border:1px solid black; 
	float:left;
	margin-left : 50px;
}
</style>
</head>
<script>


</script>
<body>
<c:import url="../common/header.jsp"/>

<!-- nav div  -->
<div class="nav">
<ul>
	<li><a href="${pageContext.request.contextPath }/weather/weatherView.do">날씨 정보</a></li>
	<li><a href="${pageContext.request.contextPath }">교통 정보</a></li>
</ul>
</div>

<!-- map div -->

<div id="map" style="width:630px;height:600px;"></div>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6595e8f05a907d26649ff019d39dc1a"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(36.01828, 128.36135), // 지도의 중심좌표
		        level: 13, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		var campData = [
			[37.550887, 127.790234, "양평 금물산 하늘소 캠프", "Gyeonggi-do"],
			[37.131162, 127.295752, "용인 반딧불 캠핑장", "Yongin"],
			[37.416009, 127.078084, "청계산 골든벨리 캠핑장", "Seongnam-si"],
			[37.459397, 126.860457, "광명 도덕산 캠핑장", "Seongnam-si"]
		];
		
		$(function(){
			for(var i=0; i<campData.length; i++){	
				var campDataOne = campData[i];
				
				$.ajax({
					url : 'https://api.openweathermap.org/data/2.5/weather?q='+ campDataOne[3] +'&appid=7e29e09b03f53da4e88f28bcbcecffd0&units=Metric',
					async: false,
					success : function(wData){
					//alert(wData.weather[0].icon);
					var $ctemp = wData.main.temp;
					var $cwind = wData.wind.speed;
					var $cicon = wData.weather[0].icon;
					
					
						// 지도에 마커를 생성하고 표시한다
						var marker = new kakao.maps.Marker({
						    position: new kakao.maps.LatLng(campDataOne[0], campDataOne[1]), // 마커의 좌표
						    map: map // 마커를 표시할 지도 객체
						});
	
						// 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
						    content : '<div class="campName">'+ campDataOne[2] + '</div>'
						    		  +'<div class="temp">'+ '<img src="http://openweathermap.org/img/wn/'+$cicon+'.png">' + $ctemp +"℃"+ '</div>'
						    		  +'<div class="wind">'+ "바람 : " + $cwind + '</div>'
						});
						console.log(infowindow);
						
						// 마커의 이벤트 리스너
					    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
					    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	
						// 마우스 드래그시 이동가능
						map.setDraggable(true);
						
						// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
						function makeOverListener(map, marker, infowindow) {
						    return function() {
						        infowindow.open(map, marker);
						    };
						}

						// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
						function makeOutListener(infowindow) {
						    return function() {
						        infowindow.close();
						    };
						}
					}
				});
				
				/*
				$.getJSON
				('https://api.openweathermap.org/data/2.5/weather?q='+ campDataOne[3] +'&appid=7e29e09b03f53da4e88f28bcbcecffd0&units=Metric',
						function(wData){
						//alert(wData.wind.speed);
						var $ctemp = wData.main.temp;
						 var $cwind = wData.wind.speed;
						 console.log(i);
						 console.log(campDataOne);
						 console.log(campData[i][0]);
							// 지도에 마커를 생성하고 표시한다
							var marker = new kakao.maps.Marker({
							    position: new kakao.maps.LatLng(campData[i][0], campData[i][1]), // 마커의 좌표
							    map: map // 마커를 표시할 지도 객체
							});
		
							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
							    content : '<div class="campName">'+ campData[i][2] + '</div>'
							    		  +'<div class="temp">'+ "온도 : " + $ctemp + '</div>'
							    		  +'<div class="wind">'+ "풍량 : " + $cwind + '</div>'
							});
							
							// 마커의 이벤트 리스너
						    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
						    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		
							// 마우스 드래그시 이동가능
							map.setDraggable(true);
						}
				);
			*/
			}
		})		
</script>

<!-- info div -->
<div class="infoDiv">캠핑 지수 div</div>
<%-- <c:import url="../common/footer.jsp">  --%>
</body>
</html>