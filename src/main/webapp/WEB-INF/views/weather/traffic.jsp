<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ulslide.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>교통 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

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
}
.temp, .wind{
	padding:5px;
}
#map{
	display : block; 
	margin: 0; 
	float:left;
	margin-bottom : 190px;
}
/* .infoDiv{
	display : block;
	width: 100px; 
	height:100px; 
	border:1px solid black; 
	float:left;
	margin-left : 100px;
	margin-bottom : 90px;
} */
 #banner{
            width: 150px;
            height: 500px;
            /* background: #e8e8e8; */
            overflow: hidden;
            position: sticky;
            top : 0; 
            margin-left: 150px;
    		display: inline-block;
    		border : 1px solid lightgray;
            
        }
        .banner{
            margin-left: 100%; 
            height: 100%;
            float: right;
            
        }
        span{
            color: white;
            font-size: 2.0em;
            position: absolute;
            top: 10px;
            left: 10px;
        }
footer{
	margin-top : 1050px;
}
</style>
</head>
<script>


</script>
<body>
<c:import url="../common/header.jsp"/>

<!-- nav div  -->
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/weather/trafficView.do">실시간 교통 정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath }/weather/weatherView.do">실시간 날씨 정보</a>
  </li>
</ul>

<div id="mapNbanner" style="width:100%; height:680px;">
<!-- map div -->

<div id="map" style="width:1000px;height:500px; margin-left:85px;"></div>

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
	console.log(li); 
	
	for(var i = 0; i<campData.length; i++){
		var campDataOne = campData[i];
	// 지도에 마커를 생성하고 표시한다
	
	var marker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(campDataOne['li'], campDataOne['lo']), // 마커의 좌표
	    map: map // 마커를 표시할 지도 객체
	});

	// 마커 위에 표시할 인포윈도우를 생성한다
	var infowindow = new kakao.maps.InfoWindow({
	    content : '<div style="padding:5px;">'+ campDataOne['name'] + 
	    '<br><a href="https://map.kakao.com/link/to/'+campDataOne['name'] + ',' + campDataOne['li'] +',' + campDataOne['lo'] + '" style="color:blue" target="_blank">길찾기</a></div>' // 인포윈도우에 표시할 내용
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

<!-- banner div -->
	<div id="banner">
	    <img class="banner"/>
	    <span> </span>
	</div>
	<script>
$(document).ready(function(){
	 
    var imgList = ["${pageContext.request.contextPath }/resources/images/coleman.jpg", "../resources/images/hibrow.jpg", "../resources/images/snowpeak.jpg"]; // 배너 이미지 배열
 
 
    banner(".banner", imgList, 5000);
});
 
function banner(selector, imgList, speed){
    /*
     * selector : 선택자
     * imgList  : 이미지 배열
     * speed    : 슬라이드 시간
    */
 
    var currentIndex = 0;
    var $banner = $(selector);
    var $tag = $("span");
    $banner.attr("src", imgList[currentIndex]);
    $tag.text("0" + ( currentIndex + 1 ));
 
    setInterval(function(){
 
        currentIndex ++;
        if( currentIndex == imgList.length )
        {
            currentIndex = 0;
        }
 
        $banner.attr("src", imgList[currentIndex]);
        $tag.text("0" + ( currentIndex + 1 ));
 
        $banner.animate({'width':'100%'},1000);
    }, speed);
}    
 
</script>	
</div>	

<c:import url="../common/footer.jsp"/>

<!-- custom js file link  -->
	<script src="/camp/resources/js/script.js"></script>
</body>
</html>