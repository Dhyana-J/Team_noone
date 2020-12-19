<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrapper{height:100vh !important;}
.content{width:100% !important;}
.bodyMenu{
	width:100%; height:100%;
	display:flex;
	justify-content:center;
	align-items:center;
}
</style>
</head>
<body>
    <div class="wrapper">

      <%@include file="/views/common/menubar.jsp" %>

      <div class="main">

      
		        <div class='content'>
		
		          	 <div class="bodyMenu">
					        <table>
					            <tr>
					                <th><a href=""><img class="card-img-top" src="http://placehold.it/200x200" alt=""></a></th>
					                <th><a href=""><img class="card-img-top" src="http://placehold.it/200x200" alt=""></a></th>
					                <th><a href="<%=contextPath%>/storeCategory.st?Page=1&category=D"><img class="card-img-top" src="http://placehold.it/200x200" alt=""></a></th>
					                <th><a href=""><img class="card-img-top" src="http://placehold.it/200x200" alt=""></a></th>
					            </tr>
					            <tr align="center">
					                <!--이미지 삽입시 삭제할곳-->
					                <th>커뮤니티관리</th>
					                <th>회원관리</th>
					                <th>스토어관리</th>
					                <th>고객센터관리</th>
					            </tr>
					            
					        </table>
					 </div>
		    
		    
		        </div><!-- content -->


      </div><!-- main -->

      <div class="footer">
		<%@include file="/views/common/footer.jsp" %>
      </div>

    </div><!-- wrapper -->

</body>
</html>