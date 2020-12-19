<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@
	page import="java.util.ArrayList, com.kh.scenter.model.vo.Notice"

%>   
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <link rel="stylesheet" href="views/resources/css/footer.css">  
  <link rel="stylesheet" href="views/resources/css/layout.css">
  <link rel="stylesheet" href="views/resources/css/notice.css">
  <link rel="stylesheet" href="views/resources/css/navigator.css">
  
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<style>
	.list-area>tbody>tr:hover{
	background: darkgray;
	cursor:pointer;
	}
	</style>

</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="wrapper">

      <div class="header"></div>
      

      <div class="main">

        
        <div class="sideBar">
            <h2>고객센터</h2> <br>
            <a href="<%=contextPath %>/scenterMain.sc" style="font-size:xx-large;">공지사항</a> <br>
            <a href="<%=contextPath %>/list.faq" style="font-size:xx-large;">FAQ</a> <br>
            <a href="<%=contextPath %>/list.inq" style="font-size:xx-large;">1:1문의</a> <br>
            
        </div>
      
        <div class='content'>
          <div class="outer">

            <br>
            <h2 align="center">공지사항</h2>
            <br>
    
            <!-- 현재 로그인한 회원이 관리자일 경우 보여지는 div -->
            <%if(loginUser != null && loginUser.getManager().equals("Y")){ %>
            <div align="right" style="width:1320px;">
                	<a href="<%= contextPath%>/enrollForm.no" class="btn btn-secondary btn-sm">글작성</a>
                <br><br>
            </div>
    		<% } %>
            <table class="list-area" align="center">
    
                <thead>
                    <tr>
                        <th width="50">글번호</th>
                        <th width="100">작성자</th>
                        <th width="400">제목</th>
                        <th width="100">작성일</th>
                        <th width="50">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 1-1. 공지사항이 없을경우 (조회결과가 없을경우)-->
                    <%if(list.isEmpty()){ %>
                    <tr>
                        <td colspan="5">존재하는 공지사항이 없습니다.</td>
                    </tr>
                   <%}else{ %>
                    <!-- 1-2. 공지사항이 있을 경우 (뭐라도 조회됐을경우)-->
                    <% for(Notice n : list){ %>
                    <tr>
                        <td><%= n.getNoticeNo() %></td>
                        <td>관리자</td>
                        <td><%= n.getNoticeTitle() %></td>
                        <td><%= n.getNoticeDate() %></td>                        
                        <td><%= n.getNoticeRead() %></td>
                    </tr>
                   <%} %>
                    <%} %>
                </tbody>
    
            </table>
            <script>
            	$(function(){
            		$(".list-area>tbody>tr").click(function(){
            			
            			var nno = $(this).children().eq(0).text();
            			
            			console.log(nno);
            			
            			location.href = "<%= contextPath%>/detail.no?nno=" + nno;
            			
            			
            		});
            	})
            </script>
            
            
            
            <br><br><br>
        </div>
          
    
    
        </div>


      </div>

      <div class="footer">
        <div class="footer">
            <div id="logo">PC</div>
            <div id="copyright">
                회사명 : (주)펫커뮤니티 | 대표 : 허현민 | 주소 : 서울특별시 강남구 테헤란로 14길 6<br>
                사업자등록번호 : 123-45-67890 | 통신판매업 신고번호 : 2020-강남역삼Z-9999 | 개인정보책임자 : 이건<br>
                Copyright2020.PetC.All rights reserved
            </div>
          </div>
      </div>

    </div>
	
	
	
</body>
</html>