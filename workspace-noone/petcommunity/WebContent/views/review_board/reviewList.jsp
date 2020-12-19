<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.review.model.vo.ReviewCon, com.kh.review.model.vo.PageInfo"%>
<%
    int Psort = (int)request.getAttribute("Psort");
	ArrayList<ReviewCon> list = (ArrayList<ReviewCon>)request.getAttribute("list");
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
            <select id="Psort" name="category">
                    <option value="1"<%if(Psort == 1){  %>
                    							selected
                    							<%} %>>전체</option>
                    <option value="2"<%if(Psort == 2){  %>
                    							selected
                    							<%} %>>처리중</option>
                    <option value="3"<%if(Psort == 3){  %>
                    							selected
                    							<%} %>>처리완료</option>

                </select>

        </div>
        

        <br>
        <div class="tbody">
        	<%if(list.isEmpty()){ %>
	              <h3 align="center">등록된 상품이 없습니다.</h3>
	    	<%}else{ %>
	    		<%for(ReviewCon r : list) {%>
		            <table class="test1">
		                <tr>
		                    <th rowspan="2"><img class="card-img-top" src="http://placehold.it/100x100" alt=""></th>
		                    <%if(r.getReportStatus().equals("N")){ %>
		                    	<th>처리중</th>
		                    <%} else { %>
		                    	<th>처리완료</th>
		                    <%} %>
		                    <th  style="width:50px;"><%=r.getReportClass() %></th>
		                    <th style="width:300px;"><%=r.getReportContent() %></th>
		                    <th></th>
		                </tr>
		                <tr>
		                    <th colspan="2"><%=r.getUserName() %></th>
		                    <th style="width:300px;"><%=r.getReviewNo() %></th>
		                    <td><%if(r.getReportStatus().equals("N")){ %><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal" data-num="<%=r.getReviewNo()%>"  >처리하기</button><%} %></td>
		                </tr>
		            </table>
             	<%} %>   
	    	<%} %>

            

            
        </div>
        <br>
        <br>
        <div class="paging-area" align="center">
			<%if(Pinfo.getCurrentPage() != 1){ %>
            	<a href="<%=context%>/review.bo?Page=<%=Pinfo.getCurrentPage() - 1%>&Psort=<%=Psort %>">&lt; 이전 </a>
            <%} %>
			<%for(int i = Pinfo.getStartPage(); i < Pinfo.getEndPage() + 1; i++) {%>
            	<a href="<%=context%>/review.bo?Page=<%=i%>&Psort=<%=Psort %>"><%=i %></a>
        	<%} %>
        	<%if(Pinfo.getMaxPage() > 0 && Pinfo.getMaxPage() != Pinfo.getCurrentPage()){ %>
            	<a href="<%=context%>/review.bo?Page=<%=Pinfo.getCurrentPage() + 1%>&Psort=<%=Psort %>">다음 &gt;</a>
            <%} %>

        </div>
	</div>
	<script>
	$(function(){
    	var num = "";
    	$(document).ready(function() {
    		$('#myModal').on('show.bs.modal', function(event){
    			num = $(event.relatedTarget).data('num');
    			no = $(event.relatedTarget).data('no');
    		});
    	});
    	$("#Psort").change(function(){
			location.href = "<%=context%>/review.bo?Page=1&Psort="+$(this).val();
		});
    	$("#call").click(function(){
        	
        	call();
        	
        });
    	  function call(){
    		  $.ajax({
    			  url:"deleteReviewCon.re",
    			  type:"POST",
    			  data:{
    				  review_no:num},
    			  success:function(result){
    				  alert("처리되었습니다.");
    			  },error:function(){
    				  alert("실패되었습니다.");
    			  }
    		  })
    	  }

});
        </script>
	<%@ include file="../common/mainLower.jsp" %>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal body -->
        <div class="modal-body">
          <h3>해당 신고된 리뷰를 삭제하시겠습니까?</h3>
          <button id="call" type="button" class="btn btn-primary" data-dismiss="modal">삭제하기</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소하기</button>
        </div>

        
      </div>
    </div>
  </div>
</body>
</html>