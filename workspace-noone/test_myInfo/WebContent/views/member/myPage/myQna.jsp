<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//QnA ArrayList 필요
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
  align-self: flex-start;
  margin-left: 300px;
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
  font-size: 25px;
  font-weight: bold;
}

.articleInfo tr:nth-child(2) > td {
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
.sideBar .subMenuList li:nth-child(2) *{color:blue;}

</style>
</head>
<body>
    <div class="wrapper">

      <%@include file="/views/common/menubar.jsp" %>

      <div class="main">

        
		        <%@include file="/views/member/myPage/sideBar.jsp" %>
      
		        <div class='content'>
		
		                    <!--작성한 Qna 없는 경우-->
				          <!-- <div class='myArticlesWrap'>
				            <h1>게시글관리</h1>
				            <h2>내 문의글</h2>
				            <div class="emptyList">
				              <div id="emptySign">❔</div>
				              <div id="emptyMessage">작성한 게시글이 없습니다.</div>
				            </div>
				          </div> -->
				
				    
				          <!--작성한 Qna 있는 경우-->
				          <div class="myArticlesWrap">
				            <h1>게시글관리</h1>
				            <h2>내 문의글</h2>
				
				            <form action="" method="post">
				              <select name="sortOption" id="sortSelect">
				                <option value="all">전체</option>
				                <option value="1month">1개월</option>
				                <option value="3month">3개월</option>
				              </select>
				            </form>
				
				            <div class="articleList">
				
				              <div class="article">
				                <div class="articleInfo">
				                  <table>
				                    <tr>
				                      <td>만물은 얼음이</td>
				                    </tr>
				                    <tr>
				                      <td>만물을 비추는 빛은 모든 존재의 근원임을</td>
				                    </tr>
				                  </table>
				                </div>
				              </div>
				              <div class="article">
				                <div class="articleInfo">
				                  <table>
				                    <tr>
				                      <td>만물은 얼음이</td>
				                    </tr>
				                    <tr>
				                      <td>만물을 비추는 빛은 모든 존재의 근원임을</td>
				                    </tr>
				                  </table>
				                </div>
				              </div>
				              <div class="article">
				                <div class="articleInfo">
				                  <table>
				                    <tr>
				                      <td>만물은 얼음이</td>
				                    </tr>
				                    <tr>
				                      <td>만물을 비추는 빛은 모든 존재의 근원임을</td>
				                    </tr>
				                  </table>
				                </div>
				              </div>
				              
				
				            </div>
				
				            <div class="pageSearch">
				              <div class="pageNum">
				                <ul class="pagination">
				                  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
				                  <li class="page-item"><a class="page-link" href="#">1</a></li>
				                  <li class="page-item active"><a class="page-link" href="#">2</a></li>
				                  <li class="page-item"><a class="page-link" href="#">3</a></li>
				                  <li class="page-item"><a class="page-link" href="#">Next</a></li>
				                </ul>
				              </div>
				
				              <form class="form-inline" action="" method="post">
				                <input class="form-control mr-sm-2" type="text" placeholder="Search">
				                <button class="btn btn-success" type="submit">Search</button>
				              </form>
				
				            </div>
				
				
				            
				          </div><!--.myArticlesWrap-->
		    
		    
		        </div><!-- content -->


      </div><!-- main -->

      <div class="footer">
		<%@include file="/views/common/footer.jsp" %>
      </div>

    </div><!-- wrapper -->
</body>
</html>