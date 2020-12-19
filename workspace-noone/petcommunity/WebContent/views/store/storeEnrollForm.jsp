<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .outer{
            margin: auto;
            margin-top: 50px;
            width: 900px;
            height: 900px;
        }
        #enrollForm {
           background: gray;
           width: 100%;
           height: 90%;
        }
        .outer *{
            box-sizing: border-box;
        }
        .tbody {
            width: 40%;
            height: 40%;
            float: left;
        }
        .tinput{
            width: 60%;
            height: 40%;
            float: left;
        }
        .tfoot{
           
            width: 98.3%;
            height: 40%;
        }
        .tbody *{
            margin-left: 30px;
            margin-top: 10px;
        }
        .tinput table{
            width: 80%;
            height: 100%;
            margin-left: 100px;
        }
		.tbody img{
            cursor: pointer;
        }

    </style>
    
</head>
<body>
	<%@ include file="../common/storeMenubar.jsp" %>
    <div class="outer">
        <br>
        <br>
        <form id="enrollForm" action="<%= context %>/insert.st" method="post" enctype="multipart/form-data">
            <div class="tbody">
                <img id="titleImg" width="140" height="140">
                <img id="contentImg1" width="140" height="140">
                <img id="contentImg2" width="140" height="140">
                <img id="contentImg3" width="140" height="140">
            </div>
            <div class="tinput">
                <table align="center">
                    <tr>
                        <th style="margin: 10px;">상품명 </th>
                        <td><input type="text" name="pName" style="width: 78%;"></td>
                    </tr>
                    <tr>
                        <th>가격</th>
                        <td><input type="text" name="price" style="width: 78%;"></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td>
                            <select name="pCategory" style="width: 78%;">
                                <option value="D">댕댕이</option>
                                <option value="C">냥냥이</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>재고</th>
                        <td><input type="number" name="pStock" style="width: 78%;"></td>
                    </tr>
                    
                </table>
            </div>
        

            <table class="tfoot" align="center">
                <tr>
                    <th>브랜드</th>
                    <td colspan="2"><input type="text" name="pBrand" style="width: 80%;"></td>
                    <th>모델명</th>
                    <td colspan="2"><input type="text" name="pModel" style="width: 80%;"></td>
                </tr>
                <tr>
                    <th>설명</th>
                    <td colspan="5"><textarea name="description" cols="30" rows="10" style="width: 91%; height: 90%; resize: none;"></textarea></td>
                </tr>
            </table>
            <script>
                $(function(){
                    $("#fileArea").hide();

                    $("#titleImg").click(function(){
                        $("#file1").click();
                    });
                    $("#contentImg1").click(function(){
                        $("#file2").click();
                    });
                    $("#contentImg2").click(function(){
                        $("#file3").click();
                    });
                    $("#contentImg3").click(function(){
                        $("#file4").click();
                    });
                });
                
                
                
                function loadImg(inputFile, number){
                    if(inputFile.files.length == 1){
                        var reader = new FileReader();
                        reader.readAsDataURL(inputFile.files[0]);
                        reader.onload = function(e){
                            switch(number){
                                case 1:
                                    $("#titleImg").attr("src", e.target.result);
                                    break;
                                case 2:
                                    $("#contentImg1").attr("src", e.target.result);
                                    break;
                                case 3:
                                    $("#contentImg2").attr("src", e.target.result);
                                    break;
                                case 4:
                                    $("#contentImg3").attr("src", e.target.result);
                                    break;
                            }
                        };
                    }else{
                        switch(number){
                                case 1:
                                    $("#titleImg").attr("src", null);
                                    break;
                                case 2:
                                    $("#contentImg1").attr("src", null);
                                    break;
                                case 3:
                                    $("#contentImg2").attr("src", e.null);
                                    break;
                                case 4:
                                    $("#contentImg3").attr("src", null);
                                    break;
                            }
                    };
                }
            </script>
            <div id="fileArea">
                <input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" required>
                <input type="file" name="file2" id="file2" onchange="loadImg(this, 2);">
                <input type="file" name="file3" id="file3" onchange="loadImg(this, 3);">
                <input type="file" name="file4" id="file4" onchange="loadImg(this, 4);">
            </div>
            <br>
            <div align="center">
                <button type="submit">등록하기</button>
                <button type="reset">취소하기</button>
            </div>
        </form>
    </div>
<%@ include file="../common/mainLower.jsp" %>
</body>
</html>