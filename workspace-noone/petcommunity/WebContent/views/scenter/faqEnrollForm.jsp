<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="resources/css/footer.css">  
  <link rel="stylesheet" href="resources/css/layout.css">
  <link rel="stylesheet" href="resources/css/faq.css">
  
  
      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
	.navigator{
	text-align:center !important;
}
.sideBar {
  width: 20%;
  text-decoration:none;
}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	 <div class="wrapper">

      
      

      <div class="main">

        
        <div class="sideBar">
            <h2>FAQ</h2> <br>
           <div id="menuContent">
            <a href="<%=contextPath %>/scenterMain.sc" style="font-size:xx-large;">공지사항</a>
            </div>
           <div class=subMenu>
            <a href="<%=contextPath %>/list.faq" style="font-size:xx-large;">FAQ</a>
            </div>
            <div class=subMenu>
            <a href="<%=contextPath %>/list.inq" style="font-size:xx-large;">1:1문의</a>
            </div>
            </div>
        </div>
        
        <div class='content'>          
            <div class="outer">
            <br>
            <h2 align="center">FAQ 작성하기</h2>
            <br>
            <form action="<%=contextPath %>/insert.faq" method="post">
            <table align="center" id="list_area_w">
                <thead>
                <tr>
                    <th width="200">질문</th>
                    <td width="200">답변</td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th><textarea name="content" cols="50" rows="5" style="resize: none;"></textarea></th>
                    <td><textarea name="answer" cols="50" rows="5" style="resize: none;"></textarea></td><br>
                
                </tr>                
                </tbody>
            </table>
             		<div align="right" style="width:1050px;">
                    <input type="submit" class="btn btn-secondary" value="등록하기">
                    <button type="button" onclick="history.back();">뒤로가기</button>
                    </div>
             </form>
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