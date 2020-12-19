<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String errorMsg = (String)request.getAttribute("errorMsg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 찾을 수 없습니다.</title>
<style>
	body{
		text-align:center;
	}
</style>
</head>
<body>
	
	<div class="wrapper">

      <%@include file="/views/common/menubar.jsp" %>

      <div class="main">

        
        <div class="sideBar"></div>
      
        <div class='content'>

          
    
    
        </div>


      </div>

      <div class="footer">
		<%@include file="/views/common/footer.jsp" %>
      </div>

    </div>

	<script type="text/javascript">
			alert('<%=errorMsg%>');
			history.back();
	</script>	
</body>
</html>