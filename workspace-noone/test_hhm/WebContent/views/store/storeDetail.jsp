<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.store.model.vo.Product"%>
<%@ page import="com.kh.store.model.vo.Review"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.kh.store.model.vo.PageInfo"%>
<%@ page import="com.kh.store.model.vo.Pinquiry" %>
<%
	ArrayList<Review> reviewList = (ArrayList<Review>)request.getAttribute("reviewList");
	ArrayList<String> list = (ArrayList<String>)request.getAttribute("list");
	ArrayList<Pinquiry> PiList = (ArrayList<Pinquiry>)request.getAttribute("PiList");
	Product p = (Product)request.getAttribute("p");
	PageInfo rpi = (PageInfo)request.getAttribute("rpi");
	PageInfo qpi = (PageInfo)request.getAttribute("qpi");
	String alertMsg2 = (String)session.getAttribute("alertMsg2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        
        #proDetailForm{
            margin: auto;
            width:800px;
            padding:30px;
            background: white;
        }
        #area1{
            margin: 0;
            padding: 0;
            width:100%;
            height: 200px; 
            margin: 20px 0px 40px 0px;
            
            /* background:blueviolet; */
        }
        #area1>div{
            float: left;
            height: 100%;
            
        }
        #photo{
            width:40%;
            height: 200px;
            /* background: tomato; */
            /* display: flex; */
            /* align-items: center; */
            /* justify-content: center; */
            
            
        }
        #img{
            border: 1px solid black;
            width:100%;
            height:200px;
        }
        #info{
            width:60%;
            height:100%;
        }
        #info_table{
        
            padding-left:30px;
            width: 100%;
            height:100%;
            color:black;
        }
        #info_table th{
            width: 100px;
            height: 39px;
            text-align:left;
            color:black;
            font-size: 20px;
            box-sizing: border-box;
        }
        #info_table td{
            text-align:left;
            color:black;
            font-size: 16px;
        }
        #info_btn>button{
            width: 25%;
            height: 30px;
            font-size: 16px;
            border: none;
        }
        #navigator{
            width:100%;
            height:40px;
        }
        #navi{
            height: 100%;
            margin:0;
            padding:0;
            list-style-type:none;
        }
        #navi>li{
            float:left;
            width:25%;
            height:100%;
            /* border: solid springgreen; */
            /* box-sizing: border-box; */
            background: rgb(224, 224, 224);
            text-align:center;
            
        }
        #navi>li>a{
            /* line-height: 30px;
            
            height:100%; */
            /* vertical-align: middle; */
            /* border: 1px solid orange; */
            text-decoration: none;
            color:black;
            font-size:20px;
            font-weight: 900;   
            display:block;
            height:100%;
            line-height: 40px;
        }
        #navi li:hover{
           background: rgb(94, 94, 94);
        }
        #navi a:hover{
            color:white;
        }
       
        #explan{
            margin-top: 10px;
            width:100%;    
        }
        #subPhoto{
            background: rosybrown;
            width:300px;
            height:300px;
            margin: auto;
            margin-top: 10px;
        }
        #explan>div{
            margin: auto;
            width:80%;
            /* background: aqua; */
            word-break:break-all; /* 자동 줄바꿈 */
            color:black;
        }
        #comment{
         margin-top: 50px;
         width:100%;
         /* background: royalblue; */
        }
        #inquiry{
            margin-top: 70px;
            /* background: blue; */
            width:100%;
        }
        #comment_form,#inquiry_form{
            margin:10px;
            /* background: saddlebrown; */
        }
        #comment_filter{
            margin-bottom: 5px;
            /* background: salmon; */
        }
        #comment table,#inquiry table{
            border:1px solid rgb(224, 224, 224);
            border-collapse: collapse;
            width: 100%;
            text-align: center;
            color:black;
        }
        #comment table th, #inquiry table th{
            background: rgb(224, 224, 224);
        }
        #comment table th,#comment table td{
            border:1px solid rgb(224, 224, 224);
        }
        #comment_form tbody>tr:hover,#inquiry_form tbody>tr:hover{
            background-color: rgb(224, 224, 224,0.4);
            cursor: pointer;
        }
        #comment a,#inquiry a{text-decoration: none; color: black;}
        #comment_head,#inquiry_head,#bc_head{
                font-size:20px;
                margin:0px 10px;
                color:black;
                font-weight: bolder;
        }
        #comment_btn1,#inquiry_btn1{
                margin:0;
                padding:0;
                list-style-type:none;
        }
        #comment_btn1 ul,#inquiry_btn1 ul{
            margin:0px;
            padding:0px;
            list-style-type: none;
            display:none;
        }
        #comment_btn1 ul>li:hover,#inquiry_btn1 ul>li:hover{
            background: rgb(224, 224, 224);
            
        }
        #comment_btn1 li:hover+ul,#inquiry_btn1 li:hover+ul{
            display:block;
            width:50px;
            position: relative;left: 10px; top:-10px;
            background: white;
            border: 1px solid rgb(224, 224, 224);
            
            
        }
        #comment_btn1>ul:hover,#inquiry_btn1>ul:hover{
            width:50px;
            position: relative;left: 10px; top:-10px;
            background: white;
            border: 1px solid rgb(224, 224, 224);
            display:block;
            
        }
        #enroll_date1>div{
            padding-top: 5px;
            float:left;
            /* background:lightgreen; */
        }
        #enroll_date2>div{
            padding-top: 5px;
            float:left;
            /* background:lightgreen; */
        }
        #comment_btn2,#inquiry_btn2{
            /* background: sandybrown; */
            width:100%;
            margin-top: 5px;
        }
        #comment_btn2>button,#inquiry_btn2>button{
            
            /* float: right; */
        }
        .paging-area a{
        text-decoration:none;
        color:black;
        margin:5px;
        }
        
        #inquiry_content>table{
            border: 1px solid rgb(224, 224, 224);
        }
        #inquiry_search  {
            margin-bottom: 5px;
            /* background: lightblue; */
            float: right;
        }
        #inquiry table th,#inquiry td{
            border:1px solid rgb(224, 224, 224);
        }
        
        #bc{
            margin-top: 70px;
            width:100%
        }
        #bc_content{
            border-collapse: collapse;
            color: black;
            border:1px solid rgb(224, 224, 224);
            margin:10px;
        }
        #bc_content th{
            color: black;
            text-align: center;
            background: rgb(224, 224, 224);
        }
        #bc_content tr{
           color:black;
        }
		
		/*왼쪽메뉴바 화면에 맞게 늘이기*/
		.left_menu{
			height:2300px !important;
		}
       
    </style>
