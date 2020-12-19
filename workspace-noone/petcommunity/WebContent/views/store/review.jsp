<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int pno = (int)request.getAttribute("pno");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 #commentWrite{
         margin:auto;
         margin-top:50px;
         width:800px;
         height:700px;
         background: white;
         color: black;

        }
        #commentWrite_form{
            
            margin:10px;
        }
        #commentWrite table{
            border-top:1px solid rgb(127, 127, 127);
            border-collapse: collapse;
            width: 100%;
            font-size:px;
            text-align: center;
            color:black;
        }
        #commentWrite table th{
            background: rgb(224, 224, 224);
            border-top:1px solid rgb(127, 127, 127);
            border-bottom:1px solid rgb(127, 127, 127);
        }
        #commentWrite table th,  #commentWrite table td{
            font-size:20px;
            border-top:1px solid rgb(127, 127, 127);
            border-bottom:1px solid rgb(127, 127, 127);
        }
        #commentWrite input, #commentWrite select{
            margin-left:10px;
            float: left;
        }
        #commentWrite textarea{
            width: 95%;
            box-sizing: border-box;
            margin-left:10px;
        }
        
        #commentWrite_btn{
            width:100%;
            margin-top: 5px;

        }
        #commentWrite_btn>button{
            border: none;
            float: right; 
            width:130px;
            font-size: 20px;
        }

        
    </style>
</head>
<body>
<%@ include file="../common/storeMenubar.jsp" %>

<div id="commentWrite">
        <h1 align="center">후기 작성</h1>

        
        <form action="<%=context %>/reviewInsert.st" method="post" id="commentWrite_form" align="center">            
            <input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
            <input type="hidden" name="pNo" value="<%= pno %>">
            <!-- 후기내용 -->
            <table>
                <tr>
                    <th width="100px">작성자</th>
                    <td><input style="width: 100px; font-size: px;" type="text" name="uerName" id="uerName" value="<%=loginUser.getUserName() %>" disabled></td>

                </tr>
                <tr>
                    <th>평점</th>
                    <td>
                        <select id="point" style="width: 130px;" id="" name="reviewRating">
                            <option value="6">-- 평점 --</option>
                            <option value="1">1.0 점</option>
                            <option value="2">2.0 점</option>
                            <option value="3">3.0 점</option>
                            <option value="4">4.0 점</option>
                            <option value="5">5.0 점</option>
                        </select>
                    </td>

                </tr>
                <tr>
                    <th>제목</th>
                    <td><input style="width: 200px;" type="text" name="reviewTitle" ></td>

                </tr>
                <tr>
                    <th>후기</th>
                    <td><textarea style="resize:none" name="reivewContent" cols="50" rows="13" required></textarea></td>
                </tr>

                    
                
            </table>
            <div id="commentWrite_btn">
                <button id="b" type="submit" disabled>작성완료</button>
            </div>
        </form>
    </div>
<script>
	$(function(){
		$("#point").change(function(){
			if($(this).val() == 6){
				$("#b").attr("disabled", true);
			}else{
				$("#b").attr("disabled", false);
			}
		});
		
	});
</script>
<%@ include file="../common/mainLower.jsp" %>
</body>
</html>