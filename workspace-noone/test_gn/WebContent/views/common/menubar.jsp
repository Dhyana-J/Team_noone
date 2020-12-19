<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	String alertMsg = (String)session.getAttribute("alertMsg");
	
	String contextPath = request.getContextPath(); // "/test_gn"

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 
 	<% if(alertMsg != null){ %>
 		<script>
 			alert("<%= alertMsg %>");
 		</script>
 		
 		<%
 			session.removeAttribute("alertMsg");
 		%> 		
 		
 	<%} %>
 
 <h1>This is test for gun</h1>
   <% if(loginUser == null){ %> 
	 <form id="loginForm" action="<%= contextPath%>/login.me" method="post">
	 
	 	<table>
	 		<tr>
	 			<th><label for="userId">아이디</label></th>
	 			<td><input type="text" id="userId" name="userId" required></td> 		
	 		</tr>
	 		<tr>
		        <th><label for="userPwd">비밀번호</label></th>
		        <td><input type="password" id="userPwd" name="userPwd" required></td>
		    </tr>
		     <tr>
		         <th colspan="2">
		             <button type="submit">로그인</button>
		             <button type="button" onclick="enrollPage();" >회원가입</button>
		         </th>
		     </tr>     
	 	
	 	</table>
	
	 </form>
 <%}else{ %>

	<div id="userInfo">
		<b><%=loginUser.getUserName() %>님</b>의 방문을 환영합니다.<br>
		<a href="<%= contextPath%>/logout.me" class="btn btn-secondary btn-sm">로그아웃</a>
		
	</div>
 <%} %>
 	<br><br>
 	<div id="navigator">
		<a href="<%=contextPath %>/scenterMain.sc" class="btn btn-secondary">고객센터</a>
	</div>
 
 
 
</body>
</html>