</head>
<body>
<%@ include file="../common/storeMenubar.jsp" %>
<body>
	<% if(alertMsg2 != null){ %>
		<script>
			alert("<%= alertMsg2 %>");
		</script>
		
		<%
			session.removeAttribute("alertMsg2");
		%>
		
	<% } %>


    <div id="proDetailForm">
    <div id= "area1">
        
        <!-- 상품 사진 -->
        <div id="photo">
            <div><img src = "<%=p.getpThumbUrl() %>" style="width: 250px; height: 200px;" id="img"></img></div>
            
        </div>
        <!-- 상품정보(상품명, 가격, 배송비, 수량..) -->
        <div id="info">
            <form id="info_form" action="<%=context%>/basketInsert.st" method="post">
            	<input type="hidden" name ="pno" value="<%=p.getpNo() %>">
            	<%if(loginUser!=null) {%>
				<input type="hidden" name="userNo" value="<%=loginUser.getUserNo()%>">
				<%} %>
                <table id="info_table">
                    <tr>
                        <th style="font-size: 23px;">상품명</th>
                        <td style="font-size: 23px; font-weight: bold;"><%=p.getpName() %></td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td><%=p.getPrice()%>원</td>
                    </tr>
                    <tr>
                        <th>배송</th>
                        <td>무료배송</td>
                    </tr>
                    <tr>
                        <th>수량</th>
                        <td><input id ="amount" name="amount" type="number" min="1" max="<%=p.getpStock() %>" step="1" value="0"></td>
                    </tr>
                    <tr>
                        <th>재고</th>
                        <td><%=p.getpStock() %></td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <div id="info_btn" align="center">
                            	<input type="hidden" name = "pay" value="">
                                <button type="button">찜하기</button>
                                <button id="basket" type="submit">장바구니</button>
                                <button id="pay" type="submit">구매하기</button>
                            </div>

                        </th>
                        
                    </tr>
                </table>
               
            </form>
        </div>
    </div>
    
    <div id="navigator">
        <ul id="navi">
            <li><a href="#explan">상세정보</a></li>
            <li><a href="#comment">상품후기</a></li>
            <li><a href="#inquiry">상품문의</a></li>
            <li><a href="#bc">반품/환불</a></li>
        </ul>
    </div>

        <!-- sub사진갯수만큼 for문 -->
        <%for(String s : list) {%>
            <div id="subPhoto">
                <img src="<%=s %>" width="300px;" height="300px;">
            </div>
        <%} %>
            <div id="explan">
            <div name="explan" align="center">
                
                <p><%=p.getDescription() %></p>
            </div>

        </div>

       <!-- 상품후기 -->
       <div id="comment">
        <div id="comment_head">상품후기</div>
        <hr>
        
        <form action="" method="post" id="comment_form">
            <!-- 평점 -->
            <div id="comment_filter">
                <select name="grade" id="">
                    <option value="">-- 평점 --</option>
                    <option value="1">1.0 점</option>
                    <option value="2">2.0 점</option>
                    <option value="3">3.0 점</option>
                    <option value="4">4.0 점</option>
                    <option value="5">5.0 점</option>
                </select>
            </div>
            <!-- 후기내용 -->
            <table>
            	<thead>
                <tr>
                    <th width="50px">번호</th>
                    <th width="90px">작성자</th>
                    <th width="80px">평점</th>
                    <th>후기</th>
                    <th width="110px">등록일</th>
                </tr>
                </thead>
                <%if(reviewList.isEmpty() ) {%>
                
	                <tr>
	                    <td colspan="5">후기를 작성해주세요.</td>
	
	                </tr>

                
                <%}else{ %>
	                <%for(Review r :reviewList){ %>  
	                 <tbody>
	                 <tr>
	                    <td><%=r.getReviewNO()%></td>
	                    <td><%=r.getUserName() %></td>
	                    <td><%=r.getReviewRating() %></td>
	                    <td><%=r.getReviewTitle() %></td>
	                    <td>
	                        <div id="enroll_date1">
	                            <div style="width:80%;">
	                                <%=r.getReviewDate() %>
	                                <br>
	                                <a href="">신고하기</a>
	                            </div>
	                            <div style="width:20%; height:30px ;">
	                                <ul id="comment_btn1">
	                                    <li>...</li>
	                                    <%if(loginUser!=null){ %>
	                                    	<%if(loginUser.getUserNo()==r.getUserNo()){ %>
	                                        <ul>
	                                            <li><a href="<%=context%>/reviewDelete.st?pno=<%=r.getpNo()%>&rno=<%=r.getReviewNO()%>">삭제</a></li>
	                                            <li><a href="<%=context%>/reviewUpdateForm.st?pno=<%=r.getpNo()%>&rno=<%=r.getReviewNO()%>">수정</a></li>
	                                        </ul>
	                                        <%} %>
	                                 	<%} %>
	                                </ul>
	                            </div>
	                        </div>
	                    </td>
	                </tr>
	                </tbody>
	                <%} %>
	            <%} %>
            </table>

            <div id="comment_btn2">
                <button type="button">리뷰작성</button>
            </div>



    </form>


        <div class="paging-area" align="center">
			<%if(rpi.getCurrentPage() != 1){ %>
            	<a href="<%=context%>/detail.st?pno=<%=p.getpNo() %>&rp=<%=rpi.getCurrentPage() - 1%>&pip=<%=qpi.getCurrentPage() - 1%>&qp=1">&lt; 이전 </a>
            <%} %>
			<%for(int i = rpi.getStartPage(); i < rpi.getEndPage() + 1; i++) {%>
            	<a href="<%=context%>/detail.st?pno=<%=p.getpNo() %>&rp=<%=i%>&pip=1&qp=1"><%=i %></a>
        	<%} %>
        	<%if(rpi.getMaxPage() > 0 && rpi.getMaxPage() != rpi.getCurrentPage()){ %>
            	<a href="<%=context%>/detail.st?pno=<%=p.getpNo() %>&rp=<%=rpi.getCurrentPage() + 1%>&pip=<%=qpi.getCurrentPage() + 1%>&qp=1">다음 &gt;</a>
            <%} %>

        </div>
    </div>

    <!-- 상품문의 -->
       
    <div id="inquiry">
        <div id="inquiry_head">상품문의</div>
        <hr>
        <form id="inquiry_form" action="">
            <div id="inquiry_search">
                <input type="search" style="width:100px" >&nbsp;<button >검색</button>
            </div>
            <!-- 작성된 문의글이 있을 경우 -->
            <table>
            	<thead>
                <tr>
                    <th width="50px">번호</th>
                    <th width="90px">작성자</th>
                    <th width="50px">조회</th>
                    <th>상품문의</th>
                    <th width="100px">등록일</th>
                    <th width="90px" >답변</th>
                </tr>
                </thead>
                <!-- 문의가 없을 경우  -->
                <%if(PiList.isEmpty()) {%>
                 <tr>
                    <td colspan="6">문의를 작성해주세요.</td>
                </tr>
                <%}else{ %>
                <tbody> 
                <!-- 문의 행 증가 for문 -->
                <%for(Pinquiry pi: PiList) {%>
                <tr>
                    <td><%=pi.getPiNo() %></td>
                    <td><%=pi.getPiWriter() %></td>
                    <td><%=pi.getCount() %></td>
                    <%if(pi.getSecret().equals("Y")){ %>
	                    <td>비밀글입니다.</td>   
                    <%}else{ %>
                    	<td><%=pi.getPiTitle() %></td>
                    <%} %>
                   
                    <td><%=pi.getPiEnroll() %></td>
                    <td> 
                        <div id="enroll_date2">
                            <div style="width:80%; color:red">
                                <%if(pi.getReplyStatus().equals("Y")){ %>
                                	답변완료
                                <%}else{%>
                                	미완료
                                <%} %>
                            </div>
                        <div style="width:20%; height:30px ;">
                            <ul id="inquiry_btn1">
                                <li>...</li>
                                 <%if(loginUser!=null){ %>
	                                   <%if(loginUser.getUserNo()==pi.getUserNo()){ %>
                                    <ul>
                                        <li><a href="<%=context%>/piDelete.st?pno=<%=pi.getpNo()%>&piNo=<%=pi.getPiNo()%>">삭제</a></li>
                                        <li><a href="<%=context%>/piUpdateForm.st?pno=<%=pi.getpNo()%>&piNo=<%=pi.getPiNo()%>">수정</a></li>
                                    </ul>
                                    <%} %>
                                 <%} %>
                            </ul>
                        </div>
                    </td>
                </tr>
                </tbody>
                <%} %>
				<%} %>
               
            </table>
            
            
            <div id="inquiry_btn2">
                <button type="button">문의작성</button>
            </div>
             
            
        </form>
        
        <div class="paging-area" align="center">
			<%if(qpi.getCurrentPage() != 1){ %>
            	<a href="<%=context%>/detail.st?pno=<%=p.getpNo() %>&rp=<%=rpi.getCurrentPage() - 1%>&pip=<%=qpi.getCurrentPage() - 1%>&qp=1">&lt; 이전 </a>
            <%} %>
			<%for(int i = qpi.getStartPage(); i < qpi.getEndPage() + 1; i++) {%>
            	<a href="<%=context%>/detail.st?pno=<%=p.getpNo() %>&rp=1&pip=<%=i%>&qp=1"><%=i %></a>
        	<%} %>
        	<%if(qpi.getMaxPage() > 0 && qpi.getMaxPage() != qpi.getCurrentPage()){ %>
            	<a href="<%=context%>/detail.st?pno=<%=p.getpNo() %>&rp=<%=rpi.getCurrentPage() + 1%>&pip=<%=qpi.getCurrentPage() + 1%>&qp=1">다음 &gt;</a>
            <%} %>

        </div>

   </div>

        <!-- 교환/환불 -->
        <div id="bc">
            <div id="bc_head">반품/교환</div>
            <hr>
            <table id="bc_content">
                <tr>
                    <th style="width: 100px;">교환/환불</th>
                    <td>- 교환/반품/취소/환불 신청은 배송완료 후 7일 이내 가능합니다.(단, 일부 제품의 경우 신청이 제한될 수 있습니다.)<br>
                        - 환불승인 후 영업일 기준 3~7일 이내 환불 및 취소여부 확인 가능합니다.<br>
                        - 상품 불량인 경우는 배송비를 포함한 전액이 환불됩니다.<br>
                        - 상품가치가 훼손된 경우 반품/환불이 불가합니다. (제품포장 개봉 및 주문제작상품/밀봉포장상품 및 스티커부착 상품 / 식품 등)<br>
                        - 출고 이후 반품/환불 요청 시 상품 회수 후 처리됩니다.<br>
                        - 상품페이지에 교환/환불/AS에 대한 브랜드 개별기준이 있는 경우에는 해당 내용이 우선 적용 됩니다.<br>
                     </td>
                </tr>
            </table>
        </div>
    </div>
