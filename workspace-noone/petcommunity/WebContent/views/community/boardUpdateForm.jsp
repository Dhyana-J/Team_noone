<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.community.model.vo.Board"%>
<%
	Board b = (Board)request.getAttribute("b");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .outer{
            width: 700px;
            height: 700px;
            margin: auto;
            margin-top: 50px;
        }
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
            <h2>커뮤니티 community</h2><br>
            <li><a href="<%= context%>/thumbnailList.bo?currentPage=1">댕냥한컷</a></li>
            <li><a href="<%= context %>/communityList.bo?currentPage=1">자유이야기</a></li>
        
        </div>
	
	    <div align="center" class="outer">
        <h3 align="center">자유이야기 수정하기</h3>
        <br>
        <form action="<%= context %>/boardUpdate.bo" id="updateForm" method="POST">
        	<input type="hidden" name="bno" value="<%= b.getBoardNo()%>">
            <table align="center" border="1px">
                <tr>
                    <td>글쓴이 : </td>
                    <td></td>
                </tr>
                <tr>
                    <td>제목 : </td>
                    <td><input type="text" name="title" required value="<%= b.getBoardTitle()%>"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea cols="70" rows="10" name="content" placeholder="내용을 입력하세요" required style="resize:none"><%= b.getBoardContent() %></textarea>
                    </td>
                </tr>  
            </table>
            
        <br>
        
        <div align="center">
            <button type="submit" class="btn btn-secondary btn-sm">수정하기</button>
            <button type="button" onclick="history.back();" class="btn btn-secondary btn-sm">뒤로가기</button>
        </div>
        </form> 
    </div>
	
	<%@ include file="../common/mainLower.jsp" %>
	
</body>
</html>