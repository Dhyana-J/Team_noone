<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		.bodyMenu{height:100% !important;}
        .bodyMenu a:hover{
            background: darkgray;
        }

        
        .bodyMenu table{
            margin-top: 50px;
            margin-bottom: 50px;
        }
</style>
</head>
<body>

 <div class="bodyMenu" align="center">
		<%@ include file="../common/mainTop.jsp" %>
        <table>
            <tr>
                <th><a href=""><img class="card-img-top" src="http://placehold.it/200x200" alt=""></a></th>
                <th><a href=""><img class="card-img-top" src="http://placehold.it/200x200" alt=""></a></th>
                <th><a href="<%=context%>/storeCategory.st?Page=1&category=D"><img class="card-img-top" src="http://placehold.it/200x200" alt=""></a></th>
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
        <%@ include file="../common/mainLower.jsp" %>
</div>

</body>
</html>