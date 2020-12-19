<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.ArrayList, com.kh.scenter.model.vo.Inquiry"%>
<%
	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");
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
        .list-area>tbody tr{
            border-bottom:1px solid black;
            border-top:1px solid black;
        }
        
        .list-area tbody>tr:hover{
            background: darkgray;
            cursor:pointer;

        }
        
        #insertbtn{
        	width:1850px;
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
            <h2 style="width: 1100px;;">1:1 상담</h2>
            <br>
            <div id="outer_cnm">     
				<%if(loginUser != null && loginUser.getManager().equals("N")){ %>
				<div id="insertbtn">
				<a href="<%=contextPath %>/insertForm.inq?" class="btn btn-secondary">문의작성</a>
				</div>
				<br>
                <%} %>
                <table class="list-area" align="center">
                    
                    <thead>
                        <tr>
                        	<th width="50">번호</th>
                            <th width="100">작성날짜</th>
                            <th width="100">분류</th>
                            <th width="400">제목</th>                            
                            <th width="100">작성자</th>
                            <th width="100">답변상태</th>
                            
                           
                        </tr>
                    </thead>
                    <tbody>
                    <%if(loginUser != null){ %>
                       <%if(loginUser != null && loginUser.getManager().equals("Y")){ %>
                     	<% if(list.isEmpty()){ %>
                        <tr>
                            <td colspan="5">존재하는 상담내용이 없습니다.</td>
                        </tr>
                       <%}else{ %>
                       
	                       <%for(Inquiry i : list){ %>
	                        <tr>
	                        	<td><%=i.getInquiryNo() %></td>	                        	
	                            <td><%=i.getInquiryDate() %></td>
	                            <td><%=i.getInquiryType() %></td>
	                            <td><%=i.getInquiryTitle() %></td>
	                            <td><%=i.getUserName() %></td>
	                            <%if(i.getStatus().equals("Y")){ %>
	                            <td style="color:blue">답변완료</td>
	                            <%}else{ %>
	                            <td style="color:red">처리중</td>
	                            <%} %>
	                        </tr>
	                         <%} %>
                        <%} %>
                      <%}else{ %>
                        <%for(Inquiry i: list){ %>
                      	<%if(loginUser.getUserName().equals(i.getUserName())) {%>
                      		 <tr>
                      		 	<td><%=i.getInquiryNo() %></td>
	                            <td><%=i.getInquiryDate() %></td>
	                            <td><%=i.getInquiryType() %></td>
	                            <td><%=i.getInquiryTitle() %></td>
	                            <td><%=i.getUserName() %></td>
	                            <%if(i.getStatus().equals("Y")){ %>
	                            <td style="color:blue">답변완료</td>
	                            <%}else{ %>
	                            <td style="color:red">처리중</td>
	                            <%} %>
	                        </tr>
                      	<%} %>
                      	
                      	<%} %>
                      <%} %>
                    
                    <%}else{ %>                    			
                         		<h2 style="color:red"> 로그인이 필요한 항목입니다.</h2>                        
                    <%} %>     
                    </tbody>
        
                </table>
                <br><br><br>
            </div>              
            </div>         
        </div>
      </div>
	<script>
	$(function(){
	
		$(".list-area>tbody>tr").click(function(){
			var ino = $(this).children().eq(0).text();
			
			console.log(ino);
			
			location.href = "<%=contextPath%>/detail.inq?ino="+ino;
		})
		
	})
	
	
	
	</script>


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