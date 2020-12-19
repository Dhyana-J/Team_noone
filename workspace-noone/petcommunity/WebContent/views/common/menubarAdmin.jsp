<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.member.model.vo.Member" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");

	String alertMsg = (String)session.getAttribute("alertMsg");
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        #loginForm{float:right}
        #userInfo a{
            color:black;
            text-decoration: none;
            font-size: 11px;
            
        }
        .navWrap{background: burlywood;}
        .menu{
            display:table-cell;
            height:50px;
            width:150px;
        }
        .menu a{
            text-decoration: none;
            color:black;
            font-weight: bold;

            display:block;
            width:100%;
            height:100%;
            font-size: 20px;
            line-height: 50px;
        }
        .menu a:hover{
            background: darkgray;
        }
    </style>
</head>
<body>
    <h1 align="center">PC</h1>
    <div class="loginArea">
        <form id="loginForm" action="" method="post">
            <table>
                <tr>
                    <th><label for="userId">아이디 : </label></th>
                    <td><input type="text" id="userId" name="userId" required></td>
                </tr>
                <tr>
                    <th><label for="userPwd">비밀번호 : </label></th>
                    <td><input type="password" id="userPwd" name="userPwd" required></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <button type="submit">로그인</button>
                        <button type="button">회원가입</button>
                    </th>
                </tr>
            </table>
        </form>
    </div>

    <div id="userInfo" align="left">
        <b>xxx님</b>의 방문을 환영합니다<br><br>
        <div class="loginArea">
            <a href="">마이페이지</a>
            <a href="">로그아웃</a>
        </div>
    </div>

    <br clear="both">
    <br>

    <div class="navWrap" align="center">
        <div class="menu"><a href="">홈</a></div>
        <div class="menu"><a href="">스토어</a></div>
        <div class="menu"><a href="">커뮤니티</a></div>
        <div class="menu"><a href="">공지사항</a></div>
        <div class="menu"><a href="">고객센터</a></div>
    </div>
</body>
</html>