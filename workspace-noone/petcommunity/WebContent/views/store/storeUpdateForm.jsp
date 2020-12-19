<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.kh.store.model.vo.Product"%>
<%
	Product p = (Product)request.getAttribute("p");
	ArrayList<String> list = (ArrayList<String>)request.getAttribute("list");
	String alertMsg2 = (String)session.getAttribute("alertMsg2");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .outer{
            margin: auto;
            margin-top: 50px;
            width: 900px;
            height: 900px;
        }
        #UpdateForm {
           background: gray;
           width: 100%;
           height: 90%;
        }
        .outer *{
            box-sizing: border-box;
        }
        .tbody {
            width: 40%;
            height: 40%;
            float: left;
        }
        .tinput{
            width: 60%;
            height: 40%;
            float: left;
        }
        .tfoot{
           
            width: 98.3%;
            height: 40%;
        }
        .tbody *{
            margin-left: 30px;
            margin-top: 10px;
        }
        .tinput table{
            width: 80%;
            height: 100%;
            margin-left: 100px;
        }
		.tbody img{
            cursor: pointer;
        }

    </style>
    
</head>
<body>
<% if(alertMsg2 != null){ %>
		<script>
			alert("<%= alertMsg2 %>");
		</script>
		
		<%
			session.removeAttribute("alertMsg2");
		%>
		
	<% } %>
	<%@ include file="../common/storeMenubar.jsp" %>
    <div class="outer">
        <br>
        <br>
        <form id="UpdateForm" action="<%=context%>/updateProduct.st?pno=<%=p.getpNo() %>" method="post" enctype="multipart/form-data">
            <div class="tbody">
                <img id="titleImg" src= "<%=p.getpThumbUrl() %>" width="140" height="140">
                <%if(list.isEmpty()){ %>
	                <img id="contentImg1" width="140" height="140">
	                <img id="contentImg2" width="140" height="140">
	                <img id="contentImg3" width="140" height="140">
	            <%}else{%>
	            	<%int num = 0; %>
	            	<%for(String s : list) {%>
	            		<img id="contentImg<%=num+1%>" src="<%=s%>" width="140" height="140">
	            		<%num = num + 1;%>
	            	<%} %>
	            	<%for(;num < 3; num++){ %>
	            		<img id="contentImg<%=num+1%>" width="140" height="140">
	            	<%} %>
	            <%} %>
            </div>
            <div class="tinput">
                <table align="center">
                    <tr>
                        <th style="margin: 10px;">상품명 </th>
                        <td><input type="text" name="pName" style="width: 78%;" value="<%=p.getpName() %>"></td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td><input type="text" name="price" style="width: 78%;" value="<%=p.getPrice()%>"></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="pCategory" style="width: 78%;">
                            	<%if(p.getpCategory().equals("D")){ %>
                            		 <option value="D" selected>댕댕이</option>
                                	 <option value="C">냥냥이</option>
                            	<%}else{ %>
                            		 <option value="D">댕댕이</option>
                                	 <option value="C" selected>냥냥이</option>
                            	<%} %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>재고</th>
                        <td><input type="number" name="pStock" style="width: 78%;" value="<%=p.getpStock()%>"></td>
                    </tr>
                    
                </table>
            </div>
        

            <table class="tfoot" align="center">
                <tr>
                    <th>브랜드</th>
                    <td colspan="2"><input type="text" name="pBrand" style="width: 80%;" value="<%=p.getpBrand()%>"></td>
                    <th>모델명</th>
                    <td colspan="2"><input type="text" name="pModel" style="width: 80%;" value="<%=p.getpModel()%>"></td>
                </tr>
                <tr>
                    <th>설명</th>
                    <td colspan="5"><textarea name="description" cols="30" rows="10" style="width: 91%; height: 90%; resize: none;"><%=p.getDescription() %></textarea></td>
                </tr>
            </table>
            
            <br>
            <div align="center">
                <button type="submit">등록하기</button>
                <button type="reset">취소하기</button>
            </div>
        </form>
    </div>
<%@ include file="../common/mainLower.jsp" %>
</body>
</html>