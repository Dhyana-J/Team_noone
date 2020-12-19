<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <link rel="stylesheet" href="enrollForm.css">
	
</head>
<body>
    <div class="wrapper">
		<%@ include file="../common/mainTop.jsp" %>
        <div class="enrollForm">
            <h1>회원정보 입력</h1>
            <form action="<%=context %>/enrollInsert.me" method="post" id="enrollData">
              <table>
                <tr>
                  <th>아이디</th>
                  <td>
                    * <input type="text" name="userId" maxlength="12"  required placeholder="영문 소문자와 숫자로만 총 4~12자"><br>
                  </td>
                  <td>
                  	<button type="button" onclick="idCheck();">ID 중복확인</button>
                  </td>
                </tr>
                <tr>
                  <th>비밀번호</th>
                  <td>
                    * <input type="password" name="userPwd" maxlength="20"  required placeholder="영문자(대소문자), 숫자, 특수문자(!@#$%^&*)로만 총 8~15자 사이로 입력해야됨">
                  </td>
                </tr>
                <tr>
                  <th>비밀번호확인</th>
                  <td>
                    * <input type="password" name="checkPwd" maxlength="20"  required>
                  </td>
                </tr>
                <tr>
                  <th>이름</th>
                  <td>
                    * <input type="text" name="userName"  maxlength="5" required>
                  </td>
                </tr>
                <tr>
                  <th>이메일</th>
                  <td>
                    * <input type="email" name="email" required>
                  </td>
                </tr>
                <tr>
                  <th>전화번호</th>
                  <td>
                    * <input type="text" name="phone" required placeholder="- 포함">
                  </td>
                </tr>
                
              </table>
        
              <button type="submit" onclick="return validate();" id="enrollBtn">회원가입</button>

            </form>
         </div><!--enrollForm-->
		 <br><br><br>
         <%@ include file="../common/mainLower.jsp" %>
    </div>
    
	<script>
        function idCheck(){
        	var $userId = $("#enrollData input[name=userId]");
        	$.ajax({
        		url:"idCheck.me",
        		type:"get",
        		data:{checkId:$userId.val()},
        		success:function(result){
        			if(result == "fail"){
        				console.log("test1");
        				alert("중복된 아이디입니다.");
        				$('#enrollBtn').attr('disabled',true);
        				$userId.focus();
        				
        			}else{
        				console.log("test2");
        				alert("사용가능한 아이디입니다.")
        				$('#enrollBtn').removeAttr('disabled');
        			}
        		}, error:function(){
        			console.log("fail");
        		}
        	});
        }
    </script>
</body>
</html>