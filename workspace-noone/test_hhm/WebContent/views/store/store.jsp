<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.store.model.vo.Product, com.kh.store.model.vo.PageInfo"%>
    <%
    String category = (String)request.getAttribute("category");
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");
	PageInfo Pinfo = (PageInfo)request.getAttribute("p");
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style>
    .outer{
        background:white;
        color:white;
        width:800px;
        /* height:800px; */
        margin:auto;
        margin-top:50px;
        color:black;
    }
    .list-area{
        width:760px;
        margin:auto;
    }
    #search{
        width:94%;
    }
    #serch_result{
        float: right;
        width: 95%;
    }
    .thumbnail{
        border:1px solid white;
        width:150px;
        display:inline-block;
        margin:16px;
        color:black;
    }
    .thumbnail:hover{
        cursor:pointer;
        opacity:0.7;
    }
    .paging-area a{
        text-decoration:none;
        color:black;
        margin:5px;
        }
</style>
</head>
<body>
<%@ include file="../common/storeMenubar.jsp" %>
    <div class="outer">
        <br>
        <%if(category.equals("C")){ %>
        <h1 align="center">냥냥이스토어</h1>
        <%}else {%>
        <h1 align="center">댕댕이스토어</h1>
        <%} %>
        <br>
        <% if(loginUser != null && loginUser.getManager().equals("Y")) {%>
	        <div align="right" style="width:850px;">
	        	<a href="<%=context %>/storeEnroll.st" class="btn btn-secondary btn-sm">상품등록</a>
	        	<br><br>
	        </div>
		<%} %>

        <!--현재 로그인 되어있을 경우-->
        <div width="100%">
            <div id="search" align="right">
                <select name="category">
                    <option value="1">최근</option>
                    <option value="2">저가</option>
                    <option value="3">고가</option>
                    <option value="4">판매량</option>
                </select>
                <input type="search" name="pro_keyword" style="width: 150px;" placeholder="serch..">
                <button type="submit"><i class="fa fa-search"></i></button>
                <br><br>
            </div>
            <!-- 검색결과 -->
            <!-- <div id="serch_result">
                <span style="">키워드</span>
                <span style="color:red;">검색결과 (건)</span>
            </div> -->
        </div>
     

        <div class="list-area">
        <%if(list.isEmpty()){ %>
	              <h3 align="center">등록된 상품이 없습니다.</h3>
	    <%}else{ %>
			<%for(Product p : list) {%>
	            <div class="thumbnail" align="center">
	            	<input type="hidden" value="<%= p.getpNo() %>">
	                <img src="<%=context %>/<%=p.getpThumbUrl() %>" width="150" height="100">
	                <div align="left"><%=p.getpName() %></div>
	                <div align="right"><%=p.getPrice()%></div>
	                <div align="left"><%=p.getpSales() %></div>
	            </div>
	        <%} %>   
	    <%} %>
  		
            
        </div>
        <div class="paging-area" align="center">
			<%if(Pinfo.getCurrentPage() != 1){ %>
            	<a href="<%=context%>/storeCategory.st?Page=<%=Pinfo.getCurrentPage() - 1%>&category=<%=category %>">&lt; 이전 </a>
            <%} %>
			<%for(int i = Pinfo.getStartPage(); i < Pinfo.getEndPage() + 1; i++) {%>
            	<a href="<%=context%>/storeCategory.st?Page=<%=i%>&category=<%=category %>"><%=i %></a>
        	<%} %>
        	<%if(Pinfo.getMaxPage() > 0 && Pinfo.getMaxPage() != Pinfo.getCurrentPage()){ %>
            	<a href="<%=context%>/storeCategory.st?Page=<%=Pinfo.getCurrentPage() + 1%>&category=<%=category %>">다음 &gt;</a>
            <%} %>

        </div>
    </div>
    <script>
        	$(function(){
        		$(".thumbnail").click(function(){
        			location.href = "<%=context%>/detail.st?pno="+$(this).children().eq(0).val()+"&rp=1&pip=1&qp=1";
        		})
        	});
        </script>
<%@ include file="../common/mainLower.jsp" %>
</body>
</html>