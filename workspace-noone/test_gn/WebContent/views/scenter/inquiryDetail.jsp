<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.scenter.model.vo.Inquiry"%>
<%
	Inquiry i = (Inquiry)request.getAttribute("i");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="views/resources/css/footer.css">  
  <link rel="stylesheet" href="views/resources/css/layout.css">  
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
        #outer_cnm{
            width:1100px;
            height:550px;   
            font-size:x-large;                                 
        }
          .detail-area{
            width:700px;
            height:200px;
        }
        
        .detail-area tr{
            border-bottom:1px solid black;
            border-top:1px solid black;
            
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
      
        <div class='content' align="center">
            <br>
            <h2 style="width: 1100px;;">1:1 상담 조회</h2>
            <br>
            <div id="outer_cnm">  
                    <table class="detail-area" align="center">
                        <tr>
                            <th width="70">카테고리</th>
                            <td width="100"><%=i.getInquiryType() %></td>
                            <th width="50">제목</th>
                            <td width="300"><%=i.getInquiryTitle() %></td>            
                        </tr>
                        <tr>
                            <th height="30">작성자</th>
                            <td><%=i.getUserName() %></td>
                            <th>작성일</th>
                            <td><%=i.getInquiryDate() %></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
                                <p style="height:150px;"><%=i.getInquiryContent() %></p>
                            </td>                
                        </tr>
                        
                    </table>
                    <br>
                    <h4>답변</h4>
                    <table class="detail-area" align="center">
                        <%if(i.getStatus().equals("Y")){ %>
                        <tr>
                            <th width="70" height="30">작성자</th>
                            <td width="70">관리자</td>
                            <th width="70">답변날짜</th>
                            <td width="100"><%=i.getReDate() %></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="4"><%=i.getReContent() %></td>
                        </tr>
						<%}else{ %>
							<tr>
								<th>아직 답변이 없습니다. 조금만 기다려주세요.</th>
							</tr>
						<%} %>
                    </table>


                    <br>
                    <div align="center">
                        <a href="<%=contextPath %>/list.inq" class="btn btn-secondary btn-sm">목록가기</a>
                        <%if(loginUser.getManager().equals("N")){ %>
                        <a href="<%=contextPath %>/updateForm.inq?ino=<%=i.getInquiryNo() %>" class="btn btn-secondary btn-sm">수정하기</a>
                        <a href="<%=contextPath %>/delete.inq?ino=<%=i.getInquiryNo() %>" class="btn btn-danger btn-sm">삭제하기</a>
                        <%}else{ %>
                         	<%if(i.getReContent() != null){ %>                        
                       		<a href="<%=contextPath %>/reUpdateForm.inq?ino=<%=i.getInquiryNo() %>" class="btn btn-secondary btn-sm">답변수정하기</a>
                        	<a href="<%=contextPath %>/reDelete.inq?ino=<%=i.getInquiryNo() %>" class="btn btn-danger btn-sm">답변삭제하기</a> 
                        	<%}else{ %>
                        	<a href="<%=contextPath %>/reInsertForm.inq?ino=<%=i.getInquiryNo() %>" class="btn btn-secondary btn-sm">답변하기</a>
                        	<%} %>
                        <%} %>
                    </div>
            
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