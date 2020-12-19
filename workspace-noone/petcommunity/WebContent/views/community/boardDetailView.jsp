<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.community.model.vo.Board"%>
    
<%
	Board b = (Board)request.getAttribute("b");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer{
       width: 750px;
       height: 600px;
       margin: auto;
       margin-top: 50px;
           
       }
       .outer table{
           width: 70%;
       }

       /*댓글폼*/
       div,form{
         margin: auto;
       box-sizing: border-box;
       }

       #comment_form{
           width: 250px;
           height: 70px;
       }
       #comment_form>*{width: 100%;}
       #form_input{height: 80%;}

       #form_input>*{
           height: 100%;
           float: left;
       }
       #textarea_input{width: 65%;}
       #btn{width: 35%;}

       #textarea_input>textarea{
           width: 100%;
           height: 100%; 
           box-sizing: border-box;
       }
       #btn>input{
           width: 100%;
           height: 100%;
       }
       hr{
           width:12cm;
       }
       tr{text-align: center;}
       
       .left_menu>li{
               list-style: none;
               height: 30px;
               font-weight: bold;
               margin-left: 20px;
               font-size: 15px;
           }
           .left_menu{
               background: rgb(255, 235, 205);
               width: 150px;
               height: 1000px;
               float:left;
           }
            .left_menu>li:hover{
               text-decoration: none;
               color: black;
               cursor: pointer;
           }
           .left_menu>li a{
               text-decoration: none;
               color: black;
           }
           .left_menu ul{
               margin: 0px;
               margin-bottom: 8px;
               color:gray;
               display: none;
           }
           .left_menu ul a{
               text-decoration: none;
               color:gray;
           }

