<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.MyReview, com.kh.member.model.vo.PageInfo,java.util.ArrayList"%>
<%
	ArrayList<MyReview> list = (ArrayList<MyReview>)request.getAttribute("reviewList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String myReviewSort = (String)request.getAttribute("sortOption"); //정렬기능에 쓰일 변수
	System.out.println(myReviewSort);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrapper {
  height: 200vh !important;
}
.myArticlesWrap {
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

.myArticlesWrap > h1 {
  font-size: 60px;
  margin-top: 100px;
}

.myArticlesWrap > h2 {
  margin-top: 70px;
  margin-bottom: 30px;
  font-size: 40px;
}

.emptyList {
  border: 1px solid black;
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 70%;
  height: 300px;
  align-self: center;
}

#emptySign {
  font-size: 100px;
  text-align: center;
}

#emptyMessage {
  font-size: 30px;
}

#emptySign,
#emptyMessage {
  align-self: center;
}

form {
  display: flex;
  flex-direction: column;
}

#sortSelect {
  align-self: flex-end;
  margin-right: 205px;
  width: 70px;
  height: 30px;
  font-size: 20px;
  margin-bottom: 20px;
}

.articleList {
  /* border: 2px solid gray; */
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  align-self: center;
  width: 70%;
  height: 500px;
}

.article {
  align-self: center;
  width: 95%;
  height: 30%;
  display: flex;
}

.thumbnail {
  width: 20%;
  border: 1px solid gray;
}

.articleInfo:hover{
	cursor:pointer;
	background-color:rgb(255, 235, 205);
}

.articleInfo {
  width: 80%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin-left: 30px;
}

.articleInfo > table td {
  text-align: left;
}

.articleInfo tr:first-child > td {
  font-size: 20px;
}

.articleInfo tr:nth-child(2) > td {
  font-size: 25px;
  font-weight: bold;
}

.articleInfo tr:nth-child(3) > td {
  font-size: 20px;
}

.pageSearch {
  display: flex;
  justify-content: flex-end;
  margin-right: 250px;
  margin-top: 30px;
  width: 100%;
}
.pageNum {
  margin-top: 30px;
  display: flex;
  justify-content: center;
  width: 300px;
  height: 50px;
  align-self: center;
}

.pageSearch form {
  height: 100px;
  width: 500px;
  margin-top: 25px;
}

#myBoard{display:block !important;}

/*현재 보고있는 메뉴 색상 표시!*/
.sideBar .subMenu:nth-child(3) *{color:tomato;}
.sideBar .subMenuList li:nth-child(3) *{color:blue;}

</style>
</head>
<body>
    <div class="wrapper">

      <%@include file="/views/common/menubar.jsp" %>

      <div class="main">

        
		        <%@include file="/views/member/myPage/sideBar.jsp" %>
      
		        <div class='content'>
		
		                    <!--작성한 리뷰 없는 경우-->
                      <%if(list.size()==0){ %>
				          <div class='myArticlesWrap'>
				            <h1>게시글관리</h1>
				            <h2>내 리뷰</h2>
				            <div class="emptyList">
				              <div id="emptySign">❔</div>
				              <div id="emptyMessage">작성한 리뷰가 없습니다.</div>
				            </div>
				          </div>
				          
			          <%}else{ %>
				
				          <!--작성한 게시글 있는 경우-->
				          <div class="myArticlesWrap">
				            <h1>게시글관리</h1>
				            <h2>내 리뷰</h2>
				
		                  <select name="sortOption" id="sortSelect" onchange="setMyReviewSort();">
			              	<%if(myReviewSort.equals("newest")){ %>
				                <option value="newest" selected>최신순</option>
				                <option value="oldest">과거순</option>
			                <%}else{ %>
				                <option value="newest">최신순</option>
				                <option value="oldest" selected>과거순</option>
			                <%} %>
			              </select>
				
				            <div class="articleList">
				
							<%for(MyReview r : list){ %>
				              <div class="article">
				                <div class="articleInfo" onclick="location.href='<%=contextPath%>/reviewDetail.st?rno=<%=r.getReviewNo()%>&pno=<%=r.getProductNo()%>'">
				                  <table>
				                    <tr>
				                      <td><%=r.getReviewDate() %></td>
				                    </tr>
				                    <tr>
				                      <td><%=r.getReviewTitle() %></td>
				                    </tr>
				                    <tr>
				                      <td>
				                      	<%for(int i = 0; i<r.getReviewRating(); i++){ %>
				                      				⭐
				                      	<%} %>
				                      </td>
				                    </tr>
				                  </table>
				                </div>
				              </div>
							<%} %><!-- list에 대한 for문 끝 -->
				            </div><!-- articleList -->
				

			              			 <div class="pageNum">
						                <ul class="pagination">
						                	<!-- javascript myOrderSubmit 함수는 sideBar.jsp 내부에 기술되어있음-->
							                <% if(pi.getCurrentPage() != 1){ %>
						            		  <li class="page-item"><a class="page-link" href="javascript:" onclick="myReviewSubmit(<%=loginUser.getUserNo()%>,<%=pi.getCurrentPage()-1%>,'<%=myReviewSort%>','.pageNum');">Previous</a></li>
											<% } %>
											<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
						            		  <li class="page-item" id="pNum"><a class="page-link" href="javascript:" onclick="myReviewSubmit(<%=loginUser.getUserNo()%>,<%=p%>,'<%=myReviewSort%>','.pageNum');"><%=p%></a></li>
								            <% } %>
											<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
						            		  <li class="page-item"><a class="page-link" href="javascript:" onclick="myReviewSubmit(<%=loginUser.getUserNo()%>,<%=pi.getCurrentPage()+1%>,'<%=myReviewSort%>','.pageNum');">Next</a></li>
											<% } %>
						                </ul>
						              </div><!-- pageNum -->
				
				
			            <%} %><!-- 내리뷰있을경우(else)의 끝. -->
			          </div><!--.myArticlesWrap-->
		    
		    
		        </div><!-- content -->


      </div><!-- main -->

      <div class="footer">
		<%@include file="/views/common/footer.jsp" %>
      </div>

    </div><!-- wrapper -->
<script>

	//현재 보고있는 페이지 숫자 칠해주는 자바스크립트
	let item = document.querySelectorAll("#pNum"); //숫자를 가진 페이징바의 모든 요소 가져온다.
	
	item.forEach(function(element){ //각각의 요소들에 대해
		if(element.innerText==<%=pi.getCurrentPage()%>){//현재페이지와 같은 숫자를 가지고있으면
			element.setAttribute('class','page-item active'); //모달 class인 active를 추가해주자.
		}
	})
	
	function setMyReviewSort(){
		$(function(){
			let sortOption = $('.myArticlesWrap #sortSelect').val();
				console.log(sortOption);
			if(sortOption=='newest'){
				myReviewSubmit(<%=loginUser.getUserNo()%>,1,'newest','#menuContent .myReviewMenu');
			}else{
				console.log(sortOption);
				myReviewSubmit(<%=loginUser.getUserNo()%>,1,'oldest','#menuContent .myReviewMenu');
			}
		});
	}
	
</script>
</body>
</html>