<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        .outer{
            background: white;
            color: black;
            width:800px;
            height: 850px;
            margin:auto;
            margin-top: 50px;
            border: 1px solid black;
        }
        .search_bar{
            margin-top: 10px;
        }
        .search_bar select{
            float: left;
            margin-left: 90px;
            margin-right: 330px;;
        }
        .tbody{
            margin-left: 80px;
            height: 730px;
            margin-right: 80px;
        }
        .tbody>table{
            float: left;
            margin: 10px;

        }

        .paging-area a{
            text-decoration: none;
            color: black;
            margin: 5px;
        }
        .tbody table tr th{
            width: 100px;
            box-sizing: border-box;
        }
        .tbody table{
            border: 1px solid black;
        }

        .tfoot button{
            margin-left: 10px;
        }
       
    </style>
</head>
<body>
	<%@ include file="../common/storeMenubar.jsp" %>
    <div class="outer">
        <div class="search_bar">
            <select name="category">
                <option value="1">전체</option>
                <option value="2">배송시작</option>
                <option value="3">배송중</option>
                <option value="4">반품</option>
            </select>

            <form class="example" action="">
                <button type="submit"><i class="fa fa-search"></i></button>
                <input type="text" placeholder="Search.." name="search2">
              </form>
        </div>

        <br>
        <div class="tbody">
            <table class="test1">
                <tr>
                    <th rowspan="2" style="width:10px;"><input type="checkbox"></th>
                    <th rowspan="2"><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                    <th><input type="text" style="width:80px;" placeholder="아이디or이름"></th>
                    <th><input type="text" style="width:80px;" placeholder="배송상태"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="상품명"></th>
                </tr>
                <tr>
                    <th colspan="2"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="운송장 번호"></th>
                </tr>
            </table>

            <table class="test1">
                <tr>
                    <th rowspan="2" style="width:10px;"><input type="checkbox"></th>
                    <th rowspan="2"><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                    <th><input type="text" style="width:80px;" placeholder="아이디or이름"></th>
                    <th><input type="text" style="width:80px;" placeholder="배송상태"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="상품명"></th>
                </tr>
                <tr>
                    <th colspan="2"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="운송장 번호"></th>
                </tr>
            </table>
            <table class="test1">
                <tr>
                    <th rowspan="2" style="width:10px;"><input type="checkbox"></th>
                    <th rowspan="2"><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                    <th><input type="text" style="width:80px;" placeholder="아이디or이름"></th>
                    <th><input type="text" style="width:80px;" placeholder="배송상태"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="상품명"></th>
                </tr>
                <tr>
                    <th colspan="2"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="운송장 번호"></th>
                </tr>
            </table>
            <table class="test1">
                <tr>
                    <th rowspan="2" style="width:10px;"><input type="checkbox"></th>
                    <th rowspan="2"><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                    <th><input type="text" style="width:80px;" placeholder="아이디or이름"></th>
                    <th><input type="text" style="width:80px;" placeholder="배송상태"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="상품명"></th>
                </tr>
                <tr>
                    <th colspan="2"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="운송장 번호"></th>
                </tr>
            </table>
            <table class="test1">
                <tr>
                    <th rowspan="2" style="width:10px;"><input type="checkbox"></th>
                    <th rowspan="2"><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                    <th><input type="text" style="width:80px;" placeholder="아이디or이름"></th>
                    <th><input type="text" style="width:80px;" placeholder="배송상태"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="상품명"></th>
                </tr>
                <tr>
                    <th colspan="2"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="운송장 번호"></th>
                </tr>
            </table>
            <table class="test1">
                <tr>
                    <th rowspan="2" style="width:10px;"><input type="checkbox"></th>
                    <th rowspan="2"><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
                    <th><input type="text" style="width:80px;" placeholder="아이디or이름"></th>
                    <th><input type="text" style="width:80px;" placeholder="배송상태"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="상품명"></th>
                </tr>
                <tr>
                    <th colspan="2"></th>
                    <th style="width:300px;"><input type="text" style="width:200px;" placeholder="운송장 번호"></th>
                </tr>
            </table>

            
        </div>
        <div class="tfoot" align="right">
            <button type="submit" style="margin-right: 80px;">1:1문의로 전송</button>
        </div>
        <br>
        <div class="paging-area" align="center">
            
            <a href="">&lt;이전페이지</a>


            <a href="">1</a>
            <a href="">2</a>
            <a href="">3</a>






            <a href="">다음페이지&gt;</a>

        </div>

	</div>
	<%@ include file="../common/mainLower.jsp" %>

</body>
</html>