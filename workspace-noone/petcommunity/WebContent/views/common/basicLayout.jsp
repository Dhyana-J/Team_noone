<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

    

</head>
<body>
<!---------------------------------다른 폼 작성할 때 쓸 기본 레이아웃------------------------------------->
<!-- header,navigator는 menubar.jsp include-->
<!-- footer는 footer.jsp include 해서 쓰면 됨 -->
    <div class="wrapper">

      <%@include file="/views/common/menubar.jsp" %>

      <div class="main">

        
		      <div class="sideBar">
		        
		     	    <h2>부제목</h2>
			        <div id="menuContent">
			            <div class="subMenu">
			                <a href="">가</a>
			            </div>
			            <div class="subMenu">
			              <a href="">나</a>
			            </div>
			            <div class="subMenu">
			              <a href="">다</a>
			            </div>
			                <div class="subMenuList">
			                    <ul>
			                        <li><a href="">a</a></li>
			                        <li><a href="">b</a></li>
			                        <li><a href="">c</a></li>
			                    </ul>
			                </div>
			            <div class="subMenu">
			              <a href="">라</a>
			            </div>
			        </div>
		        </div><!-- sideBar -->
      
		        <div class='content'>
		
		          
		    
		    
		        </div><!-- content -->


      </div><!-- main -->

      <div class="footer">
		<%@include file="/views/common/footer.jsp" %>
      </div>

    </div><!-- wrapper -->

</body>
</html>