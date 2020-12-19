<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.MyOrder, com.kh.member.model.vo.PageInfo,java.util.ArrayList"%>
<%
	//주문내역 ArrayList 필요
	//userNo 기준으로 MyOrder 객체에 담은 주문정보를 리스트화시켜서 보여주자.
	
	//주문내역은 주문상태에따라 다르게 표시해야한다.
	// 상태 : (상품)배송준비중(B), 배송중(D), 배송완료(C), 교환/환불 진행중 
	// 주문 상태에 따라 버튼도 달라져야하고 표기되는 내용이 조금씩 바뀌어야한다.
	
	//뽑아와야하는 데이터들?
	//상품사진, 상품명, 상품이름, 상품가격, 주문날짜, 주문상태, 배송상태
	
	ArrayList<MyOrder> list = (ArrayList<MyOrder>)request.getAttribute("orderList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	String myOrderSort = (String)request.getAttribute("sortOption"); //정렬기능에 쓰일 변수
	System.out.println(myOrderSort);
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
<style>
/*myOrder.css*/
.wrapper {
  height: 200vh !important;
}

.myOrderWrap {
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}

.myOrderWrap > h1 {
  font-size: 60px;
  margin-top: 100px;
}

.myOrderWrap > h2 {
  margin-top: 70px;
  margin-bottom: 30px;
  font-size: 40px;
}

.myOrderWrap .emptyList {
  border: 2px solid black;
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 70%;
  height: 300px;
  align-self: center;
}

.myOrderWrap #emptySign {
  font-size: 100px;
  text-align: center;
}

.myOrderWrap #emptyMessage {
  font-size: 30px;
}

.myOrderWrap #emptySign,
.myOrderWrap #emptyMessage {
  align-self: center;
}

.myOrderWrap form {
  display: flex;
  flex-direction: column;
}

.myOrderWrap .orderList {
  display: flex;
  flex-direction: column;
  justify-content:flex-start;
  align-self: center;
  width: 70%;
  height: 50%;
}

.myOrderWrap #sortSelect {
  align-self: flex-end;
  margin-right:205px;
  width: 70px;
  height: 30px;
  font-size: 20px;
  margin-bottom: 20px;
}

.myOrderWrap #orderSortForm {
  height: 30px;
}

.myOrderWrap .order {
  align-self: center;
  border-top: 2px solid gray;
  border-bottom: 2px solid gray;
  width: 95%;
  height: 150px;
  margin:5px;
  display: flex;
}

.myOrderWrap .thumbnail {
  align-self: center;
  height: 130px;
  width: 200px;
  border: 1px solid gray;
}

.myOrderWrap .orderInfo {
  display: flex;
  justify-content: space-between;
  font-size: 20px;
  width: 60%;
  margin-left: 10px;
}

.myOrderWrap .orderInfo > table {
  align-self: center;
  width: 50%;
}

.myOrderWrap .order td {
  text-align: left;
}

.myOrderWrap .orderInfo tr:nth-child(3) > td {
  color: red;
}

.myOrderWrap .shipInfo {
  align-self: center;
  font-size: 20px;
  width: 40%;
  /* display: none; */
}