<script>
    $(function(){
    	<%if(loginUser != null){ %>
    	
    	var pno = $("#info_form").children().eq(0).val();
        $("#comment_btn2 button").click(function(){
        
        	location.href ="<%=context%>/review.st?pno="+pno;
        });
        $("#inquiry_btn2 button").click(function(){
        	location.href = "<%=context%>/inquiry.st?pno="+pno;
        });
        
        <%}else{%>
        $("#comment_btn2 button").click(function(){
   		 alert("로그인시 작성가능!!");
   	 	});
        
        $("#inquiry_btn2 button").click(function(){
        	alert("로그인시 작성가능!!");
        });
        <% }%>
        
        
        $("#comment_form tbody>tr").click(function(){
			//리뷰
        	// 클릭했을 때의 행에 존재하는 글번호
			var rno = $(this).children().eq(0).text();
			console.log(rno);
			location.href = "<%=context%>/reviewDetail.st?rno="+rno+"&pno=<%=p.getpNo()%>"; 
         });
        
        
        $("#inquiry_form tbody>tr").click(function(){
			//문의
        	// 클릭했을 때의 행에 존재하는 글번호
			var piNo = $(this).children().eq(0).text();
			console.log(piNo);
			location.href ="<%=context%>/inquiryDetail.st?piNo="+piNo+"&pno=<%=p.getpNo()%>"; 

         });
        $("#basket").click(function(){
			var userno =$("#info_form").children().eq(1).val();	
			var amount =$("#amount").val();
			<%if(loginUser!=null){%>
			$("#info_btn input:hidden").val("0");
			<%}else{%>
				alert("로그인후 이용해주세요");
				return false;
			<%}%>
			
			
         });
        $("#pay").click(function(){
        	<%if(loginUser!=null){%>
        		$("#info_btn input:hidden").val("1");
        		var ei = $("#info_btn input:hidden").val();
        		console.log(ei);
			<%}else{%>
				alert("로그인후 이용해주세요");
				return false;
				
			<%}%>
			
         });
        
    });
</script>

<%@ include file="../common/mainLower.jsp" %>
</body>
</html>