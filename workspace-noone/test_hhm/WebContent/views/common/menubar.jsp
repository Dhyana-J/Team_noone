<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
	String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  	<!-- Latest compiled and minified CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

      <!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
      <!-- Popper JS -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
      <!-- Latest compiled JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      

</head>
<style>
/*--------navigator.css*/
/*Nanum pen Script 글꼴 적용*/
@import url('https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap');

/*애니메이션 적용 위한 keyframes*/
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

* {
  font-family: 'Nanum Pen Script';
}

.header {
  display: flex;
  height: 120px;
}

#profile {
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-left: 5%;
  margin-top: 1%;
}

#headLogo {
  position: absolute;
  margin-left: 50%;
}

#profile:hover {
  cursor: pointer;
  animation: fadeIn 0.2s linear;
}

#thumbnail {
  margin-right: 10px;
  font-size: 30px;
}
#welcome {
  font-size: 20px;
}
#headLogo > a {
  font-size: 80px;
  color: rgba(241, 196, 15, 0.38);
  font-weight: bold;
  padding: 0px;
  margin-top: 0px;
}

#headLogo > a:hover {
  text-decoration: none;
  color: black;
  animation: fadeIn 0.3s linear;
}

.headerIcon {
  position: absolute;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 200px;
  margin-left: 85%;
  margin-top: 1.5%;
}
#headCart,
#headScrap {
  margin: 5px;
  font-size: 30px;
  text-align: center;
  width: 20%;
  height: 50%;
}

.headerIcon > #headCart:hover,
.headerIcon > #headScrap:hover {
  cursor: pointer;
  animation: fadeIn 0.2s linear;
}

.profileMenu {
  /* border: 1px solid green; */
  background-color: white;
  position: absolute;
  display: none;
  flex-direction: column;
  justify-content: space-between;
  margin-left: 80px;
  margin-top: 80px;
  width: 160px;
  height: 101px;
}
.profileMenu > a {
  /* border: 1px solid red; */
  text-decoration: none;
  color: black;
  background-color: rgb(224, 224, 224);
  font-size: 30px;
  text-align: center;
  height: 50px;
}
.profileMenu > a:hover {
  text-decoration: none;
  background-color: gray;
  animation: fadeIn 0.2s linear;
  color: white;
  cursor: pointer;
}

.logoutIcon {
  position: absolute;
  height: 70px;
  width: 150px;
  margin-left: 1320px;
  margin-top: 5px;
  display: flex;
  align-items: center;
}
.logoutIcon > button {
  width: 75px;
  height: 40px;
  border-radius: 5px;
  border: none;
  margin: 5px;
  font-size: 17px;
}

.navigator {
  display: flex;
  flex-flow: row wrap;
  justify-content: space-between;
  height: 8%;
}

.navigator,
.sideBar {
  background: rgb(255, 235, 205);
}

.mainMenu {
  height: 100%;
  width: 20%;
}

.mainMenu a {
  text-decoration: none;
  color: black;
  display: block;
  width: 100%;
  height: 100%;
  font-size: 30px;
  line-height: 200%;
}

.mainMenu a:hover {
  background-color: rgb(218, 214, 214);
  text-decoration: none;
  color: white;
  animation: fadeIn 0.2s linear;
}

.sideBar {
  margin-top: 1px;
  display: flex;
  flex-direction: column;
}

.sideBar > h2 {
  /* border: 2px solid black; */
  text-align: center;
  font-size: 35px;
  font-weight: bold;
  height: 100px;
  line-height: 70px;
}
#menuContent {
  /* border: 2px solid black; */
  display: flex;
  flex-direction: column;
  height: 88%;
}

.subMenu {
  display: flex;
  justify-content: center;
}

.subMenu > a:hover,
.subMenu > span:hover {
  text-decoration: none;
  color: tomato;
  cursor: pointer;
}

.subMenu > a {
  font-size: 25px;
  width: 70%;
  color: black;
  line-height: 70px;
}
.subMenu > span {
  /*사이드네비게이터 > 화살표*/
  margin-top: 10px;
  font-family: sans-serif;
  font-weight: bold;
  font-size: 25px;
}