.myOrderWrap .orderBtn {
  width: 20%;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.myOrderWrap .orderBtn > button {
  font-size: 20px;
  border: none;
  margin: 5px;
}

.myOrderWrap .pageNum {
  margin-top: 30px;
  display: flex;
  justify-content: center;
  width: 50%;
  align-self: center;
}

.order img{
	width:100%;
	height:100%;
}
/*현재 보고있는 메뉴 색상 표시!*/
.sideBar .subMenu:nth-child(2) *{color:tomato;}
</style>
</head>
<body>

    <div class="wrapper">

      <%@include file="/views/common/menubar.jsp" %>

      <div class="main">

        
				        <%@include file="/views/member/myPage/sideBar.jsp" %>
				      
				      
				      
				        <div class="content">
				
							
					          <!-- 주문내역 없을 경우-->
					         <%if(list.size()==0){ %>
					         <div class="myOrderWrap">
					            <h1>주문내역조회</h1>
					            <h2>주문/배송 내역</h2>
					            <div class="emptyList">
					              <div id="emptySign">😁</div>
					              <div id="emptyMessage">주문내역이 없습니다.</div>
					            </div>
					          </div>--><!-- myOrderWrap -->
					          <%} else{%>
					          
					          <!-- 주문내역 있을 경우 -->
					          <div class='myOrderWrap'>
					            
						            <h1>주문내역조회</h1>
						            <h2>주문/배송 내역</h2>
						            

					              <select name="sortOption" id="sortSelect" onchange="setMyOrderSort();">
					              	<%if(myOrderSort.equals("newest")){ %>
						                <option value="newest" selected>최신순</option>
						                <option value="oldest">과거순</option>
					                <%}else{ %>
						                <option value="newest">최신순</option>
						                <option value="oldest" selected>과거순</option>
					                <%} %>
					              </select>

						            
						              <div class="orderList">
						                
				             	<%for(MyOrder o : list){ %>
				             	
						                <!-- 상품준비중 -->
					                <%if(o.getdStatus().equals("B")){ // 상품준비중인경우 %>
						                <div class="order">
			                                <div class="thumbnail">
			                                  	<img src="<%=contextPath%>/<%=o.getpThumbUrl() %>">
			                                </div>
			                                <div class="orderInfo">
			                                  <table>
			                                    <tr>
			                                      <td colspan="2"><%=o.getpName() %></td>
			                                    </tr>
			                                    <tr>
			                                      <td><%=o.getOrderNo() %></td>
			                                      <td><%=o.getPrice() %>원</td>
			                                      <td><%=o.getOrderDate() %></td>
			                                    </tr>
			                                    <tr>
			                                    <%if(o.getShoppingStatus().equals("R")){//주문취소인경우 %>
			                                      <td colspan="2">주문취소됨</td>
				                                <%}else{ %>
			                                      <td colspan="2" class="myOrderState">상품준비중</td>
				                                <%} %>	
			                                    </tr>
			                                  </table>
			                                </div>
			                                <div class="orderBtn">
			                                  <%if(o.getShoppingStatus().equals("R")){//주문취소인경우 %>
			                                  <button type="button" disabled>주문취소</button>
			                                  <%}else{ %>
			                                  <button type="button" onclick="cancelOrder(<%=o.getOrderNo()%>);" class="myOrderCancelBtn">주문취소</button>
			                                  <%} %>
			                                </div>
			                              </div>
		                              <%}%>
		                              <%if(o.getdStatus().equals("D")){ //배송중인경우 %>
			                              <!-- 배송중 -->
			                              <div class="order">
			                                <div class="thumbnail">
			                                 	 <img src="<%=contextPath%>/<%=o.getpThumbUrl() %>">
			                                </div>
			                                <div class="orderInfo">
			                                  <table>
			                                    <tr>
			                                      <td colspan="2"><%=o.getpName() %></td>
			                                    </tr>
			                                    <tr>
                             			          <td><%=o.getOrderNo() %></td>
			                                      <td><%=o.getPrice() %>원</td>
			                                      <td><%=o.getOrderDate() %></td>
			                                    </tr>
			                                    <tr>
			                                      <td colspan="2">배송중</td>
			                                    </tr>
			                                  </table>
			                                  <div class="shipInfo">
			                                    <table>
			                                      <tr>
			                                        <td>택배사 : <%=o.getdCompany() %></td>
			                                      </tr>
			                                      <tr>
			                                        <td>운송장번호 : <%=o.getdNum() %></td>
			                                      </tr>
			                                    </table>
			                                  </div>
			                                </div>
			                                <div class="orderBtn">
			                                  <button type="button">배송조회</button>
			                                </div>
			                              </div>
			                              <%} %>
			                              <%if(o.getdStatus().equals("C")){ //배송완료인경우 %>
			                              <!-- 배송완료 -->
			                              <div class="order">
			                                <div class="thumbnail">
			                                  	<img src="<%=contextPath%>/<%=o.getpThumbUrl() %>">
			                                </div>
			                                <div class="orderInfo">
			                                  <table>
			                                    <tr>
			                                      <td colspan="2"><%=o.getpName() %></td>
			                                    </tr>
			                                    <tr>
			                                      <td><%=o.getOrderNo() %></td>
			                                      <td><%=o.getPrice() %>원</td>
			                                      <td><%=o.getOrderDate() %></td>
			                                    </tr>
			                                    <tr>
			                                      <td colspan="2">배송완료</td>
			                                    </tr>
			                                  </table>
			                                </div>
			                                <div class="orderBtn">
			                                  <button type="button" onclick="location.href=<%=contextPath%>/review.st?pno=<%=o.getpNo()%>">리뷰작성</button>
			                                  <button type="button">교환/환불</button>
			                                </div>
			                              </div><!--order-->
			                              <%} %>

			                              
	                              <%} %><!--list에 대한 for문 끝 -->
			                              
			                             
						                
						              </div><!--orderList-->
						              
						              <div class="pageNum">
						                <ul class="pagination">
						                	<!-- javascript myOrderSubmit 함수는 sideBar.jsp 내부에 기술되어있음-->
							                <% if(pi.getCurrentPage() != 1){ %>
						            		  <li class="page-item"><a class="page-link" href="javascript:" onclick="myOrderSubmit(<%=loginUser.getUserNo()%>,<%=pi.getCurrentPage()-1%>,'<%=myOrderSort%>','.pageNum');">Previous</a></li>
											<% } %>
											<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
						            		  <li class="page-item" id="pNum"><a class="page-link" href="javascript:" onclick="myOrderSubmit(<%=loginUser.getUserNo()%>,<%=p%>,'<%=myOrderSort%>','.pageNum');"><%=p%></a></li>
								            <% } %>
											<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
						            		  <li class="page-item"><a class="page-link" href="javascript:" onclick="myOrderSubmit(<%=loginUser.getUserNo()%>,<%=pi.getCurrentPage()+1%>,'<%=myOrderSort%>','.pageNum');">Next</a></li>
											<% } %>
						                </ul>
						              </div>
				              		<%} %><!-- 주문내역 있을 경우(else)의 끝. -->
				              </div><!-- myOrderWrap -->
				    			
			        	</div><!-- content -->
				

      </div><!-- main -->

      <div class="footer">
		<%@include file="/views/common/footer.jsp" %>
      </div>

    </div>
    
