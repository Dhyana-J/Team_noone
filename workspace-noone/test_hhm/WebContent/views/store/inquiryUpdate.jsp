<%@page import="com.kh.store.model.vo.Pinquiry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Pinquiry pi = (Pinquiry)request.getAttribute("pi");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
         #inquiryWrite{
         margin:auto;
         margin-top: 50px;
         width:800px;
         background: white;
         color: black;

        }
        #inquiryWrite_form{
            margin:30px;
            
        }
        #inquiryWrite table{
            border-top:1px solid rgb(127, 127, 127);
            border-collapse: collapse;
            width: 100%;
            color:black;
        }
        #inquiryWrite table th{
            background: rgb(224, 224, 224);
            border-top:1px solid rgb(127, 127, 127);
            border-bottom:1px solid rgb(127, 127, 127);
            text-align: center;
        }
        #inquiryWrite table th, #inquiryWrite table td{
            border-top:1px solid rgb(127, 127, 127);
            border-bottom:1px solid rgb(127, 127, 127);
        }
        #inquiryWrite input, #inquiryWrite textarea{
            margin-left:10px;
            float: left;
        }
        #inquiryWrite textarea{
            width: 95%;
            box-sizing: border-box;
        }
        
        #inquiryWrite_btn{
            width:100%;
            margin-top: 5px;

        }
        #inquiryWrite_btn>button{
            border: none;
            float: right; 
            width:100px;
            font-size: 16px;
        }


        
    </style>
</head>
<body>
<%@ include file="../common/storeMenubar.jsp" %>

   <div id="inquiryWrite">
        <h1 align="center">문의작성</h1>

        
        <form action="<%=context %>/inquiryUpdate.st" method="post" id="inquiryWrite_form" align="center"> 
        	<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
            <input type= "hidden" name ="piNo" value="<%=pi.getPiNo()%>">
            <input type="hidden" name="pNo" value="<%=pi.getpNo() %>">           
            <!-- 후기내용 -->
            <table>
                <tr>
                    <th width="100px">작성자</th>
                    <td style="width: 100px;">
                        <input style="width: 100px;" type="text" name="userName" id="uerName" value="<%=pi.getPiWriter() %>" disabled>                  
                    </td>
                    <td style="text-align: left;">
                        <input type="checkbox" id="secret" name="secret" value="Y">
                        <label for="secret">비밀글</label>
                    </td>
                </tr>
                
                <tr>
                    <th>제목</th>
                    <td colspan="2"><input style="width: 200px;" type="text" name="inquiry_title" value="<%=pi.getPiTitle() %>" ></td>
                </tr>
                <tr>
                    <th>문의</th>
                    <td td colspan="2"><textarea  style="resize:none" name="inquiry_content" rows="13" cols="50"required><%=pi.getPiContent() %></textarea></td>
                </tr>

            </table>
            <div id="inquiryWrite_btn">
                <button type="submit">수정하기</button>
            </div>
        </form>
    </div>
    
    <script>

	
	$(function(){
		$("#secret").each(function(){
			<%if(pi.getSecret().equals("Y")){%>
				$(this).attr("checked", true);
			<%}%>
		});
	});
	

</script>
    <%@ include file="../common/mainLower.jsp" %>
</body>
</html>