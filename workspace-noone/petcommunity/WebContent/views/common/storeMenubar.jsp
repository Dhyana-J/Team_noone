<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Document</title>
	   <style>
	    	
	        .left_menu>li{
	            list-style: none;
	            height: 30px;
	            font-weight: bold;
	            margin-left: 20px;
	            font-size: 15px;
	        }
	        .left_menu{
	            background: rgb(255, 235, 205);
	            width: 150px;
	            height: 1000px;
	            float:left;
	        }
	         .left_menu>li:hover{
	            text-decoration: none;
	            color: black;
	            cursor: pointer;
	        }
	        .left_menu>li a{
	            text-decoration: none;
	            color: black;
	        }
	        .left_menu ul{
	            margin: 0px;
	            margin-bottom: 8px;
	            color:gray;
	            display: none;
	        }
	        .left_menu ul a{
	            text-decoration: none;
	            color:gray;
	        }
	    </style>
</head>
<body>
	<%@ include file="../common/mainTop.jsp" %>
    <div class="left_menu" align="left">
            <h2>스토어 shopping</h2><br>
            <li id="dog"><input type="hidden" value="D">댕댕이</li>
            <li id="cat"><input type="hidden" value="C">냥냥이</li>
            
            <!-- 관리자만의 버튼 -->
            <%if(loginUser != null && loginUser.getManager().equals("Y")) {%>
	            <li id="stock"><a href="<%=context%>/stock.st?Page=1&Psort=1">재고관리</a></li>
	            <li id="review"><a href="<%=context%>/review.bo?Page=1&Psort=1">리뷰관리</a></li>
	
	            <li id="trans"><a href="<%=context %>/transfer.bo">배송관리</a></li>
	       
	            <li id="6"><a href="<%=context %>/buy.bo">구매관리</a></li>
	            <li id="7"><a href="<%=context %>/request.bo">문의관리</a></li>
	          <%} %>
	    
        </div>
        
        <script>
            $(document).ready(function(){
            	 $("#dog").click(function(){
            		 location.href="<%=context%>/storeCategory.st?Page=1&category="+($(this).children().eq(0).val());
                 });
            	 
            	 $("#cat").click(function(){
                     location.href="<%=context%>/storeCategory.st?Page=1&category="+($(this).children().eq(0).val());
                 });
            	 
              
               
            });
        </script>
    
    
</body>
</html>