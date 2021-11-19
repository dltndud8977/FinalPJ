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
<title>교통 정보</title>

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
    border: 1px solid white;
    height:50px;
	margin : 50px;
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
	margin-bottom : 90px;
}
.infoDiv{
	display : block;
	width: 100px; 
	height:100px; 
	border:1px solid black; 
	float:left;
	margin-left : 90px;
	margin-bottom : 90px;
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
	<li><a href="${pageContext.request.contextPath }/weather/weatherView.do">실시간 날씨 정보</a></li>
	<li><a href="${pageContext.request.contextPath }/weather/trafficView.do">실시간 교통 정보</a></li>
</ul>
</div>

<!-- map div -->

<div id="map" style="width:830px;height:600px; margin-left:70px;"></div>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6595e8f05a907d26649ff019d39dc1a"></script>
<script>

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.31198, 127.09325), // 지도의 중심좌표
	        level: 11, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 

	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 실시간교통 타일 이미지 추가
	map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC); 

	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new kakao.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	var campData = [
		[37.550887, 127.790234, "양평 금물산 하늘소 캠프", "Gyeonggi-do"],
		[37.131162, 127.295752, "용인 반딧불 캠핑장", "Yongin"],
		[37.416009, 127.078084, "청계산 골든벨리 캠핑장", "Seongnam-si"],
		[37.459397, 126.860457, "광명 도덕산 캠핑장", "Seongnam-si"]
	];
	
	for(var i = 0; i<campData.length; i++){
	// 지도에 마커를 생성하고 표시한다
	
	var marker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(campData[i][0], campData[i][1]), // 마커의 좌표
	    map: map // 마커를 표시할 지도 객체
	});

	// 마커 위에 표시할 인포윈도우를 생성한다
	var infowindow = new kakao.maps.InfoWindow({
	    content : '<div style="padding:5px;">'+ campData[i][2] + 
	    '<br><a href="https://map.kakao.com/link/to/'+campData[i][2]+','+campData[i][0]+',' + campData[i][1] + '" style="color:blue" target="_blank">길찾기</a></div>' // 인포윈도우에 표시할 내용
	});

	// 인포윈도우를 지도에 표시한다
	infowindow.open(map, marker);
	
    // 마우스 드래그시 이동가능
	map.setDraggable(true);
    
	// 마커에 mouseover 이벤트를 등록한다
	kakao.maps.event.addListener(marker, 'mouseover', function() {
	    console.log('마커에 mouseover 이벤트가 발생했습니다!');
	});

	// 마커에 mouseout 이벤트 등록
	kakao.maps.event.addListener(marker, 'mouseout', function() {
	    console.log('마커에 mouseout 이벤트가 발생했습니다!');
	});

	}
</script>

<!-- info div -->
<div class="infoDiv" style="width:130px;height:600px;">광고배너 div</div>

<%-- <c:import url="../common/footer.jsp"/> --%>
</body>
</html>