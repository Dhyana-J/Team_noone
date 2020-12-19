<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
<style>
.wrapper {
  height: 1000px;
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
  height: 100px;
}

table * {
  font-size: 30px;
}

th{
	width:100px;
}

</style>
    

</head>
<body>

    <div class="wrapper">

      <%@include file="/views/common/menubar.jsp" %>

      <div class="main">

				
      
		        <div class='content'>
					
		          	<form action="find.id" method="post" class="findIdForm">
		          		<h1>아이디찾기</h1>
		          		<table>
		          		
		          		<tr>
		          			<th>이름 : </th>
		          			<td><input type="text" name="userName" required maxlength="12"></td>
		          		</tr>
		          		<tr>
		          			<th>전화번호 : </th>
		          			<td><input type="text" name="phone" required maxlength="11" placeholder = "-를 제외하고 입력해주세요"></td>
		          		</tr>
		          		
		          		
		          		</table>
		          		<br>
		          		<input type="submit" value="찾기" class="btn btn-secondary" >
		          	</form>
		    
		    
		        </div><!-- content -->


      </div><!-- main -->

      <div class="footer">
		<%@include file="/views/common/footer.jsp" %>
      </div>

    </div><!-- wrapper -->

</body>
</html>