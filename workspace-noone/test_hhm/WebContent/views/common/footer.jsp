<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
<style>
.footer {
  width: 100%;
  background: rgb(224, 224, 224);
  height: 150px;
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  align-items: center;
  position: relative;
  padding: 0;
}

.footer > div {
  font-family: sans-serif;
  color: black;
}

.footer > #copyright {
  font-size: 12px;
  text-align: right;
  margin-right: 20px;
}

.footer > #logo {
  margin-left: 100px;
  font-size: 40px;
  font-weight: bold;
}

.footer a{z-index:1;}
</style>
</head>

<body>

  <div class="footer">
  <a href="#" class="topBtn" title="위로 가기">🔼</a>
	  <div id="logo">PC</div>
	  <div id="copyright">
	      회사명 : (주)펫커뮤니티 | 대표 : 허현민 | 주소 : 서울특별시 강남구 테헤란로 14길 6<br>
	      사업자등록번호 : 123-45-67890 | 통신판매업 신고번호 : 2020-강남역삼Z-9999 | 개인정보책임자 : 이건<br>
	      Copyright2020.PetC.All rights reserved
	  </div>
  </div>
</body>
</html>