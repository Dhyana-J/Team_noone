<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.review.model.vo.Review, com.kh.review.model.vo.PageInfo"%>
<%
    int Psort = (int)request.getAttribute("Psort");
	int type = (int)request.getAttribute("type");
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	PageInfo Pinfo = (PageInfo)request.getAttribute("p");
%>
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
            height: 850px;
            margin:auto;
            margin-top: 50px;
            
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
            <select name="Psort">
                <option value="1">전체</option>
                <option value="2">처리중</option>
                <option value="3">처리완료</option>
            </select>

            <form class="example" action="">
                <button type="submit"><i class="fa fa-search"></i></button>
                <input type="text" placeholder="Search.." name="search2">
              </form>
        </div>
        

        <br>
        <div class="tbody">
        	<%if(list.isEmpty()){ %>
	              <h3 align="center">등록된 상품이 없습니다.</h3>
	    	<%}else{ %>
	    		<%for(Review r : list) {%>
		            <table class="test1">
		                <tr>
		                    <th rowspan="2" style="width:10px;"><input type="checkbox" value=""></th>
		                    <th rowspan="2"><a href=""><img class="card-img-top" src="http://placehold.it/100x100" alt=""></a></th>
		                    <th>상태</th>
		                    <th  style="width:50px;">신고수</th>
		                    <th style="width:300px;"><%=r.getReviewContent() %></th>
		                </tr>
		                <tr>
		                    <th colspan="2"><%=r.getUserName() %></th>
		                    <th style="width:300px;"><%=r.getpNo() %></th>
		                </tr>
		            </table>
             	<%} %>   
	    	<%} %>

            

            
        </div>
        <br>
        <div class="tfoot" align="right">
            <button type="submit">신고처리</button>
            <button type="submit" style="margin-right: 80px;">삭제</button>
        </div>
        <br>
        <div class="paging-area" align="center">
			<%if(Pinfo.getCurrentPage() != 1){ %>
            	<a href="<%=context%>/review.bo?type=<%=type %>&Page=<%=Pinfo.getCurrentPage() - 1%>&Psort=<%=Psort %>">&lt; 이전 </a>
            <%} %>
			<%for(int i = Pinfo.getStartPage(); i < Pinfo.getEndPage() + 1; i++) {%>
            	<a href="<%=context%>/review.bo?type=<%=type %>&Page=<%=i%>&Psort=<%=Psort %>"><%=i %></a>
        	<%} %>
        	<%if(Pinfo.getMaxPage() > 0 && Pinfo.getMaxPage() != Pinfo.getCurrentPage()){ %>
            	<a href="<%=context%>/review.bo?type=<%=type %>&Page=<%=Pinfo.getCurrentPage() + 1%>&Psort=<%=Psort %>">다음 &gt;</a>
            <%} %>

        </div>
	</div>
	<%@ include file="../common/mainLower.jsp" %>

</body>
</html>