<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int ino = (int)request.getAttribute("ino");

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
        #enrollForm_cn input, #enrollForm_cn textarea{
          width:600px;
          box-sizing: border-box;
          text-align: left;

        }
        .content{         
          width:1000px;
        }
        .cnth{
          width:100px;

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
          <h2>고객센터</h2> <br>
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
          <br>
          <h2>1:1상담 답변하기</h2>
          
          <form action="<%=contextPath %>/reInsert.inq" id="enrollForm_cn" method="POST" >          
			<input type="hidden" name="ino" value=<%=ino %> >
            <table align="center">
                
                <tr>
                    <th class="cnth">답변내용</th>
                    <td><textarea name="content" rows="13" required style="resize:none"></textarea></td>
                </tr>
            </table>
            <br><br>

            <div align="center">
                <button type="submit">답변등록</button>
                <button type="button" onclick="history.back();">뒤로가기</button>
            </div>

        </form>
        
                 
    
    
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