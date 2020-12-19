<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
                <option value="2">미답변</option>
                <option value="3">진행중</option>
                <option value="4">답변완료</option>
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
                    <th width="300">문의 내용</th>
                    <th width="100">문의 상태</th>
                    <th>고객</th>
                    <th width="100">문의일</th>
                </tr>
            </thead>
            <tbody>
                
                <tr>
                    <td colspan="5">존재하는 문의사항이 없습니다</td>
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