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
<title>날씨 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
	margin-top: 150px;
    margin-left: 85px;
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
	width:150px;
}
.temp, .wind{
	padding:5px;
	text-align : center;
	width:150px;
}
.campIndex{
	padding:5px;
	text-align : center;
	width:150px;
}
#map{
	display : block; 
	margin: 0; 
	float:left;
	margin-bottom : 10px;
}
/* .infoDiv{
	display : block;
	width: 100px; 
	height:100px; 
	border:1px solid white; 
	float:left;
	margin-left : 50px;
	margin-bottom : 90px;
}

table{
	width:530px;
	border-collapse : collapse;
	
}
th, td{
	border-bottom:1px solid lightgray;
	text-align:center;
	padding:2.5px;
}
th{
	background-color : #0081CF;
	color:white;
}
table tr:nth-child(2), table tr:nth-child(3), table tr:nth-child(4){
	color:#5EC268;
}
table tr:nth-child(5), table tr:nth-child(6){
	color:#00AC7D;
}
table tr:nth-child(7), table tr:nth-child(8), table tr:nth-child(9){
	color:#007A84;
}
table tr:nth-child(10), table tr:nth-child(11), table tr:nth-child(12){
	color:#156173;
}
table tr:nth-child(13), table tr:nth-child(14){
	color:#2F4858;
}
 */

.btn-group{
	margin-left : 85px;
	margin-bottom : 85px;
}

</style>

</head>

<body>
<c:import url="../common/header.jsp"/>

<!-- nav div  -->
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/weather/weatherView.do">실시간 날씨 정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath }/weather/trafficView.do">실시간 교통 정보</a>
  </li>
</ul>
<!-- map div -->

<div id="map" style="width:90%;height:500px; margin-left:85px;"></div>
<!-- <p>
	<button type="button" onclick="setOverlayMapTypeId('weather')">캠핑장 날씨 보기</button> 
	<button type="button" onclick="setOverlayMapTypeId('campIndex')">캠핑 지수 보기</button> 
</p> -->
<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
  <label class="btn btn-outline-primary" for="btnradio1" onclick="setOverlayMapTypeId('weather')" style="font-size: 1rem;">캠핑장 날씨 보기</label>

  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
  <label class="btn btn-outline-primary" for="btnradio2" onclick="setOverlayMapTypeId('campIndex')" style="font-size: 1rem;">캠핑 지수 보기</label>
