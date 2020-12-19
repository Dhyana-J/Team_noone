<%@page import="com.kh.store.model.vo.Pinquiry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    Pinquiry pi = (Pinquiry)request.getAttribute("pi");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #detailinqu{
        margin:auto;
        margin-top:50px;
        width:800px;
        /* background: royalblue; */
        color: black;

       }
       #detailinq_form{
           margin:10px;
       }
       #detailinqu>h1{
           margin-bottom:30px;
       }
       
       #detailinqu table{
           border-top:1px solid rgb(127, 127, 127);
           border-collapse: collapse;
           width: 100%;
           text-align: center;
           color:black;
       }
       #detailinqu table th, #inquiry table th{
           background: rgb(224, 224, 224);
           border-top:1px solid rgb(127, 127, 127);
           border-bottom:1px solid rgb(127, 127, 127);
       }
       #commentinqu table th,td{
           border-top:1px solid rgb(127, 127, 127);
           border-bottom:1px solid rgb(127, 127, 127);
       }
       
       #detailinqu_btn2{
           width:100%;
           margin-top: 5px;

       }
       #detailinqu_btn2>button{
       	   margin-left: 10px;
       	   border: none;
           float: right;
       }

       
   </style>
</head>
<body>
    <%@ include file="../common/storeMenubar.jsp" %>
		<div id="detailinqu">
		        <h1 align="center">상품문의</h1>
		        <form action="" method="post" id="detailinqu_form">            
		            <!-- 후기내용 -->
		            <table>
		                <tr>
		                    <th>작성자</th>
		                    <td><%=pi.getPiWriter()%></td>
		                    <th>등록일</th>
		                    <td><%=pi.getPiEnroll() %></td>
		                </tr>
		                <tr>
		                    <th>조회</th>
		                    <td><%=pi.getCount() %></td>
		                    <th>제목</th>
		                    <td><%=pi.getPiTitle()%></td>
		                </tr>
		                <tr>
		                    <th>문의</th>
		                    <td colspan="3"><p style="height:100px;"><%=pi.getPiContent() %></p>
		                    </td>
		                </tr>
		                <tr>
		                    <th>답변</th>
		                    <!-- 관리자 답변이 있는경우 -->

		                     <%if(pi.getPiReply()!=null) {%>
		                     <td colspan="3"><p><%=pi.getPiReply() %>></p></td>              
		                     <%}else{ %>
		                    <td colspan="3"><p></p></td>
							<%} %>
		                    
		                </tr>
		                
		            </table>
		            <div id="detailinqu_btn2">
		                <button>목록가기</button>
		             <%if(loginUser!=null) {%>
			            <%if(pi.getUserNo()==loginUser.getUserNo()){%>
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
		           location.href="<%=context%>/piUpdateForm.st?pno=<%=pi.getpNo()%>&piNo=<%=pi.getPiNo()%>";
		       });
		       $(".cancle").click(function(){
		           location.href="<%=context%>/piDelete.st?pno=<%=pi.getpNo()%>&piNo=<%=pi.getPiNo()%>";
		       });
		       
		   });
		   
   </script>
     <%@ include file="../common/mainLower.jsp" %>
</body>
</html>