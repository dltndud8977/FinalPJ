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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <style>
        body{
          
        }
        header{ 
            font-size: 30px;
            border: 1px solid green;
            text-align: center;
            background: lightpink;
            
        }
        main{
            display:inline-table;
            position:absolute;
            top : 20%;
            left : 10%;
            align : center;
            
        } 
   
    
         .text{
       	    position: absolute;
            width: 800px;
            height: 700px;
            top:300%;
                     
            font-size: 15pt;
            text-align: left;
            background: rgba(245, 243, 243, 0.979);
            color: black;
           
        }
        

             
        #count{
        		position : absolute;
				height: 100px;
				width : 400px;
				left : 25%;
				
			}
        table {
        	text-align : center;
        }
      .page-item{
      	width : 70px;
      	border : none;
      }
      .page-link {
      	width:50px;
      	
      }
      
      .nav-tabs{
      	position: block;
      }
			
    </style>
<title>관리자 페이지</title>
</head>
<body>

<c:import url="../common/header.jsp"/>

 <main>
 
    <ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/admin/reserManage.do">예약관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath }/admin/memberManage.do">일반회원관리</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath }/admin/bsMemberManage.do">사업자회원관리</a>
  </li>
 
</ul>
   
    <div class="text">
    	<canvas id="myChart"></canvas>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
		
	 </div>
	
	 
	 <script>
	   var arrayNames = []; // 날짜
       var arrayVisit = []; // 방문수
       var arrayReserve = []; //예약수  
       
      <c:forEach items="${list}" var="m">
			arrayNames.push("${m.visitDate}");
			arrayVisit.push("${m.visitCount}");
			arrayReserve.push("${m.reserCount}");
       </c:forEach>
       
       var visitBack = [];
       var visitBorder = [];
       var reserveBack = [];
       var reserveBorder = [];
       
       for(var i=0; i<arrayNames.length; i++){
       visitBack.push("rgba(255, 99, 132, 0.2)");
       visitBorder.push("rgb(255, 99, 132)");
       reserveBack.push("rgba(255, 205, 86, 0.2)");
       reserveBorder.push("rgb(255, 205, 86)");
       }
           var ctx = document.getElementById('myChart').getContext('2d');
           var myBarChart = new Chart(ctx, {
               type : 'bar',
               data : {
                   labels : arrayNames,
                   datasets:[{
                       label: "방문자수",
                       data : arrayVisit,
                       backgroundColor:visitBack,
                       borderColor:visitBorder,
                       borderWidth:1
                   },{
                       label: "예약수",
                       data : arrayReserve,
                       backgroundColor:reserveBack,
                       borderColor:reserveBorder,
                       borderWidth:1
                   }]},
               options:{
                   scales: { 
                       yAxes :[{ ticks:{ beginAtZero : true } }]
                   }
               }
           });
      
		
    </script>

		
   
    </main>
    
    <script>
    	$(function() {
    		$("#reservation").on("click",function(){
    			location.href = "${pageContext.request.contextPath}/admin/reserManage.do";
    		});
    		
    	});
    	$(function() {
    		$("#member").on("click",function(){
    			location.href = "${pageContext.request.contextPath}/admin/memberManage.do";
    		});
    	});
    	$(function() {
    		$("#bsMember").on("click",function(){
    			location.href = "${pageContext.request.contextPath}/admin/bsMemberManage.do";
    		});
    	});
    </script>
</body>
</html>