<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.member.model.vo.Member"%>
<% String ctxPath = request.getContextPath(); %>
<% ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); %>
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
		margin:50px;
	
	}
	table {
	  width: 1100px;
	  height: 100px;
	}
	
	table * {
	  font-size: 20px;
	  border:1px solid black;
	}
	
	.main{
		height: 100vh;
	}	
	
</style>
    

</head>
<body>

    <div class="wrapper">

      <%@include file="/views/common/menubar.jsp" %>

      <div class="main">

        
		      <div class="sideBar">
		        
		     	    <h2>회원관리</h2>
			        <div id="menuContent">
			            <div class="subMenu">
			                <a href="<%=contextPath%>/lookUp.mem">회원조회</a>
			            </div>
			            <div class="subMenu">
			              <a href="<%=contextPath%>/lookUpBlack.mem">블랙리스트조회</a>
			            </div>			           
		            </div>
      		 </div>
		        <div class='content'>
					<h1>블랙리스트조회</h1>
					<br>
		          <table>
		          	<tr class="trtr">		          	 	
                        <th>회원번호</th>
                        <th>아이디</th>
                        <th>비밀번호</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>주소</th>
                        <th>상세주소</th>
                        <th>우편번호</th>
                        <th>탈퇴여부</th>
                        <th>매니저권한</th>
                        <th>신고수</th>		          	
		          	</tr>
		          	<%if(list.isEmpty()){ %>
		          		<tr>
		          			<td colspan="12">조회된 리스트가 없습니다.</td>
		          		</tr>
		          	
		          	<%}else{ %>
		          	
		          		<%for(Member m : list){ %>
		          			<%if(m.getReportAmount()>10) {%>
		          			<tr class="trtr" style="background:red">
		          				<td><%=m.getUserNo() %></td>
		          				<td><%=m.getUserId() %></td>
		          				<td><%=m.getUserPwd() %></td>
		          				<td><%=m.getUserName() %></td>
		          				<td><%=m.getEmail() %></td>
		          				<td><%=m.getPhone() %></td>
		          				<td><%=m.getAddress() %></td>
		          				<td><%=m.getAddressDetail() %></td>
		          				<td><%=m.getAddressCode() %></td>
		          				<td><%=m.getQuit() %></td>
		          				<td><%=m.getManager() %></td>
		          				<td><%=m.getReportAmount() %></td>
		          			<tr>
		          			<%}else{ %>
		          			<tr class="trtr" style="background:yellow">
		          				<td><%=m.getUserNo() %></td>
		          				<td><%=m.getUserId() %></td>
		          				<td><%=m.getUserPwd() %></td>
		          				<td><%=m.getUserName() %></td>
		          				<td><%=m.getEmail() %></td>
		          				<td><%=m.getPhone() %></td>
		          				<td><%=m.getAddress() %></td>
		          				<td><%=m.getAddressDetail() %></td>
		          				<td><%=m.getAddressCode() %></td>
		          				<td><%=m.getQuit() %></td>
		          				<td><%=m.getManager() %></td>
		          				<td><%=m.getReportAmount() %></td>
		          			<tr>
		          			
		          			<%} %>		          			
		          		<%} %>
		          		
		          	<%} %>		          
		          </table>
		    	
		    
		        </div>


      </div><!-- main -->
		<div class="footer">
		<%@include file="/views/common/footer.jsp" %>
      </div>
     

    </div><!-- wrapper -->
	 
</body>
</html>
