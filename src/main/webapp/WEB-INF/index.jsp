<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8" />
 	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CampGo! CampGo!</title>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="/camp/resources/css/style.css" />
    

    
</head>
<body>

	<c:import url="views/common/header.jsp"/>
	

	<!-- home section -->
	
	<section class="home" id="home">

   
    
     <div class="mainimg">
        <img src="/camp/resources/images/tent4.gif" id="mainimg" ></img>
    </div>
    
    <div class="content">
        <h3>adventure is worthwhile</h3>
        <p>이곳에 quick reserve 추가</p>
        <a href="#" class="btn">discover more</a>
    </div>
    </section>
    
    <!-- Reserve section starts  -->

	<section class="reserve" id="reserve">

    <h1 class="heading">
        <span>R</span>
        <span>E</span>
        <span>S</span>
        <span>E</span>
        <span>R</span>
        <span>V</span>
        <span>E</span>
    </h1>
    
        <div class="row">

	        <div class="image">
	            <img src="/camp/resources/images/tent3.jpg" alt="#">
	        </div>
        
	        <form action="">
	            <div class="inputBox">
	                <h3>where to</h3>
	                <input type="text" placeholder="place name">
	            </div>
	            <div class="inputBox">
	                <h3>how many</h3>
	                <input type="number" placeholder="number of guests">
	            </div>
	            <div class="inputBox">
	                <h3>arrivals</h3>
	                <input type="date">
	            </div>
	            <div class="inputBox">
	                <h3>leaving</h3>
	                <input type="date">
	            </div>
	            <input type="submit" class="btn" value="예약하기">
	        </form>
        
        </div>
    
    </section>
    
    <!-- Camp section starts  -->

<section class="camp" id="camp">

    <h1 class="heading">
        <span>c</span>
        <span>a</span>
        <span>m</span>
        <span>p</span>
        <span>p</span>
        <span>i</span>
        <span>n</span>
        <span>g</span>
    </h1>

    <div class="box-container">

        <div class="box">
            <img src="/camp/resources/images/geumMulSan.png"" alt="">
            <div class="content">
                <h3> <i class="fas fa-map-marker-alt"></i>양평 금물산 하늘소 캠프 </h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis, nam!</p>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
                <div class="price"> $90.00 <span>$120.00</span> </div>
                
                <!-- 예약하기 주소 추가!!!!!!! -->
                
                <a href="#" class="btn">예약하기</a>
            </div>
        </div>

        <div class="box">
            <img src="/camp/resources/images/goldenValley.jpg" alt="">
            <div class="content">
                <h3> <i class="fas fa-map-marker-alt"></i> 청계산 골든밸리 캠핑장 </h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis, nam!</p>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
                <div class="price"> $90.00 <span>$120.00</span> </div>
                <a href="#" class="btn">예약 하기</a>
            </div>
        </div>

        <div class="box">
            <img src="/camp/resources/images/banDitBul.png" alt="">
            <div class="content">
                <h3> <i class="fas fa-map-marker-alt"></i> 용인 반딧불 캠핑장 </h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis, nam!</p>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
                <div class="price"> $90.00 <span>$120.00</span> </div>
                <a href="#" class="btn">예약 하기</a>
            </div>
        </div>

        <div class="box">
            <img src="/camp/resources/images/doDuckSan.jpg" alt="">
            <div class="content">
                <h3> <i class="fas fa-map-marker-alt"></i> 광명 도덕산 캠핑장 </h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Veritatis, nam!</p>
                <div class="stars">
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="fas fa-star"></i>
                    <i class="far fa-star"></i>
                </div>
                <div class="price"> $90.00 <span>$120.00</span> </div>
                <a href="#" class="btn">예약하기</a>
            </div>
        </div>

    </div>

</section>

<section class="review" id="review">

    <h1 class="heading">
        <span>r</span>
        <span>e</span>
        <span>v</span>
        <span>i</span>
        <span>e</span>
        <span>w</span>
    </h1>

    <div class="swiper-container review-slider" style="overflow:hidden;">

        <div class="swiper-wrapper">

            <div class="swiper-slide">
                <div class="box">
                    <img src="/camp/resources/images/doduckA.jpg" alt="">
                    <h3>이수영</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa adipisci quisquam sunt nesciunt fugiat odit minus illum asperiores dolorum enim sint quod ipsam distinctio molestias consectetur ducimus beatae, reprehenderit exercitationem!</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="box">
                    <img src="/camp/resources/images/doduckB.jpg" alt="">
                    <h3>서민수</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa adipisci quisquam sunt nesciunt fugiat odit minus illum asperiores dolorum enim sint quod ipsam distinctio molestias consectetur ducimus beatae, reprehenderit exercitationem!</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="box">
                    <img src="/camp/resources/images/doDuck.jpg" alt="">
                    <h3>오성현</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa adipisci quisquam sunt nesciunt fugiat odit minus illum asperiores dolorum enim sint quod ipsam distinctio molestias consectetur ducimus beatae, reprehenderit exercitationem!</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                    </div>
                </div>
            </div>
            
            <div class="swiper-slide">
                <div class="box">
                    <img src="/camp/resources/images/geum.jpg" alt="">
                    <h3>임재학</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsa adipisci quisquam sunt nesciunt fugiat odit minus illum asperiores dolorum enim sint quod ipsam distinctio molestias consectetur ducimus beatae, reprehenderit exercitationem!</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                    </div>
                </div>
            </div>

        </div>

    </div>

</section>

    <!-- Weather&Traffic section starts  -->

	<section class="WaT" id="WaT">

    <h1 class="heading">
        <span>w</span>
        <span>e</span>
        <span>a</span>
        <span>t</span>
        <span>h</span>
        <span>e</span>
        <span>r</span>
        <span>&</span>
        <span>t</span>
        <span>r</span>
        <span>a</span>
        <span>f</span>
        <span>f</span>
        <span>i</span>
        <span>c</span>
       
    </h1>
    
        <div class="nav">
<ul>
	<li><a href="${pageContext.request.contextPath }/weather/weatherView.do">실시간 날씨 정보</a></li>
	<li><a href="${pageContext.request.contextPath }/weather/trafficView.do">실시간 교통 정보</a></li>
</ul>
</div>

<!-- map div -->

<div id="map" style="width:630px;height:600px;"></div>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6595e8f05a907d26649ff019d39dc1a"></script>
<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(35.69469, 127.94291), // 지도의 중심좌표
		        level: 13, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 


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
<div class="infoDiv" style="width:530px;height:600px;">
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
	</table>
</div>
    
    </section>


<!-- contact section starts  -->

<section class="contact" id="contact">
    
    <h1 class="heading">
        <span>c</span>
        <span>o</span>
        <span>n</span>
        <span>t</span>
        <span>a</span>
        <span>c</span>
        <span>t</span>
    </h1>

    <div class="row">

        <div class="image">
            <img src="/camp/resources/images/fire.jpg" alt="">
        </div>

        <form action="">
            <div class="inputBox">
                <input type="text" placeholder="name">
                <input type="email" placeholder="email">
            </div>
            <div class="inputBox">
                <input type="number" placeholder="number">
                <input type="text" placeholder="subject">
            </div>
            <textarea placeholder="message" name="" id="" cols="30" rows="10"></textarea>
            <input type="submit" class="btn" value="send message">
        </form>

    </div>
    
</section>


	</div>
	
	<c:import url="views/common/footer.jsp"/>
	
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
	<!-- custom js file link  -->
	<script src="/camp/resources/js/script.js"></script>
	
</body>
</html>