</div>
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


		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		var li = [];
		var lo = [];
		var campName = [];
		var area = [];
		var campData = [];
		<c:forEach items="${list}" var="cam">
		
		li.push("${cam.campLa}");
		lo.push("${cam.campLo}");
		campName.push("${cam.campName}");
		area.push("${cam.campArea}");
		
		campData.push({"li":"${cam.campLa}","lo":"${cam.campLo}","name":"${cam.campName}","area":"${cam.campArea}"})
		
		</c:forEach>
		/* console.log(li); */
		
		$(function(){
			setOverlayMapTypeId('weather');		
		});
		
		function setOverlayMapTypeId(typeId){
			if(typeId == 'weather'){
				for(var i=0; i<campData.length; i++){	
					var campDataOne = campData[i];
					console.log(campDataOne);
					$.ajax({
						url : 'https://api.openweathermap.org/data/2.5/weather?q='+ campDataOne['area'] +'&appid=7e29e09b03f53da4e88f28bcbcecffd0&units=Metric',
						async: false,
						success : function(wData){
						//alert(wData.weather[0].icon);
						var $ctemp = wData.main.temp;
						var $cwind = wData.wind.speed;
						var $cicon = wData.weather[0].icon;
						/* console.log(wData); */
						
							// 지도에 마커를 생성하고 표시한다
							var marker = new kakao.maps.Marker({
							    position: new kakao.maps.LatLng(campDataOne['li'], campDataOne['lo']), // 마커의 좌표
							    map: map // 마커를 표시할 지도 객체
							});
		
							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
							    content : '<div class="campName">'+ campDataOne['name'] + '</div>'
							    		  +'<div class="temp">'+ '<img src="http://openweathermap.org/img/wn/'+$cicon+'.png">' + $ctemp +"℃"+ '</div>'
							    		  +'<div class="wind">'+ "바람 : " + $cwind + "m/s" + '</div>'
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
				}
				
			} else {
				for(var i=0; i<campData.length; i++){	
					var campDataOne = campData[i];
					
					$.ajax({
						url : 'https://api.openweathermap.org/data/2.5/weather?q='+ campDataOne['area'] +'&appid=7e29e09b03f53da4e88f28bcbcecffd0&units=Metric',
						async: false,
						success : function(wData){
						//alert(wData.weather[0].icon);
						var $ctemp = wData.main.temp;
						var $cwind = wData.wind.speed;
						var $cicon = wData.weather[0].icon;
						
						
							// 지도에 마커를 생성하고 표시한다
							var marker = new kakao.maps.Marker({
							    position: new kakao.maps.LatLng(campDataOne['li'], campDataOne['lo']), // 마커의 좌표
							    map: map // 마커를 표시할 지도 객체
							});
							
							// 인포윈도우를 생성합니다
							var infowindow = new kakao.maps.InfoWindow({
							    content :  '<div class="campName">'+ campDataOne['name'] + '</div>'
							    		  +'<div class="campIndex">'+ getCampIndex($cwind) +  '</div>'
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
				}
			}
		}
		
		function getCampIndex( campIndex ){
			var msg = '';
			
			if(campIndex < 3.4) msg ='캠핑 즐기기 좋아요!';
			else if(campIndex < 5.5) msg = '풀 팩다운이 필요합니다.';
			else if(campIndex < 8) msg ='잠을 자기 싫으신가요?';
			else if(campIndex < 10.8) msg = '나는 밤새도록 망치질을 하고싶다.';
			else if(campIndex < 17.2) msg ='텐트를 새로 장만하고싶어요!?';
			else if(campIndex < 20.8) msg = '텐트와 함께 날아가보고 싶어요!';
			else if(campIndex < 28.5) msg = '텐트를 버리고 싶습니다.';
			else if(campIndex > 28.6) msg = '목숨이 위험합니다.';
			
			return msg;
		}
</script>

<!-- info div -->
<%-- <div class="infoDiv" style="width:530px;height:600px;">
	<table>
		<caption>
			<h4>캠핑 지수(바람 지수)</h4>
			<tr>
				<th>명칭</th>
				<th>m/s</th>
				<th>캠핑 지수</th>
				<th>비고</th>
			</tr>
			<tr>
				<td>고요</td>
				<td>0 - 0.2</td>
				<td style="font-weight:bold">캠핑 즐기기 좋아요!</td>
				<td></td>
			</tr>
			<tr>
				<td>실바람</td>
				<td>0.3 - 1.5</td>
				<td style="font-weight:bold">캠핑 즐기기 좋아요!</td>
				<td></td>
			</tr>
			<tr>
				<td>남실바람</td>
				<td>1.6 - 3.3</td>
				<td style="font-weight:bold">캠핑 즐기기 좋아요!</td>
				<td></td>
			</tr>
			<tr>
				<td>산들바람</td>
				<td>3.4 - 5.4</td>
				<td style="font-weight:bold">풀 팩다운이 필요합니다.</td>
				<td></td>
			</tr>
			<tr>
				<td>건들바람</td>
				<td>5.5 - 7.9</td>
				<td style="font-weight:bold">잠을 자기 싫으신가요?</td>
				<td></td>
			</tr>
			<tr>
				<td>흔들바람</td>
				<td>8.0 - 10.7</td>
				<td style="font-weight:bold">나는 밤새도록 망치질을 하고싶다.</td>
				<td></td>
			</tr>
			<tr>
				<td>된바람</td>
				<td>10.8 - 13.8</td>
				<td style="font-weight:bold">텐트를 새로 장만하고싶어요!</td>
				<td>폭풍주의보</td>
			</tr>
			<tr>
				<td>센바람</td>
				<td>13.9 - 17.1</td>
				<td style="font-weight:bold">텐트를 새로 장만하고싶어요!</td>
				<td>폭풍주의보</td>
			</tr>
			<tr>
				<td>큰바람</td>
				<td>17.2 - 20.7</td>
				<td style="font-weight:bold">텐트와 함께 날아가보고 싶어요!</td>
				<td>간판이 떨어지고 <br> 유리가 깨짐</td>
			</tr>
			<tr>
				<td>큰센바람</td>
				<td>20.8 - 24.4</td>
				<td style="font-weight:bold">텐트를 버리고 싶습니다.</td>
				<td>폭풍 경보</td>
			</tr>
			<tr>
				<td>노대바람</td>
				<td>24.5 - 28.4</td>
				<td style="font-weight:bold">자연과 싸우고 싶습니다.</td>
				<td>태풍</td>
			</tr>
			<tr>
				<td>왕바람</td>
				<td>28.5 - 32.6</td>
				<td style="font-weight:bold">목숨이 위험합니다.</td>
				<td>태풍</td>
			</tr>
			<tr>
				<td>싹쓸바람</td>
				<td>32.7 - </td>
				<td style="font-weight:bold">신과 함께</td>
				<td>매미 60.0m/s <br />차바 56.7m/s <br />루사 56.5m/s</td>
			</tr>
		</caption>
	</table> --%>
</div>

<c:import url="../common/footer.jsp"/>

<!-- custom js file link  -->
	<script src="/camp/resources/js/script.js"></script>
</body>

</html>