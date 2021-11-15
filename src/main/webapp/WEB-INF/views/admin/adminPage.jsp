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

 <style>
        body{
          
        }
        header{ 
            font-size: 30px;
            border: 1px solid green;
            text-align: center;
            background: lightpink;
            
        }
        nav{
            display:inline-table;
            position:absolute;
            top : 20%;
            left : 10%;
            align : center;
            
        } 
        nav ul li{
            list-style: none;
            margin-bottom : 300px;
            border: 1px solid black;
            width: 300px;
            height: fit-content;
            font-size: 18pt;
            font-weight: bold;
            text-align: center;
         
            cursor:pointer; 
            
            
        }
      

        li:hover {
            background: red;
            color: white;
        }
        .text{
       	    position: absolute;
            width: 800px;
            height: 700px;
            top:5%;
            left: 130%;
            border: 1px solid red; 
            
            font-size: 15pt;
            text-align: left;
            background: rgba(245, 243, 243, 0.979);
            color: black;
           
        }

        li:hover .text{
            visibility: visible;
        }
        @media (max-width:1500px) {
            nav{
                left:0px;
                transition : left 0.5s ease-out;
            }
            header{ 
            font-size: 20px;
            border: 1px solid green;
            text-align: center;
            background: lightpink;
            transition : font-size 0.5s ease-out;
            }
        }
               
        @media (max-width:874px) {
            h1{
                font-size: 25px;
                transition : font-size 0.5s ease-out;
            }
            .text{
                width: 400px;
                height: 15em;
                font-size: 17px;
                left: 50px;
                top:300px;
                padding:5px;
            }
            .pic{
                width: 20rem;
                height:10rem;
                left:100px;
            }
        }

    </style>
<title>관리자 페이지</title>
</head>
<body>

<c:import url="../common/header.jsp"/>

 <nav>
    <ul>
      
        <li id="reservation">
            예약관리
            
            <div class="text">
                예약 관리
            </div>
        </li>
        <li id="member">
            회원관리
          
            </li>
            
        <li id="bsMember">
            사업자 관리
         
           
        </li>
       
    </ul>
    </nav>
    
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