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
            margin:auto;
            margin-top: 50px;
        }
        .list-area{
            border:1px solid black;
            text-align:center;
        }


        .list-area tbody>tr:hover{
            cursor: pointer;
        }

        .search_bar select{
            float: left;
            margin-left: 90px;
            margin-right: 330px;;
        }
        
    </style>
</head>
<body>
	<%@ include file="../common/storeMenubar.jsp" %>
    <div class="outer">

        <div class="search_bar">
            <select name="category">
                <option value="1">전체</option>
                <option value="2">주문완료</option>
                <option value="3">구매취소</option>
                <option value="4">구매완료</option>
                <option value="5">구매취소완료</option>
            </select>

            <form class="example" action="">
                <button type="submit"><i class="fa fa-search"></i></button>
                <input type="text" placeholder="Search.." name="search2">
              </form>
        </div>

        <br>
    
        <table class="list-area" align="center">
            <thead>
                <tr>
                    <th></th>
                    <th>글번호</th>
                    <th width="300">구매 물품</th>
                    <th width="100">구매 상태</th>
                    <th>구매자</th>
                    <th width="100">구매일</th>
                </tr>
            </thead>
            <tbody>
                
                <tr>
                    <td colspan="5">존재하는 구매사항이 없습니다</td>
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
        <br><br>
        <div align="right" style="width:700px">
            <button>1:1 문의로 전송</button>
            <br><br>
        </div>
        <br>
    </div>
    <%@ include file="../common/mainLower.jsp" %>
</body>
</html>