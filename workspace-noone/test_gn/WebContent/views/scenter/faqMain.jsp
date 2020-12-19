<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.scenter.model.vo.Faq"%>
<%
	ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="views/resources/css/footer.css">  
  <link rel="stylesheet" href="views/resources/css/layout.css">
  <link rel="stylesheet" href="views/resources/css/faq.css">
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
#faqno{
	width:40px;
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
            <a href="<%=contextPath %>/scenterMain.sc" style="font-size:xx-large;">공지사항</a>
            <a href="<%=contextPath %>/list.faq" style="font-size:xx-large;">FAQ</a>
            <a href="<%=contextPath %>/list.inq" style="font-size:xx-large;">1:1문의</a>
        </div>
        
        <div class='content'>          
            <div class="outer">
            <br>
            <h2 align="center">FAQ</h2>
            <br>
            <%if(loginUser != null && loginUser.getManager().equals("Y")){ %>
            <div align="right" style="width:1450px">
                <a href="<%=contextPath %>/enrollForm.faq" class="btn btn-secondary btn-sm">글작성</a><br>
                
                <input type="number" id="faqno" name="faqno">
                <button onclick="updateFaq();" class="btn btn-primary btn-sm">수정</button>
                <button onclick="deleteFaq();" class="btn btn-danger btn-sm">삭제</button>
                
            </div>
           <%} %>
            <br>          
            
            <table align="center" id="list_area">
                <thead>
                <tr>
                	<td width="30">번호</td>                	
                    <th width="200">질문</th>
                    <td width="200">답변</td>                    
                </tr>
                </thead>
                <tbody>
                <%for(Faq f : list){ %>
                <tr>
                	<td><%=f.getFaqNo() %></td>                	
                    <th><%=f.getFaqContent() %></th>
                    <td><%=f.getFaqAnswer() %></td>                    
                </tr>
                <%} %>
                </tbody>
            </table>
        </div>
        </div>
	<script>
	function updateFaq(){
			var nno = $("#faqno").val();
			
			console.log(nno);
			
			location.href = "<%= contextPath%>/updateForm.faq?fno=" + nno;
		}
		
	function deleteFaq(){
		var nno = $("#faqno").val();
		
		console.log(nno);
		
		location.href = "<%= contextPath%>/delete.faq?fno=" + nno;
	}
		
	
	
	</script>

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