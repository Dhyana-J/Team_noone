<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
<style>

.header{
	height:120px !important;
}


.myInfoWrap {
  display: flex;
  flex-direction: column;
  align-items: center;
  height: 100%;
}
.myInfoWrap > h1 {
  margin-top: 100px;
  margin-bottom: 70px;
  font-size: 50px;
}

.myInfoWarp form {
  width: 50%;
  height: 800px;
}

#infoTable {
  width: 100%;
  height: 80%;
}

#infoTable * {
  font-size: 25px;
}

#infoTable td {
  text-align: left;
}

#infoTable input {
  margin-left: 30px;
  width: 70%;
  border-radius: 5px;
  border: 1px solid gray;
}

form > button {
  width: 70%;
  height: 70px;
  border: none;
  border-radius: 10px;
  margin-top: 40px;
  font-size: 30px;
}

/*현재 보고있는 메뉴 색상 표시!*/
.sideBar .subMenu:nth-child(1) *{color:tomato;}

</style>
</head>

<body>
    <div class="wrapper">
    
    	<%@include file="/views/common/menubar.jsp" %>
		<%
			int userNo=loginUser.getUserNo();
			String userId=loginUser.getUserId();
		  	String userPwd = loginUser.getUserPwd();
		  	String userName=loginUser.getUserName();
		  	String email=loginUser.getEmail()==null?"":loginUser.getEmail();
		  	String phone=loginUser.getPhone()==null?"":loginUser.getPhone();
		  	String address=loginUser.getAddress()==null?"":loginUser.getAddress();
		  	String addressDetail=loginUser.getAddressDetail()==null?"":loginUser.getAddressDetail();
		  	int addressCode=loginUser.getAddressCode();
		%>

      <div class="main">

        
        <%@include file="/views/member/myPage/sideBar.jsp" %>
      
        <div class='content'>
			
			<!---------내정보조회---------->
	        <div class="myInfoWrap">
	            
	          <h1>내정보조회</h1>
	
	          <form name="infoForm" action="<%=contextPath %>/update.me" method="post">
	
	            <table id="infoTable">
	              <tr>
	                <th>아이디</th>
	                <td>
	                  * <input type="text" name="userId" maxlength="12" value="<%=userId %>" required readonly><br>
	                </td>
	              </tr>
	              <tr>
	                <th>비밀번호</th>
	                <td>
	                  * <input type="password" name="userPwd" maxlength="20" id="userPwd" value="<%=userPwd %>" required placeholder="공백없는 영문/숫자 포함 6~20자">
	                </td>
	              </tr>
	              <tr>
	                <th>비밀번호확인</th>
	                <td>
	                  * <input type="password" name="checkPwd" maxlength="20" id="checkPwd" value="<%=userPwd %>" required>
	                </td>
	              </tr>
	              <tr>
	                <th>이름</th>
	                <td>
	                  * <input type="text" name="userName" value="<%=userName %>" maxlength="5" required>
	                </td>
	              </tr>
	              <tr>
	                <th>이메일</th>
	                <td>
	                  * <input type="email" name="email" value="<%=email %>" required>
	                </td>
	              </tr>
	              <tr>
	                <th>휴대전화번호</th>
	                <td>
	                  * <input type="text" name="phone" value="<%=phone %>" required placeholder="- 포함 입력">
	                </td>
	              </tr>
	              <tr>
	                <th>주소</th>
	                <td>
	                  &nbsp;&nbsp;<input type="text" name="address" value="<%=address%>">
	                </td>
	              </tr>
	              <tr>
	                <th>상세주소</th>
	                <td>
	                  &nbsp;&nbsp;<input type="text" name="addressDetail" value="<%=addressDetail%>">
	                </td>
	              </tr>
	              <tr>
	                <th>우편번호</th>
	                <td>
	                  &nbsp;&nbsp;<input type="text" name="addressCode" value="<%=addressCode%>">
	                </td>
	              </tr>
	              
	            </table>
	      
	            <button type="button" id="submitBtn">정보수정</button>
	
	          </form>
	
	        </div>
    
    
        </div><!-- content -->


      </div><!-- main -->

      <%@include file="/views/common/footer.jsp" %>

    </div>
<script src="<%=contextPath%>/resources/js/checkPwd.js"></script>
</body>
</html>