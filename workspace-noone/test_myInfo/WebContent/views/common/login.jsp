<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

<style>
.wrapper {
  height: 130vh;
}
.content{
	margin-left:200px;
}


.loginForm {
  display: flex;
  flex-direction: column;
  height: 100%;
}

.loginForm > h1 {
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

tr:nth-child(3) button {
  width: 85%;
  height: 50px;
  font-size: 20px;
}

tr:nth-child(4) > td {
  width: 33%;
}

tr:nth-child(4) button {
  width: 50px;
  width: 50%;
  font-size: 20px;
}

</style>
</head>
<body>
    <div class="wrapper">

     <%@include file="/views/common/menubar.jsp" %>

      <div class="main">

        
      
        <div class='content'>

	        <div class="loginForm">
            <h1>로그인</h1>
            <form action="<%=contextPath%>/login.me" method="post">
              <table>
                <tr>
                  <td id="insertId">
                   	 아이디
                  </td>
                  <td colspan="2">
                    <input type="text" name="userId" maxlength="12" required>
                  </td>
                </tr>
                <tr>
                  <td>
                   	 비밀번호
                  </td>
                  <td colspan="2">
                    <input type="password" name="userPwd" maxlength="20" required>
                  </td>
                </tr>
                <tr>
                  <td colspan="3">
                    <button type="submit" class="btn btn-secondary">로그인</button>
                  </td>
                </tr>
                <tr>
                  <td>
                    <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/enrollTerm.me'">회원가입</button>
                  </td>
                  <td>
                    <button type="button" class="btn btn-primary">ID찾기</button>
                  </td>
                  <td>
                    <button type="button" class="btn btn-primary">PW찾기</button>
                  </td>
                </tr>
              </table>
            </form>
          </div><!--loginForm-->
    
        </div><!-- content -->


      </div><!-- main -->

      <%@include file="/views/common/footer.jsp" %>

    </div>

</body>
</html>