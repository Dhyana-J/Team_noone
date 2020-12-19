<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.community.model.vo.*" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		 .outer{
            width: 700px;
            height: 500px;
            margin: auto;
            margin-top: 30px;
        }
        .table tbody>tr:hover{
            background: rgb(255, 235, 205);
            cursor: pointer;
        }
        .paging-area a{
            text-decoration: none;
            color: black;
            margin: 5px;
        }
        .search_bar select{
            float: left;
            margin-left: 90px;
            margin-right: 330px;;
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

	<!-- 여기서부터  -->
	 <div class="outer">

        <h3 align="center">자유이야기</h3>

        <p>자유롭게 이야기 해봐요</p>

        <div>

            <form class="example" action="" align="right">
                <button type="submit">검색</button>
                <input type="text" placeholder="검색내용을입력하세요" name="search">
            </form>
        </div>

            <table class="table" style="text-align: center; border: 1px solid #dddddd;">
                <br>
                <thead>
                    <tr style="background-color: #eeeeee; text-align: center;">

                        <th style="background-color: #eeeeee; text-align: center;">번호</th>
                        <th style="background-color: #eeeeee; text-align: center;" width="300">제목</th>
                        <th style="background-color: #eeeeee; text-align: center;">글쓴이</th>
                        <th style="background-color: #eeeeee; text-align: center;" width="150">작성일</th>
                        <th style="background-color: #eeeeee; text-align: center;">조회수</th>
                    </tr>
                </thead> 
                <tbody>
               		 <% if(list.isEmpty()) { %>
		                <!-- 조회된 리스트가 없을 경우 -->
		              
		                <tr>
		                    <th colspan="6">조회된 게시글이 없습니다.</th>
		                </tr>
	                 <% }else { %>
	                 	<% for(Board b : list) { %>
		                    <tr>
		                        <td><%= b.getBoardNo() %></td>
		                        <td><%= b.getBoardTitle() %></td>
		                        <td><%= b.getUserNo() %></td>
		                        <td><%= b.getBoardDate() %></td>
		                        <td><%= b.getBoardCount() %></td> 
		                    </tr>
		                   <% } %>
	                  <% } %>
                </tbody>
                
            </table>
		
			<script>
			$(function(){
				$(".table>tbody>tr").click(function(){
					location.href = "<%= context %>/boardDetail.bo?bno=" + $(this).children().eq(0).text();
				});
			});
			
			
			</script>

            <!-- 현재 로그인 되어있을 경우만 보여짐 -->
            <% if(loginUser != null && loginUser.getManager().equals("Y")){ %>
            <div id="insert" align="right" >
                <a href="<%= context %>/boardEnroll.bo" class="btn btn-secondary btn-sm">글작성</a>
                <br><br>
            </div>
            <% } %>
      

        <div class="paging-area" align="center">

           <% if(pi.getCurrentPage() !=1){ %>
            <a href="<%= context%>/communityList.bo?currentPage=<%=pi.getCurrentPage()-1%>">&lt; 이전</a>
			<% } %>
			
			<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
			
            	<a href="<%= context%>/communityList.bo?currentPage=<%= p %>"><%= p %></a>
            	
        	<% } %>
        	
        	<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
            	<a href="<%= context %>/communityList.bo?currentPage=<%= pi.getCurrentPage()+1%>">다음 &gt;</a>
			<% } %>

        </div>
	<br><br><br>
    </div> 
    
    
    
    <%@ include file="../common/mainLower.jsp" %>

</body>
</html>