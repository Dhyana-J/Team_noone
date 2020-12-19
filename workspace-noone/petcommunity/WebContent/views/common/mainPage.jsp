<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
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

      <style>
        .outer{
            background: white;
            color: black;
            width:900px;
            height: 1000px;
            margin:auto;
            margin-top: 50px;
            
        }
        .rbody{
            margin-top: 50px;
            margin-left: 20px;
            
            height: 380px;
            width: 380px;
            margin-right: 80px;
            float: left;
        }
        .lbody{
            margin-top: 50px;
            box-sizing: border-box;
            margin-left: 400px;
            
            height: 380px;
            width: 490px;
            margin-right: 80px;
            
        }
        
        .rbody>table{
            
            float: left;
            margin: 10px;
            box-sizing: border-box;
        }
        
       

    </style>
</head>
<body>
    <div class="wrapper">
    <%@include file="/views/common/menubar.jsp" %>
	

   
    <div class="outer">
        <div class="rbody">
            <h3 align="center" >최근 이미지</h3>
            <table class="test1">
                <tr>
                    <th><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                </tr>
               
            </table>
            <table class="test1">
                <tr>
                    <th><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                </tr>
           
            </table>
            <table class="test1">
                <tr>
                    <th><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                </tr>
      
            </table>
            <table class="test1">
                <tr>
                    <th><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                </tr>
        
            </table>
            <table class="test1">
                <tr>
                    <th><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                </tr>
            
            </table>
            <table class="test1">
                <tr>
                    <th><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                </tr>
   
            </table>
        </div>
            <div class="lbody">
                <h3 align="center">베스트 추천 게시글</h3>
                <table class="list-area" align="center">
                    <thead>
                        <tr>
                            <th></th>
                            <th>글번호</th>
                            <th width="100">제목</th>
                            <th width="100">작성자</th>
                            <th>작성일</th>
                            <th width="100">추천수</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <tr>
                            <td colspan="5">존재하는 게시글이 없습니다</td>
                        </tr>
                        
                        <tr>
                            <td><input type="checkbox" value="1"></td>
                            <td>1</td>
                            <td>test</td>
                            <td>status</td>
                            <td>냥냥</td>
                            <td>2020-09-23</td>
                        </tr>
        
                        
                    </tbody>
                </table>
            </div>
            
            
        
    	</div>
	

   
	<%@ include file="../common/productRecommend.jsp" %>
      <%@include file="/views/common/footer.jsp" %>

    

</body>
</html>