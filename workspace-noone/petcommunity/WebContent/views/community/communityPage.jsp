<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

        .outer{
            width: 800px;
            height: 800px;
            margin: auto;
            margin-top: 50px;  
        }
        .list-area{
            width: 760px;
            margin: auto;
        }
        .thumbnail{
            border: 1px solid white;
            width: 220px;
            display: inline-block;
            margin: 14px;
        }
        .thumbnail:hover{
            cursor: pointer;
            opacity: 0.7;
        }
        .paging-area a{
            text-decoration: none;
            color: black;
            margin: 5px;
        }
        .example{
            margin-left: 550px;
            
        }
        #insert a{
            margin-right: 65px;
        }
       
  
        

</style>
</head>
<body>

	<%@ include file="../common/mainTop.jsp" %>


	<body>
        <div class="left_menu" align="left">
            <h2>커뮤니티 community</h2><br>
            <li><a href="<%= context%>/thumbnailList.bo?currentPage=1">댕냥한컷</a></li>
            <li><a href="<%= context %>/communityList.bo?currentPage=1">자유이야기</a></li>
        
        </div>

		












	<%@ include file="../common/mainLower.jsp" %>
</body>
</html>