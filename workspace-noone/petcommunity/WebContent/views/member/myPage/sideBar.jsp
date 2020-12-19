<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<%
	Member myPageLoginUser = (Member)session.getAttribute("loginUser");
%>
<!-------- 마이페이지 전용 사이드바 ------------>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#myBoard,#myScrap{display:none;}
</style>
</head>
<body>
		<div class="sideBar">
        
     	    <h2>마이페이지</h2>
	        <div id="menuContent">
	            <!-- 자바스크립트로 > 부분 클릭하면 <로 바뀔 수 있도록 만들어야함 -->
	            <div class="subMenu">
	                <a href="<%=request.getContextPath()%>/myPage.me">내정보조회 </a>
	            </div>
	            <div class="subMenu myOrderMenu">
	              <a href="javascript:" onclick="myOrderSubmit(<%=myPageLoginUser.getUserNo()%>,1,'newest','#menuContent .myOrderMenu');">주문내역조회</a>
	            </div>
	            <div class="subMenu myReviewMenu MyQnaMenu">
	              <a href="<%=request.getContextPath()%>/myArticle.me">게시글관리</a>
	            </div>
	            	<div class="subMenuList" id="myBoard">
	                    <ul>
	                        <li><a href="<%=request.getContextPath()%>/myArticle.me">내가 쓴 글</a></li>
	                        <li><a href="javascript:" onclick="myQnaSubmit(<%=myPageLoginUser.getUserNo()%>,1,'newest','#menuContent .MyQnaMenu');">내 1:1문의글</a></li>
	                        <li><a href="javascript:" onclick="myReviewSubmit(<%=myPageLoginUser.getUserNo()%>,1,'newest','#menuContent .myReviewMenu');">내 리뷰</a></li>
	                    </ul>
                	</div>
	            <div class="subMenu">
	              <a href="<%=request.getContextPath()%>/myScrap.me">즐겨찾기 </a>
	            </div>
       	            <div class="subMenuList" id="myScrap">
	                    <ul>
	                        <li><a href="<%=request.getContextPath()%>/myScrap.me">스크랩 게시글</a></li>
	                        <li><a href="<%=request.getContextPath()%>/myWish.me">찜한상품</a></li>
	                    </ul>
               		</div>

	        </div>
        </div><!-- sideBar -->
<script>
	
	//자바스크립트로 form태그 생성 후 제출해주는 method
	function myOrderSubmit(userNo, currentPage, sortOption,where){
		//where은 form태그를 dom의 어느 위치에 넣어줄 것인지 지정하는 매개변수
		let form = document.createElement("form");
		form.setAttribute("charset","UTF-8"); //전달값 인코딩 설정
		form.setAttribute("method","post"); //post방식으로 전달하겠다.
		form.setAttribute("action","<%=request.getContextPath()%>/myOrder.me"); //action 설정
		
		let input1 = document.createElement("input"); //userNo 전달할 input태그 생성
		let input2 = document.createElement("input"); //currentPage 전달할 input태그 생성
		let input3 = document.createElement("input"); //sortOption 전달할 input태그 생성
		
		//input태그 속성 지정해주기
		input1.setAttribute("type","hidden");
		input1.setAttribute("name","userNo");
		input1.setAttribute("value",userNo);
		input2.setAttribute("type","hidden");
		input2.setAttribute("name","currentPage");
		input2.setAttribute("value",currentPage);
		input3.setAttribute("type","hidden");
		input3.setAttribute("name","sortOption");
		input3.setAttribute("value",sortOption);
		
		//설정해둔 두 input태그를 위의 form태그 안에 넣어주기
		form.appendChild(input1);
		form.appendChild(input2);
		form.appendChild(input3);
		
		let myOrder = document.querySelector(where);//form태그를 넣어줄 위치값을 담을 변수
		myOrder.appendChild(form); //위에서 만든 최종 form태그를 myOrder에 지정시킨 위치에 넣어주자.
		form.submit(); //제출!
	}
	
	//자바스크립트로 form태그 생성 후 제출해주는 method
	function myReviewSubmit(userNo, currentPage, sortOption,where){
		//where은 form태그를 dom의 어느 위치에 넣어줄 것인지 지정하는 매개변수
		let form = document.createElement("form");
		form.setAttribute("charset","UTF-8"); //전달값 인코딩 설정
		form.setAttribute("method","post"); //post방식으로 전달하겠다.
		form.setAttribute("action","<%=request.getContextPath()%>/myReview.me"); //action 설정
		
		let input1 = document.createElement("input"); //userNo 전달할 input태그 생성
		let input2 = document.createElement("input"); //currentPage 전달할 input태그 생성
		let input3 = document.createElement("input"); //sortOption 전달할 input태그 생성
		
		//input태그 속성 지정해주기
		input1.setAttribute("type","hidden");
		input1.setAttribute("name","userNo");
		input1.setAttribute("value",userNo);
		input2.setAttribute("type","hidden");
		input2.setAttribute("name","currentPage");
		input2.setAttribute("value",currentPage);
		input3.setAttribute("type","hidden");
		input3.setAttribute("name","sortOption");
		input3.setAttribute("value",sortOption);
		
		//설정해둔 두 input태그를 위의 form태그 안에 넣어주기
		form.appendChild(input1);
		form.appendChild(input2);
		form.appendChild(input3);
		
		let myReview = document.querySelector(where);//form태그를 넣어줄 위치값을 담을 변수
		myReview.appendChild(form); //위에서 만든 최종 form태그를 myReview에 지정시킨 위치에 넣어주자.
		form.submit(); //제출!
	}
	
	//자바스크립트로 form태그 생성 후 제출해주는 method
	function myQnaSubmit(userNo, currentPage, sortOption,where){
		//where은 form태그를 dom의 어느 위치에 넣어줄 것인지 지정하는 매개변수
		let form = document.createElement("form");
		form.setAttribute("charset","UTF-8"); //전달값 인코딩 설정
		form.setAttribute("method","post"); //post방식으로 전달하겠다.
		form.setAttribute("action","<%=request.getContextPath()%>/myQna.me"); //action 설정
		
		let input1 = document.createElement("input"); //userNo 전달할 input태그 생성
		let input2 = document.createElement("input"); //currentPage 전달할 input태그 생성
		let input3 = document.createElement("input"); //sortOption 전달할 input태그 생성
		
		//input태그 속성 지정해주기
		input1.setAttribute("type","hidden");
		input1.setAttribute("name","userNo");
		input1.setAttribute("value",userNo);
		input2.setAttribute("type","hidden");
		input2.setAttribute("name","currentPage");
		input2.setAttribute("value",currentPage);
		input3.setAttribute("type","hidden");
		input3.setAttribute("name","sortOption");
		input3.setAttribute("value",sortOption);
		
		//설정해둔 두 input태그를 위의 form태그 안에 넣어주기
		form.appendChild(input1);
		form.appendChild(input2);
		form.appendChild(input3);
		
		let myQna = document.querySelector(where);//form태그를 넣어줄 위치값을 담을 변수
		myQna.appendChild(form); //위에서 만든 최종 form태그를 myReview에 지정시킨 위치에 넣어주자.
		form.submit(); //제출!
	}
	
</script>
</body>
</html>