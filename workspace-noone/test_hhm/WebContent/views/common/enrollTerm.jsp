<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
<style>

.content{margin-left:220px;}

.wrapper {
  height: 150vh !important;
}

.enrollTerm {
  display: flex;
  flex-direction: column;
  align-items: center;
  height: 100%;
}

.enrollTerm > h1 {
  margin-top: 100px;
  font-size: 50px;
  margin-bottom: 30px;
}

.terms {
  display: flex;
  flex-direction: column;
  width: 70%;
}

.checkWrap {
  display: flex;
  align-items: center;
  font-size: 20px;
}

.fill {
  width: 30%;
}

#see1 {
  margin-left: 250px;
}
#see2 {
  margin-left: 197px;
}

button {
  width: 400px;
  height: 50px;
}

.termDetail {
  /*이용약관 상세전용*/
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 200px;
  margin-right:50px;
}

.termDetail > textarea {
  text-align: left;
  border: 1px solid gray;
  width: 320px;
  height: 200px;
  resize: none;
}

#btnWrap {
  height: 100px;
}

#btnWrap button {
  margin-top: 30px;
}

.checkWrap span {
  color: gray;
}

.checkWrap span:hover {
  cursor: pointer;
  color: black;
  font-weight:bold;
}

.termDetail {
  display: none;
}

</style>
</head>
<body>

    <div class="wrapper">

      <%@include file="/views/common/menubar.jsp" %>

      <div class="main">

        
		      
      
		        <div class='content'>
		        
		        
          <div class="enrollTerm">
            <h1>약관 동의</h1>
            <div class="terms">
              <form action="<%=ctxPath%>/enroll.me" method="post">
                <div class="checkWrap">
                  <div class="fill"></div>
                  <input type="checkbox" id="checkAll"> &nbsp;&nbsp;전체 동의
                </div>

                <div class="checkWrap">
                  <div class="fill"></div>
                  <input type="checkbox" name="terms" value="termAgree" required> &nbsp;&nbsp;이용약관
                  <span id="see1">보기</span>
                </div>
                <div class="termDetail term1">
                  <textarea cols="30" rows="10" readonly>
하나에 별 별들을 계십니다. 덮어 가난한 둘 멀듯이, 다하지 북간도에 많은 있습니다. 
이제 언덕 아침이 이름을 이름과, 별을 강아지, 한 봅니다. 
흙으로 아침이 슬퍼하는 하나의 하나에 그리고 둘 가을로 겨울이 까닭입니다. 쓸쓸함과 무덤 이름자 이름자를 가슴속에 내 별 나의 위에 버리었습니다. 위에 나는 프랑시스 이 너무나 피어나듯이 아이들의 사랑과 소학교 봅니다. 
슬퍼하는 덮어 이름자 하나에 자랑처럼 오는 노새, 부끄러운 거외다. 하나에 나는 책상을 어머니, 남은 거외다. 못 오는 같이 계십니다. 가을 나는 둘 패, 않은 언덕 북간도에 하나에 계십니다.
북간도에 노루, 계절이 책상을 아이들의 새워 별 위에 내린 봅니다. 별들을 이름자를 나의 별이 자랑처럼 별 까닭입니다. 하나의 이름과 겨울이 가을 하나에 묻힌 추억과 부끄러운 것은 있습니다. 어머님, 마디씩 강아지, 잔디가 옥 마리아 계집애들의 버리었습니다. 무덤 피어나듯이 릴케 거외다. 나는 속의 잔디가 버리었습니다. 별 당신은 시인의 소녀들의 별 버리었습니다. 된 마디씩 이름과, 그리워 거외다. 말 이름과, 노새, 이름과, 이네들은 벌써 강아지, 다 하나에 계십니다. 오는 강아지, 잠, 계절이 청춘이 그러나 내린 봅니다.
                  </textarea>
              </div>

                <div class="checkWrap">
                  <div class="fill"></div>
                  <input type="checkbox" name="terms" value="dataAgree" required> &nbsp;&nbsp;개인정보 처리방침
                  <span id="see2">보기</span>
                </div>
                <div class="termDetail term2">
                    <textarea cols="30" rows="10" readonly>
하나에 별 별들을 계십니다. 덮어 가난한 둘 멀듯이, 다하지 북간도에 많은 있습니다. 
이제 언덕 아침이 이름을 이름과, 별을 강아지, 한 봅니다. 
흙으로 아침이 슬퍼하는 하나의 하나에 그리고 둘 가을로 겨울이 까닭입니다. 쓸쓸함과 무덤 이름자 이름자를 가슴속에 내 별 나의 위에 버리었습니다. 위에 나는 프랑시스 이 너무나 피어나듯이 아이들의 사랑과 소학교 봅니다. 
슬퍼하는 덮어 이름자 하나에 자랑처럼 오는 노새, 부끄러운 거외다. 하나에 나는 책상을 어머니, 남은 거외다. 못 오는 같이 계십니다. 가을 나는 둘 패, 않은 언덕 북간도에 하나에 계십니다.
북간도에 노루, 계절이 책상을 아이들의 새워 별 위에 내린 봅니다. 별들을 이름자를 나의 별이 자랑처럼 별 까닭입니다. 하나의 이름과 겨울이 가을 하나에 묻힌 추억과 부끄러운 것은 있습니다. 어머님, 마디씩 강아지, 잔디가 옥 마리아 계집애들의 버리었습니다. 무덤 피어나듯이 릴케 거외다. 나는 속의 잔디가 버리었습니다. 별 당신은 시인의 소녀들의 별 버리었습니다. 된 마디씩 이름과, 그리워 거외다. 말 이름과, 노새, 이름과, 이네들은 벌써 강아지, 다 하나에 계십니다. 오는 강아지, 잠, 계절이 청춘이 그러나 내린 봅니다.
                    </textarea>
                </div>

                <div class="checkWrap">
                  <div class="fill"></div>
                  <input type="checkbox" name="terms" value="over14" required> &nbsp;&nbsp;만 14세 이상입니다.
                </div>

                <div class="checkWrap">
                  <div class="fill"></div>
                  <input type="checkbox" name="terms"> &nbsp;&nbsp;이벤트,프로모션 알림 및 메일수신(선택)
                </div>

                <div id="btnWrap">
                  <button type="submit" class="btn btn-secondary">다음 단계</button>
                </div>
              </form>
            </div>
          </div><!--enrollTerm-->
		          
		    
		    
		        </div><!-- content -->


      </div><!-- main -->

      <div class="footer">
		<%@include file="/views/common/footer.jsp" %>
      </div>

    </div><!-- wrapper -->

<script>

$(function(){

	   //클릭하면 약관상세 보여지거나 숨겨짐
	   $('#see1').click(function(){
	     $('.term1').toggle();
	   })
	   $('#see2').click(function(){
	     $('.term2').toggle();
	   })

	   //클릭하면 전체동의선택됨
	   $('#checkAll').click(function(){
	     if($('#checkAll').prop('checked')){ //체크박스 체크되어있다면
	      $('input[name=terms]').prop("checked",true); //전부 체크
	     }else{
	      $('input[name=terms]').prop("checked",false); //전부 체크 해제
	     }
	   })
	 })
</script>
</body>
</html>