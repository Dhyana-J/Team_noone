<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.scenter.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("n");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="resources/css/footer.css">
  <link rel="stylesheet" href="resources/css/layout.css">
  
  
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
	.outer{
    color:black;
    width:800px;
    height:550px;
    margin:auto;
    margin-top: 50px;

}


.list-area>tbody>tr{
    border-bottom:1px solid black;
    border-top:1px solid black;
}


#enrollForm table{border:1px solid white;}
#enrollForm input, #enrollForm textarea{
    width:700px;
    text-align: left;
    box-sizing: border-box;
}

#detail-area{
    width : 500px;
    height: 400px;
    border-bottom:1px solid black;
    border-top:1px solid black;
}
.navigator{
	text-align:center !important;
}

	</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<div class="wrapper">

      
      

      <div class="main">

        
        <div class="sideBar">
            <h2>공지사항</h2> <br>
            <div id="menuContent">
             <div class=subMenu>
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
            <h2 align="center">공지사항 수정하기</h2>
            <br>
    
            <form action="<%=contextPath %>/update.no" id="enrollForm" method="POST" >
            	<input type="hidden" name="nno" value="<%=n.getNoticeNo() %>">
                <table align="center">
                    <tr>
                        <th width="50">제목</th>
                        <td width="300"><input type="text" name="title" required value ="<%= n.getNoticeTitle()%>"></td>
    
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea name="content" rows="13" required style="resize:none"><%=n.getNoticeContent() %></textarea></td>
                    </tr>
                </table>
                <br><br>
    
                <div align="center">
                    <button type="submit">변경하기</button>
                    <button type="button" onclick="history.back();">뒤로가기</button>
                </div>
    
            </form>

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