#menuContent .subMenu {
  border-top: 2px solid gray;
}

#menuContent .subMenu:last-child {
  border-bottom: 2px solid gray;
}

.subMenuList {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  align-self: center;
}

.subMenuList > ul {
  height: 100%;
  font-size: 25px;
  margin-right: 30px;
}

.subMenuList > ul:hover,
.subMenuList a:hover {
  text-decoration: none;
  color: blue;
}

.subMenuList li > a {
  text-decoration: none;
  color: black;
}

/*----------layout.css*/
.wrapper * {
  text-align: center;
}
.wrapper {
  height: 150vh;
  display: flex;
  flex-direction: column;
}

.header {
  height: 120px;
}

.navigator {
  height: 60px;
}

.main {
  height: 100%;
  display: flex;
}

.sideBar {
  width: 20%;
}
.content {
  width: 80%;
}

.topBtn {
  border: none;
  background: none;
  font-size: 30px;
  position: fixed;
  right: 100px;
  bottom: 120px;
}
.topBtn:hover {
  text-decoration: none;
}

</style>
<body>

    <%if(alertMsg!=null){ %>
    		<script type="text/javascript">
    			alert('<%=alertMsg%>');
    		</script>
    		<%session.removeAttribute("alertMsg");%>
    	<%} %>

      <div class="header">
          <!--로그인시 보여질 헤더-->
          <%if(loginUser!=null){ %>
	      <div id="profile">
	        <div id="thumbnail">🐷</div>
	        <div id="welcome"><%=loginUser.getUserName()%>님<br>환영합니다⬇</div>
	      </div>
	
	      <h1 id="headLogo">
	        <%if(loginUser != null && loginUser.getManager().equals("Y")){ %>
		  		<a href="<%=contextPath%>/adminhome.go">PC</a>
		  	<%}else{ %>
	      		<a href="<%=contextPath%>">PC</a>
	      	<%} %>
	      </h1>
	
	      <div class="headerIcon">
	          <div id="headCart">🛒</div>
	          <div id="headScrap">📙</div>
	      </div>
	
	      
	      <!-- 프로필 클릭하면 나타났다가 또 클릭하면 사라져야하는 메뉴 -->
	      <div class="profileMenu">
	        <a href="<%=contextPath %>/myPage.me" class="gotoMyPage">마이페이지</a>
	        <a href="<%=contextPath %>/loginForm.me" class="logOut">로그아웃</a>
	      </div>
	      <%}else{ %>
	      
	      <!--로그아웃시 보여질 헤더-->
		      <h1 id="headLogo">
		        <a href="<%=contextPath%>">PC</a>
		      </h1>
	      
	     	<div class="logoutIcon">
	        <button type="button" onclick="location.href='<%=contextPath%>/loginForm.me'">로그인</button>
	        <button type="button" onclick="location.href='<%=contextPath%>/enrollTerm.me'">회원가입</button>
	    
	      	</div>
	      <%} %>
      </div>
      
      <div class="navigator">
		  <%if(loginUser != null && loginUser.getManager().equals("Y")){ %>
	  		<div class="mainMenu"><a href="<%=contextPath%>/adminhome.go">홈</a></div>
	  	  <%}else{ %>
      		<div class="mainMenu"><a href="<%=contextPath%>">홈</a></div>
      	  <%} %>
	      <div class="mainMenu"><a href="<%=contextPath%>/storeCategory.st?Page=1&category=D">스토어</a></div>
	      <div class="mainMenu"><a href="">커뮤니티</a></div>
	      <div class="mainMenu"><a href="">공지사항</a></div>
	      <div class="mainMenu"><a href="">고객센터</a></div>
      </div>

<script>

//navigator.js
//프로필 클릭시 나타나는 메뉴리스트 전용
let profile = document.querySelector('#profile');
let welcome = document.querySelector('#welcome'); //환영합니다 화살표 바꿔주기위한 변수
let profileMenu = document.querySelector('.profileMenu');

//프로필 클릭 시 프로필메뉴를 보이자.
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
</script>
</body>
</html>