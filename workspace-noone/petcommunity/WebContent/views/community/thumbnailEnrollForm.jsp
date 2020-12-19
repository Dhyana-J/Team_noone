<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .outer{
      width: 700px;
      height: 700px;
      margin: auto;
      margin-top: 50px;
  }
  th{
      text-align: center;
  }
        
    </style>
    

</head>
<body>

	<%@ include file="../common/mainTop.jsp" %>
	
	 <div align="center" class="outer">

        <br>
        <h3 align="center">댕냥한컷 글쓰기</h3>
        <br>

        <form action="<%= context %>/thumbnailInsert.bo" id="enrollForm" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
            <table align="center" border="1px">
                <tr>
                    <th>제목 : </th>
                    <td><input type="text" name="title" required></td>
                </tr>
                <tr>
                    <th>내용 : </th>
                    <td colspan="2">
                        <textarea cols="50" rows="10" name="content" placeholder="내용을 입력하세요" required style="resize:none"></textarea>
                    </td>
                </tr>
                <tr>
                    <th>사진첨부</th>
                    <td align="center">
                        <img id="titleImg" name="photo" width="200px" height="170px ">
                    </td> 
                 
                </tr> 
            </table>
            <br><br>
            <div align="center">
            <button type="submit" class="btn btn-secondary btn-sm">등록하기</button>
            <button type="button" onclick="history.back();" class="btn btn-secondary btn-sm">뒤로가기</button>
        </div>
          
        <br>
        <div id="fileArea">
            <input type="file" name="file1" id="file1" onchange="loadImg(this, 1)" required>
        </div>

        <script>

            $(function(){
                $("#fileArea").hide();

                $("#titleImg").click(function(){
                    $("#file1").click();
                });
            });

            function loadImg(inputFile, num){

                if(inputFile.files.length == 1){
                  
                    var reader = new FileReader();

                    reader.readAsDataURL(inputFile.files[0]);

                    reader.onload = function(e){
                        switch(num){
                            case 1 : $("#titleImg").attr("src", e.target.result); break;
                            
                        }
                    }

                }else{ 
                    // 현재 선택된 file이 사라졌을 경우 => 미리보기 해제
                    switch(num){
                        case 1 : $("#titleImg").attr("src", null); break;
                       
                    }

                }

            }
            
        </script>

        <br>
        
       </form> 
    </div>
	






</body>
</html>



