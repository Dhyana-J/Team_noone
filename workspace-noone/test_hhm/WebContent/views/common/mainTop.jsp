<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
 <%
 Member loginUser = (Member)session.getAttribute("loginUser");

String alertMsg = (String)session.getAttribute("alertMsg");
 String context = request.getContextPath();
 %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  
  <link rel="stylesheet" href="<%=context %>/resources/css/navigator.css"/>
  <link rel="stylesheet" href="<%=context %>/resources/css/layout.css">
  <link rel="stylesheet" href="<%=context %>/resources/css/footer.css"/>
  <link rel="stylesheet" href="<%=context %>/resources/css/enrollForm.css">


      <!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

      <style>
	      .logoutIcon a{
	        text-decoration: none;
	        color: black;
	      }
	     
  	  </style>
  	  
  	  
</head>
<body>
  <div class="wrapper">
    <!--header-->
    <div class="header">

	<%if(loginUser != null){%>
      <!--로그인시 보여질 헤더-->
      <div id="profile">
        <div id="thumbnail">🐷</div>
        <div id="welcome"><%=loginUser.getUserName()%>님<br>환영합니다⬇</div>
      </div>

      <h1 id="headLogo">
      	<%if(loginUser != null && loginUser.getManager().equals("Y")){ %>
	  		<a href="<%=context%>/adminhome.go">PC</a>
	  	<%}else{ %>
      		<a href="<%=context%>">PC</a>
      	<%} %>
      </h1>

      <div class="headerIcon">
          <div id="headCart">🛒</div>
          <div id="headScrap">📙</div>
      </div>

      
      <!-- 프로필 클릭하면 나타났다가 또 클릭하면 사라져야하는 메뉴 -->
      <div class="profileMenu">
        <a href="<%=context %>/myPage.me" class="gotoMyPage">마이페이지</a>
        <a href="<%=context %>/logout.me" class="logOut">로그아웃</a>
      </div>
      <%} else{%>
      
		<h1 id="headLogo">
       		<a href="<%=context%>">PC</a>
      	</h1>
		<div class="logoutIcon">
        	<!--
        	<button type="button" data-toggle="modal" data-target="#loginView">로그인</button>        	
        	-->
        	<button type="button" onclick="location.href='<%=context %>/loginForm.me'">로그인</button>
        	<button type="button" onclick="location.href='<%=context%>/enrollTerm.me'">회원가입</button>
        	
     	</div>
      <%} %>
    </div>
	 <div class="modal" id="loginView">
        <div class="modal-dialog">
        <div class="modal-content">
        
            <!-- Modal Header -->
            <div class="modal-header">
            	<h4 class="modal-title" align="center">로그인</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Modal body -->
            <div class="modal-body" >
                
                <form action="<%=context %>/login.me" method="post">
                    <table>
                        <tr>
                            <th width="200px;">아이디</th>
                            <td width="200px;"><input type="text" name="userId" required width="200px;"></td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><input type="password" name="userPwd" required></td>
                        </tr>
           
                    </table>
                    <br><br>
                     <button type="submit" class="btn btn-secondary btn-sm">확인</button>
                </form>
                <br>
                   

            </div>
            
        </div>
        </div>
    </div>
    <!--navigator-->
    <div class="nav">
	  <%if(loginUser != null && loginUser.getManager().equals("Y")){ %>
	  	<div class="mainMenu"><a href="<%=context%>/adminhome.go">홈</a></div>
	  <%}else{ %>
      	<div class="mainMenu"><a href="<%=context%>">홈</a></div>
      <%} %>
      <div class="mainMenu"><a href="<%=context%>/storeCategory.st?Page=1&category=D">스토어</a></div>
      <div class="mainMenu"><a href="">커뮤니티</a></div>
      <div class="mainMenu"><a href="">공지사항</a></div>
      <div class="mainMenu"><a href="">고객센터</a></div>

    </div>
  </div>
  
   
  
<script>

//navigator.js
//프로필 클릭시 나타나는 메뉴리스트 전용
let profile = document.querySelector('#profile');
let welcome = document.querySelector('#welcome'); //환영합니다 화살표 바꿔주기위한 변수
let profileMenu = document.querySelector('.profileMenu');

//프로필 클릭 시 프로필메뉴를 보이자.
if(profile!=null){
	profile.addEventListener('click',function(){
	
		//str.indexOf('') : 문자열 찾으면 문자열 인덱스 반환, 못찾으면 -1 반환 
		if(welcome.innerText.indexOf('⬆')>-1){
			welcome.innerText=welcome.innerText.replace('⬆','⬇');
			profileMenu.style.display='none';
		}else{
			welcome.innerText=welcome.innerText.replace('⬇','⬆');
			profileMenu.style.display='flex';
		}
	
	})
	
}
</script>
</body>
</html>
