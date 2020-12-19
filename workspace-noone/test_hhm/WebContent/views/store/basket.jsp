<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        #basket_Form{
            padding:30px;
            width:800px;
            margin: auto;
            margin-top:50px;
            background: white;

        }
        #basket_Form>h1{
            color: black;

        }
        #area1{
            margin-top: 30px;
            width:100%; 
            background: tomato;
        }
        #area2{
            border: 2px solid rgb(224, 224, 224);
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 100%;
            height: 300px;
            align-self: center;
        }
        #basket_empty{
            margin: auto;
        }

        #basket{
            margin: 0px;
            padding: 0px;
            width:70%;
            float:left;
        }
        #basket>form{
            width:100%;

           
        }
        #basket_table{
            /* background: brown; */
            border-collapse: collapse;
            width: 95%;
            color: black;
            border-top: 1px solid rgb(224, 224, 224);
            border-bottom: 1px solid rgb(224, 224, 224);

        }
        #basket_btn{
            padding:10px;
            /* background: blueviolet; */
        }
        .basket_img{
            padding:10px;
            width: 130px;
            height: 120px;
            /* border: 1px solid black; */
        }
        #pay{
            margin: 0;
            padding: 0;
            width:30%;
            height:80%;
            float:left;
            /* background: yellow; */
        }
        #pay_content{
            box-sizing: border-box;
            border:1px solid rgb(224, 224, 224);
            border-radius: 2mm;
            height:100%; 
            padding:10px 15px;
            margin-bottom: 10px;

        }
        
        #pay_table{
            width: 100%;
            /* background: yellow; */
            height:100%;
        }
        #pay_table div{
            float: left;
            width:50%;
        }

        #pay_content th{
            text-align: left;
            font-weight: bolder;
            color: black;
             
        }
        #pay_content td{
            text-align: right;
            color: black;
        }
        #basket_Form button{
            border: none;
        }

       

    </style>
</head>
<body>
<%@ include file="../common/storeMenubar.jsp" %>

    <div id="basket_Form">
        <h1 align="center">장바구니</h1>
        <div id="area1" >
            <!-- 장바구니에 상품 있을 경우 -->
            <div id= "basket">
                <form  action="" method="post"> 
                    <table id="basket_table">
                        <tr> 
                            <td width="20px"><input type="checkbox"></td>
                            <td width="150px"><div class="basket_img"><img src="../shopping/강아지.jpg" width="130px" height="100px"></div></td>
                            <td>
                                <div style="font-size: 16px; font-weight: bold;">강아지간식이에요.<!--상품명--></div>
                                <div style="font-size: 13px;">구매수량 :&nbsp;&nbsp;2개<!--구매수량--></div>
                                <div style="font-size: 13px;">상품가격 :&nbsp;&nbsp;1000원 <!--상품가격--></div>
                            </td>
                        </tr>
                        
                        
                                
                    </table>
                    <div id="basket_btn">
                        <input type="checkbox"> 전체선택
                        <button type="submit">선택 상품 주문하기</button>
                        <button type="submit">선택삭제</button>
                    </div>
                </form>
            </div>
            <div id="pay" align="center">
                <div id="pay_content">
                    <table id="pay_table">
                        <tr>
                            <th style="font-size:16px;" colspan="2">총 상품금액</th>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <div>
                                    <p align="left">상품가격</p>
                                </div>
                                <div>
                                    <p align="right">6000원</p>
                                    <p align="right">6000원</p>
                                    <p align="right">6000원</p>
                                    
                                </div>
                                
                            </td>
                        </tr>
                        
                        
                        <tr>
                            <th>최종결제 금액</th>
                            <td>120,,000</td>
                        </tr>

                    </table>
                    
                </div>
                <button type="button">전체주문하기</button>
            </div> 
            
            
            <!-- 장바구니가 비어있을 경우 -->
            <!--    
            <div id="area2">
                <div id="basket_empty">장바구니가 비어있습니다.</div> 
            </div> -->

        </div>
    </div>
    <%@ include file="../common/mainLower.jsp" %>
</body>
</html>