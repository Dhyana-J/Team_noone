<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.community.model.vo.*" %>
<%
   ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
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
   <div class="outer">

        <br>
        <h2 align="center">댕냥한컷</h2>
        <br>

        <h5 style="margin-left: 50px;">
             사랑스런 댕냥이들의 소식 이모저모!
        </h5>

      <% if(loginUser != null ) { %>
        <!-- 현재 로그인 되어있을 경우만 보여짐 -->
        <div id="insert" align="right" style="width:800px";>
            <a href="<%= context %>/thumbnailEnrollForm.bo" class="btn btn-secondary btn-sm">글작성</a>
            <br><br>
        </div>
      <% } %>
        <div class="list-area">

         <% for( Board b : list ){ %>
               <div class="thumbnail" align="center">
                   <!-- 내가 뽑기 편한 위치에 게시글 번호를 숨겨놓기  -->   
                  <input type="hidden" value="<%= b.getBoardNo() %>">
                   <img src="<%= context %>/<%= b.getBoardPhoto() %>" width="200" height="150">
                   <p>
                       No.<%= b.getBoardNo()%> <%= b.getBoardTitle() %> <br>
                       <%= b.getUserNo() %> <%= b.getBoardDate() %>
                   </p>
               </div>    
           <% } %>
        </div>

      <script>
         $(function(){
            $(".thumbnail").click(function(){
               //console.log("클릭됨");
               //console.log($(this).children().eq(0).val()); >>>input타입의 값을 얻고싶을때는 val()을 사용 ! 
               location.href="<%= context %>/thumbnailDetail.bo?bno=" + $(this).children().eq(0).val();
            
            });
         });
      
      </script>

   
        <div class="paging-area" align="center">
            <% if(pi.getCurrentPage() !=1){ %>
            <a href="<%= context%>/thumbnailList.bo?currentPage=<%=pi.getCurrentPage()-1%>">&lt; 이전</a>
         <% } %>
         
         <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
         
               <a href="<%= context%>/thumbnailList.bo?currentPage=<%= p %>"><%= p %></a>
               
           <% } %>
           
           <% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
               <a href="<%= context %>/thumbnailList.bo?currentPage=<%= pi.getCurrentPage()+1%>">다음 &gt;</a>
         <% } %>
        </div>
        <hr width="90%">
        <div id="searchForm">
            <form class="example" action="">
                <select name="opt" >
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요" name="search">
                <button type="submit" class="btn btn-secondary btn-sm">검색</button>
            </form>
        </div>  
    </div>
   
   
   
   
   
   
   
   
   
   
<%@ include file="../common/mainLower.jsp" %>
</body>
</html>