<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.store.model.vo.Review"%>
<%
    Review review = (Review)request.getAttribute("review");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
         #detailcomm{
         margin:auto;
         margin-top: 50px;
         width:800px;
         background: white;
         color: black;

        }
		#detailcomm>h1{
         margin-bottom:30px;

        }
        #detailcomm_form{
            margin:10px;
        }
        #detailcomm table{
            border-top:1px solid rgb(127, 127, 127);
            border-collapse: collapse;
            width: 100%;
            text-align: center;
            color:black;
        }
        #detailcomm table th, #inquiry table th{
            background: rgb(224, 224, 224);
            border-top:1px solid rgb(127, 127, 127);
            border-bottom:1px solid rgb(127, 127, 127);
        }
        #comment table th,td{
            border-top:1px solid rgb(127, 127, 127);
            border-bottom:1px solid rgb(127, 127, 127);
        }
        
        #detailcomm_btn2{
            width:100%;
            margin-top: 5px;

        }
        #detailcomm_btn2>button{
        	margin-left: 10px;
            border: none;
            float: right;
        }

        
    </style>
</head>
<body>
<%@ include file="../common/storeMenubar.jsp" %>
 <div id="detailcomm">
        <h1 align="center">상품후기</h1>
        
        <form action="" method="post" id="detailcomm_form">            
            <!-- 후기내용 -->
            <table>
                <tr>
                    <th>작성자</th>
                    <td><%=review.getUserName() %></td>
                    <th>등록일</th>
                    <td><%=review.getReviewDate()%></td>
                </tr>
                <tr>
                    <th>평점</th>
                    <td><%=review.getReviewRating() %></td>
                    <th>제목</th>
                     <td><%=review.getReviewTitle() %></td>
                </tr>
                <tr>
                    <th>후기</th>
                     <td colspan="3"><p style="height:100px;"><%=review.getReviewContent()%></p>
                    </td>
                </tr>
                    
                
            </table>
            <div id="detailcomm_btn2">
	            <button class="back" type="button">목록가기</button> 
	           <%if(loginUser!=null) {%>
		            <%if(review.getUserNo()==loginUser.getUserNo()){%>
		                <button class ="revise" type="button">수정하기</button>&nbsp;&nbsp;
		                <button class ="cancle" type="button">리뷰삭제</button>&nbsp;&nbsp;
					<%} %>
				<%}%>


            </div>
    </form>
   </div>
   
   <script>
   $(document).ready(function(){
       $(".revise").click(function(){
           location.href="<%=context%>/reviewUpdateForm.st?pno=<%=review.getpNo()%>&rno=<%=review.getReviewNO()%>";
       });
       $(".cancle").click(function(){
           location.href="<%=context%>/reviewDelete.st?pno=<%=review.getpNo()%>&rno=<%=review.getReviewNO()%>";
       });
       
   });
   
   </script>
 <%@ include file="../common/mainLower.jsp" %>
</body>
</html>