<script>

	//현재 보고있는 페이지 숫자 칠해주는 자바스크립트
	let item = document.querySelectorAll("#pNum"); //숫자를 가진 페이징바의 모든 요소 가져온다.
	
	item.forEach(function(element){ //각각의 요소들에 대해
		if(element.innerText==<%=pi.getCurrentPage()%>){//현재페이지와 같은 숫자를 가지고있으면
			element.setAttribute('class','page-item active'); //모달 class인 active를 추가해주자.
		}
	})
	
	
	
	//주문취소 메소드
	function cancelOrder(orderNo){ //매개변수로 주문번호 받아온다
		
		if(confirm('정말 주문취소하시겠습니까?')){ //confirm 확인클릭 시 실행될 내용
			$(function(){
				console.log(orderNo);
				//주문취소버튼 사라지고 "주문취소됨 변경", 상품준비중->"주문취소"로 변경
				//SHOPPING 테이블의 SHOPPING_STATUS = 'R'로 바꿔야함
				//이 과정에서 주문번호 넘겨줘야
				$.ajax({
					url:"<%=contextPath%>/cancelOrder.me",
					type:"post",
					data:{
							orderNo:orderNo
						},
					success:function(result){
						if(result==='success'){
							location.reload();
						}else{
							alert('주문취소실패');
						}
					},
					error:function(){
						console.log('ajax통신 실패');
					}
				})
			});
		}
	}

		
	
	function setMyOrderSort(){
		$(function(){
			let sortOption = $('.myOrderWrap #sortSelect').val();
				console.log(sortOption);
			if(sortOption=='newest'){
				myOrderSubmit(<%=loginUser.getUserNo()%>,1,'newest','#menuContent .myOrderMenu');
			}else{
				console.log(sortOption);
				myOrderSubmit(<%=loginUser.getUserNo()%>,1,'oldest','#menuContent .myOrderMenu');
			}
		});
	};


</script>
</body>
</html>