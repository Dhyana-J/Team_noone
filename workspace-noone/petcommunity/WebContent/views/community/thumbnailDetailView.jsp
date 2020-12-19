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
            width: 700px;
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
            width: 230x;
            height: 60px;
        }
        #comment_form>*{width:80%;}
        #form_input{height: 50%;}

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
        <h1 align="center"> 댕냥이들</h1>
        <br>

        <table id="detail-area" align="center" border="1">

            <tr >
                <th width="70">제목</th>
                <td colspan="5" width="300"><%= b.getBoardTitle() %></td>              
            </tr>
            <tr>
                <th>작성자</th>
                <td><%= b.getUserNo() %></td>
                <th>작성일</th>
                <td><%= b.getBoardDate() %></td>
                <th>추천 <%=b.getBoardRecom() %></th>
                
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="6">
                   <p style="height:50px;"><%= b.getBoardContent() %></p>
                </td>               
            </tr>
            <tr>
                <td>사진</td>
                <td colspan="4" align="center">
                        <img src="<%= context %>/<%= b.getBoardPhoto() %>"  width="300" height="300">
                </td>
            </tr>
        </table>
        <br>
        	<% if(loginUser != null && (loginUser.getUserId().equals( b.getUserNo()) || loginUser.getManager().equals("Y"))){ %>
            <!--작성자일 경우-->
	            <div align="center">
	                <a href="<%= context %>/thumbnailUpdateForm.bo?bno=<%= b.getBoardNo() %>" class= "btn btn-secondary btn-sm">수정</a>
	                <a href="<%= context %>/thumbnailDelete.bo?bno=<%= b.getBoardNo() %>" class= "btn btn-danger btn-sm">삭제</a>
	            </div>
            <% }else {  %>
            	<% if(loginUser != null) { %>
		            <!-- 작성자가 아닌 경우 -->
		            <div align="center">
		                <button id="scrap" class="btn btn-secondary btn-sm" >스크랩</button>
		                <button id="scrapDelete" class="btn btn-secondary btn-sm" >스크랩취소</button>
		                <button class= "btn btn-secondary btn-sm">추천하기</button>
		                <button class= "btn btn-danger btn-sm" data-toggle="modal" data-target="#reportForm">신고하기</button>
		            </div>
	            <% } %>
			<% } %>

            <br><br>

            <hr>
        

        <br><br>

       
        <div id="replyArea">
			<table border="1" align="center">
				<thead>
					<tr>
						<th>댓글작성</th>
						<% if(loginUser == null){ %>
						<td>
							<textarea cols="50" rows="2" style="resize:none" readonly>로그인후 이용가능한 서비스입니다.</textarea>
						</td>
						<td><button disabled>댓글등록</button></td>
						<% }else{ %>
						<!-- 로그인 후 -->
						<td>
							<textarea cols="50" rows="3" style="resize:none" id="replyContent"></textarea>
						</td>
						<td colspan="2"><button>댓글등록</button></td>
						<% }  %>
					</tr>
				</thead>
				<tbody>
					<tr>
                        <td>admin</td>
                        <td>완전 웃기닼ㅋㅋㅋㅋㅋ</td>
                        <td>2020-09-06</td>
                    </tr>
				</tbody>
			</table>
		</div>

		<script>
		$(function(){
			$("#scrap").click(function(){ // 스크랩 기능 
				
				$.ajax({
					url:"thscrap.bo",
					data:{
						bno:<%= b.getBoardNo()%>,
						userNo: <%=loginUser.getUserNo()%>
					},
					type:"post",
					success:function(result){
						//console.log("ajax 통신 성공");
						
						if(result == 'success'){
								
							// insertScrap();
						    alert(result);
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
					url:"thscrapDelete.bo",
					data:{
						bno:<%= b.getBoardNo()%>,
						userNo: <%=loginUser.getUserNo()%>
					},
					type:"post",
					success:function(result){
						console.log("ajax 통신 성공");
						
						if(result == 'success'){
								
							// insertScrap();
						    alert(result);
						}				
					},error:function(){
						console.log("ajax 통신 실패");
						
					}				
				});
				
			});
		})
		
		
		
		
		
		</script>



   
    <br><br>
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
              
                <form action="" method="POST">
                    <table>
                        <tr>
                            <th>제목</th>
                            <td><input type="" name="title" value="" required></td>
                        </tr>

                        <tr>
                            <th>신고분류</th>
                            <td>
 
                                    <input id="report1" type="radio" name="report" ><label for="report1"> 욕설/인신공격</label>
                                    <input id="report2" type="radio" name="report"><label for="report2">불법정보</label><br>
                                    <input id="report3" type="radio" name="report"><label for="report3">개인정보노출</label> 
                                    <input id="report4" type="radio" name="report"><label for="report4">영리목적/홍보성</label>                            
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td><textarea name="content"  rows="5" ; placeholder="기타의견을 작성해주세요"></textarea></td>
                        </tr>
                        <tr>
                            <th></th>
                            <td><p>> 허위신고일 경우, 신고자의 서비스 활동이 제한될 수 있으니유의하시어 신중하게 신고해주세요</p></td>
                        </tr>

                    </table>
                    <br>
                    <div align="center">
                        <button type="reset" class="btn btn-secondary btn-sm">초기화</button>
                        <button type="submit" class="btn btn-danger btn-sm">신고</button>
                    </div>
                </form>

            </div>
         
            
          </div>
        </div>
      </div>
    <%@ include file="../common/mainLower.jsp" %>
</body>
</html>