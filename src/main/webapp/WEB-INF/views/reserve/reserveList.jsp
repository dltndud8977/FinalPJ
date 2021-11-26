<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=126ce8d3145eef8aa4efc497e048bbca"></script>
<html>
<head>

<meta charset="UTF-8">
<title>캠핑장 선택</title>
<style>


	
	header{
		float:left;
	}

	.camping{
	}
	.camp{
		margin-top : 100px;
		cursor:pointer; 
		width : 750px;
		z-index : 5;
		margin-left : 100px;
	}
	.img{
		width : 700px;
		height : 9%; 
	}
	
	.imgdiv{
		object-fit: cover;
	}
	
	.map {
		display: inline-block;
		float:left;
		margin-top: 100px;
		margin-left : 50px;
	
	}
	
	#allCamp{
		display: inline-block;
		float:left;
		z-index : 10;
		overflow: scroll;
		height: 1200px;
	}
	
	.footer{
		float:left;
		width : 2000px;
	}
	
	
</style>
</head>
<body>
	<c:import url="../common/header.jsp"/>


<div id="allCamp">	

<div id="geum" class="camp" value="1">
	<div class="camping imgdiv">
		<img class="img" src="/camp/resources/images/geumMulSan.png"  alt="" />		
	</div>
	<div class="camping info">
		<h1>양평 금물산하늘소캠프</h1>
	</div>
	<hr />
</div>

<div id="goldenValley" class="camp" value="2">
	<div class="camping imgdiv">
		<img class="img" src="/camp/resources/images/goldenValley.jpg"  alt="" />		
	</div>
	<div class="camping info">
		<h1>청계산 골든밸리캠핑장</h1>
	</div>
	<hr />
</div>


<div id="banditbul" class="camp" value="3">
	<div class="camping imgdiv">
		<img class="img" src="/camp/resources/images/banDitBul.png"  alt="" />		
	</div>
	<div class="camping info">
		<h1>용인 반딧불캠핑장</h1>
	</div>
	<hr />
</div>

<div id="doducksan" class="camp" value="4">
	<div class="camping imgdiv">
		<img class="img" src="/camp/resources/images/doDuckSan.jpg" alt="" />		
	</div>
	<div class="camping info">
		<h1>광명 도덕산캠핑장</h1>
	</div>
	<hr />
</div>
</div>
	<div class="camping map" >
	
	<div id="map" style="width:800px;height:1000px;"></div>
	<hr />
	</div>

<c:import url="../common/footer.jsp"/>

<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.416009163800204, 127.07811618277573),
			level: 11
		};
		console.log(${list.campLa});

		var map = new kakao.maps.Map(container, options);
		var positions = [
		    {
		        title: '양평 금물산하늘소 캠프', 
		        latlng: new kakao.maps.LatLng(37.549663230709875, 127.79082519812093)
		    },
		    {
		        title: '청계산 골든밸리캠핑장', 
		        latlng: new kakao.maps.LatLng(37.416009163800204, 	127.07811618277573)
		    },
		    {
		        title: '용인 반딧불캠핑장', 
		        latlng: new kakao.maps.LatLng(37.13118775253948,127.29574168461978)
		    },
		    {
		        title: '광명 도덕산캠핑장',
		        latlng: new kakao.maps.LatLng(37.45942142359924,	126.86051496743382)
		    },
		];
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		
		// 마커가 표시될 위치입니다 
	for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
		

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null); 
	</script>
	

<script>
		
		$(function(){
			$("div[value]").on("click",function(){
				var campNo = $(this).attr("value");
				console.log("campNo="+campNo);
				location.href = "${pageContext.request.contextPath}/reserve/campInfo.do?campNo="+campNo;
			});
		});
	</script>
	
	
</body>
</html>