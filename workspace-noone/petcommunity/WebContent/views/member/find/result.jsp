<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<% String getId = (String)request.getAttribute("getId");%>
<% String getPwd = (String)request.getAttribute("getPwd"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
<style>
.wrapper {
  height: 130vh;
}
.content{
	margin-left:500px;
	
}


.findIdForm {
  display: flex;
  flex-direction: column;
  height: 100%;
}

.findIdForm > h1 {
  margin-top: 100px;
  font-size: 50px;
  margin-bottom: 30px;
}

form {
  align-self: center;
  width: 500px;
  height: 400px;
}

table {
  width: 500px;
  height: 300px;
}

table * {
  font-size: 30px;
}


</style>
    

</head>
<body>

    <div class="wrapper">

      <%@include file="/views/common/menubar.jsp" %>

      <div class="main">

				
      
		        <div class='content'>
					
		          		
		          		<table>	
		          		<%if(getId != null){ %>      		
		          		<tr>
		          			
		          			<th>찾으시는 ID는 [</th>
		          			<td><%= getId %></td>
		          			<th>]입니다</th>
		          		</tr>
		          		<%}else if(getPwd != null){ %>
		          		<tr>
		          			
		          			<th>찾으시는 비밀번호는 [</th>
		          			<td><%= getPwd %></td>
		          			<th>]입니다</th>
		          		</tr>
		          		<%}else{ %>
		          		<tr>
		          			<th>조회된 정보가 없습니다.</th>
		          		<tr>	
		          		<%} %>		          		
		          		</table>
		          		<a href="<%=contextPath%>/loginForm.me" class="btn btn-primary">로그인하기</a>
		          	
		    
		    
		        </div><!-- content -->


      </div><!-- main -->

      <div class="footer">
		<%@include file="/views/common/footer.jsp" %>
      </div>

    </div><!-- wrapper -->

</body>
</html>