</style>
</head>
<body>

	<%@ include file="../common/mainTop.jsp" %>
	 <div class="left_menu" align="left">
            <h2>커뮤니티 community</h2><br>
            <li><a href="<%= context%>/thumbnailList.bo?currentPage=1">댕냥한컷</a></li>
            <li><a href="<%= context %>/communityList.bo?currentPage=1">자유이야기</a></li>
        
        </div>
	
	<div class="outer">
        <br>
        <h1 align="center">자유이야기 상세페이지</h1>
        <br>

        <table id="detail-area" align="center" border="1">
			<thead>
	            <tr >
	                <th width="70">제목</th>
	                <td colspan="5" width="300"><%= b.getBoardTitle() %></td>              
	            </tr>
            </thead>
            <tbody>
	            <tr >
	                <th>작성자</th>
	                <td><%= b.getUserNo() %></td>
	                <th>작성일</th>
	                <td><%= b.getBoardDate() %></td>
	                <th id="recom">추천 <%= b.getBoardRecom() %></th>
	            </tr>
            </tbody>    
            <tr >
                <th>내용</th>
                <td colspan="5">
                   <p style="height:150px;"><%= b.getBoardContent() %></p>
                </td>               
            </tr>
        </table>
        <br>
            <% if(loginUser != null && (loginUser.getUserId().equals( b.getUserNo()) || loginUser.getManager().equals("Y") )) {%>
            <div align="center">
            	 <a href="<%= context %>/communityList.bo?currentPage=1" class= "btn btn-primary btn-sm">목록가기</a>	
                <a href="<%= context %>/boardUpdateForm.bo?bno=<%= b.getBoardNo() %>" class= "btn btn-secondary btn-sm">수정</a>
                <a href="<%= context%>/boardDelete.no?bno=<%= b.getBoardNo() %>" class= "btn btn-danger btn-sm">삭제</a>
            </div>
            
            <% }else{ %>
            	<% if(loginUser != null){ %>
	            <!-- 작성자가 아닌 경우 -->
	            <div align="center" id="likeForm">
	                <button id="scrap" class= "btn btn-secondary btn-sm">스크랩</button>
	                <button id="scrapDelete" class= "btn btn-secondary btn-sm">스크랩취소</button>
	                <button class= "btn btn-secondary btn-sm">추천하기</button>
	                <button class= "btn btn-danger btn-sm" data-toggle="modal" data-target="#reportForm"  data-num="<%=b.getBoardNo()%>" data-no="<%=b.getUserNo() %>">신고하기</button>
	            </div>
	            <% }  %>
			<%} %>

            <br><br>

            <hr>
      

        <br><br>

        <div id="replyArea">
			<table border="1" align="center">
				<thead>
					<tr>
						<th>댓글작성</th>
						<% if(loginUser == null ){ //로그인 전  %>
						<td>
							<textarea cols="50" rows="2" style="resize:none" readonly>로그인후 이용가능한 서비스입니다.</textarea>
						</td>
						<td><button disabled>댓글등록</button></td>
						<% }else{ %>
							<td>
								<input type="hidden" value="<%= loginUser.getUserNo() %>" id="userNo">
								<textarea cols="50" rows="3" style="resize:none" id="commentContent"></textarea>
							</td>
							<td colspan="2"><button onclick="addComment();">댓글등록</button></td>
						<% }  %>
					</tr>
				</thead>
				<tbody>
					  
				</tbody>
			</table>
		</div>
		
		<script>
		
			$(function(){
				selectCommentList();
			})
		
		$(function(){
			$("#scrap").click(function(){ // 스크랩 기능 
				
				$.ajax({
					url:"bscrap.bo",
					data:{
						bno:<%= b.getBoardNo()%>,
						userNo: <%=loginUser.getUserNo()%>
					},
					type:"post",
					success:function(result){
						//console.log("ajax 통신 성공");
						
						if(result == 'success'){
								
							// insertScrap();
						    alert( "스크랩 되었습니다.");
						}				
					},error:function(){
						console.log("ajax 통신 실패");
						
					}				
				});
				
				
			});
		})
			
		$(function(){
			$("#scrapDelete").click(function(){ // 스크랩취소기능
				
				$.ajax({
					url:"bscrapDelete.bo",
					data:{
						bno:<%= b.getBoardNo()%>,
						userNo: <%=loginUser.getUserNo()%>
					},
					type:"post",
					success:function(result){
						console.log("ajax 통신 성공");
						
						if(result == 'success'){
								
							// insertScrap();
						    alert("스크랩 취소되었습니다.");
						}				
					},error:function(){
						console.log("ajax 통신 실패");
						
					}				
				});
				
			});
		})	
		
		
		
	
			
			function addComment(){ // 댓글 등록용 ajax 
				$.ajax({
					url:"rinsert.bo",
					type: "get",
					data:{
						content:$("#commentContent").val(), 
						bno:<%= b.getBoardNo()%>,
						userNo:$("#userNo").val()
					},
					success:function(result){
						console.log(result);
						
						if(result == 'success'){
													
							selectCommentList();

							$("#commentContent").val("");
						}
						
						
					},error:function(){
						console.log("댓글 작성용 ajax 통신 실패")
					}
				});
			}
			

			function selectCommentList(){ // 댓글 리스트 조회용 ajax
				$.ajax({
					url:"rlist.bo",
					data:{bno:<%= b.getBoardNo()%>}, // 현재 내가 보고있는 게시물 번호를 무조건 넘겨줘야함 !!!
					success:function(list){
					
						
						var str ="";
						//for(var i=0; i<list.length; i++){
						for(var i in list){
							str += 	"<tr>" +
										"<td>" + list[i].userNo + "</td>" +
										"<td>" + list[i].commentContent +  "</td>" +
										"<td>" + list[i].commentDate  + "</td>" + "<td>" + 
										"<button type='button'>수정</button>" +
										"<button type='button' id='deleteCom'>삭제</button>" +
									"</tr>";
						
						}
						
						$("#replyArea tbody").html(str);
						
						//test ------------------------
						$("#deleteCom").click(function(){ // 댓글삭제
							console.log("댓글삭제");
							$.ajax({
								url:"deletecom.bo",
								data:{
									bno:<%= b.getBoardNo()%>,
									userNo:<%=loginUser.getUserNo()%>
								},
								type:"post",
								success:function(result){
									console.log("ajax 통신 성공");
									
									if(result == 'success'){
											
										// insertScrap();
									    alert("댓글삭제되었습니다.");
									    location.reload();
									}				
								},error:function(){
									console.log("ajax 통신 실패");
									
								}				
							});
							
						});
						
						
					},error:function(){
						console.log("댓글 리스트 조회용 ajax 통신 실패");
					}
				});
			}
			
			
			
			$(function(){
				$("#deleteCom").click(function(){ // 댓글삭제
					console.log("댓글삭제");
					$.ajax({
						url:"deletecom.bo",
						data:{
							bno:<%= b.getBoardNo()%>,
							userNo:<%=loginUser.getUserNo()%>
						},
						type:"post",
						success:function(result){
							console.log("ajax 통신 성공");
							
							if(result == 'success'){
									
								// insertScrap();
							    alert("댓글삭제되었습니다.");
							}				
						},error:function(){
							console.log("ajax 통신 실패");
							
						}				
					});
					
				});
			})		
				

				
		</script>




        <br>
    </div>
    <div class="modal" id="reportForm">
        <div class="modal-dialog">
          <div class="modal-content">
          
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">신고 하기</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
             
            <!-- Modal body -->
            <div class="modal-body" align="center">
              
              <form id="form1" action="" method="POST">
              <h4>신고사유</h4>
	          <select id="call_reason" name="call_reason" style="width: 200px;">
	            <option value="1">욕설</option>
	            <option value="2">중복</option>
	            <option value="3">광고</option>
	            <option value="4">기타</option>
	          </select>
	          <br><br>
	          <h4>상세사유</h4>
	          <textarea name="call_reason_detail" id="call_reason_detail" cols="30" rows="10" style="width: 400px; height: 100; resize: none;"></textarea>
	
	        </form>
	        
	        </div>
	          <!-- Modal footer -->
		        <div class="modal-footer">
		          <button id="call" type="button" class="btn btn-primary" data-dismiss="modal">제출하기</button>
		          <button type="button" class="btn btn-danger" data-dismiss="modal">취소하기</button>
		        </div>
            </div>
         
          </div>
        </div>

	
	
<%@ include file="../common/mainLower.jsp" %>

</body>
</html>