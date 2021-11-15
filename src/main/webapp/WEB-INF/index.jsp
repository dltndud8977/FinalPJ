<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camp Go!Camp Go!</title>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/camp/resources/css/style.css" />
</head>
<body>

	<%@ include file="views/common/header.jsp" %>
	
	<div class="content">
		<!--  <img src="/camp/resources/images/tent3.jpg" alt="#" /> -->
	
	<div class="quick-reserve">
	
    	<div class="reserve-left">
        	<select id="rs-menu">
	             <option value="20211115|20211116|1">오늘 1박</option>
	             <option value="20211115|20211120|2">오늘 2박</option>
	             <option value="20211116|20211117|1">내일 1박</option>
	             <option value="20211116|20211117|2">내일 2박</option>
	             <option value="20211119|20211120|1">이번주 금요일 1박</option>
	             <option value="20211119|20211121|2">이번주 금요일 2박</option>
	             <option value="20211120|20211121|1"selected>이번주 토요일 1박</option>
	             <option value="20211126|20211127|1">다음주 금요일 1박</option>
	             <option value="20211126|20211128|2">다음주 금요일 2박</option>
	             <option value="20211127|20211128|1">다음주 토요일 1박</option>
            </select>
          </div>
					
         
          <div class="region">
			<div id="this-region" onClick="clkThisResion();">지역검색</div>
            <span class="sprite arw_bt"></span>
          </div>
          
          <div id="this_ser_region" style="display:none;"></div>
          
  
          
          <div class="quick-room">
          	<span >
          		<img id="searchimg" src="/camp/resources/images/search.png" alt="#" />
          	</span>
          	<a href="#">빠른 빈자리 찾기</a>
          </div>
          
      </div>
      
     </div>
   

	<%@ include file="views/common/footer.jsp" %>

</body>
</html>