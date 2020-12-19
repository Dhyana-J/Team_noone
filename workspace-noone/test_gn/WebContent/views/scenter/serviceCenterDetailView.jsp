<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.scenter.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("n");
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

</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<div class="wrapper">

      <div class="header"></div>
      

      <div class="main">

        
        <div class="sideBar">
            <h2>고객센터</h2> <br>
            <a href="<%=contextPath %>/scenterMain.sc" style="font-size:xx-large;">공지사항</a>
            <a href="<%=contextPath %>/list.faq" style="font-size:xx-large;">FAQ</a>
            <a href="<%=contextPath %>/list.inq" style="font-size:xx-large;">1:1문의</a>
        </div>
      
        <div class='content'>
            <div class="outer">
                <br>
                <h2 align="center">공지사항 상세조회</h2>
                <br>
        
                <table id="detail-area" align="center">
                     <tr>
                        <th width="70" height="50">제목</th>
                        <td colspan="5" width="300"><%= n.getNoticeTitle() %></td>                
                    </tr>
                    <tr>
                        <th height="30" width="50">작성자</th>
                        <td width="100">관리자</td>
                        <th width="80">작성일</th>
                        <td width="140"><%=n.getNoticeDate() %></td>
                        <th width="70">조회수</th>
                        <td width="50"><%=n.getNoticeRead() %></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="5">
                            <p style="height:150px;"><%= n.getNoticeContent() %></p>
                        </td>                
                    </tr>
                </table>
        
                <br><br>
        
                <div align="center">
                    <a href="<%=contextPath %>/scenterMain.sc" class="btn btn-secondary btn-sm">목록가기</a>
                    <% if(loginUser != null && loginUser.getManager().equals("Y")){ %>
                    <!-- 현재 로그인한 사용자가 해당 글을 작성한 작성자일 경우-->
                    <a href="<%=contextPath %>/updateForm.no?nno=<%=n.getNoticeNo() %>" class="btn btn-secondary btn-sm">수정하기</a>
                    <a href="<%=contextPath %>/delete.no?nno=<%=n.getNoticeNo() %>" class="btn btn-danger btn-sm">삭제하기</a>
                    <!--------------------------------------------------- -->
                    <%} %>
                </div>
        
        
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