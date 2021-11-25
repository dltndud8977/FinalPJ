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