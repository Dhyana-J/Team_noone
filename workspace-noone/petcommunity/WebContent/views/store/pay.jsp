<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
    #payForm{
        margin: auto;
        margin-top:50px;
        width:800px;
        padding: 15px;
        background: white;
    }
       
    #payForm>h1{
        color: black;
    }

    .area0>div{
        float:left;
    } 

    .area1{
        padding:0px;
        /* background: pink; */
        width:60%;

    }
    #title0{
        margin-top: 20px;
        color:black;
        font-size: 20px;
        font-weight: bolder;
        /* background: brown; */
        padding: 2%
    }
    #title1{
        margin:20px 0px;
        color:black;
        font-size: 20px;
        font-weight: bolder;
        /* background: brown; */
        border-bottom: 1px solid rgb(224, 224, 224);
        padding: 2%
    }
    #product_info{
        margin:0 10px;
        padding: 2%;
        border-top: 1px solid rgb(224, 224, 224);
        border-bottom: 1px solid rgb(224, 224, 224);
    }
    #product_info>table{
        width: 100%;
        /* border: 1px solid; */
        color:black;
    }
    #product_photo{
        padding:3px;
        width:100px;
        height:100px;
    }
    #product_info th{
        text-align: left;
    }

    #product_info_btn{
        padding:4px 0px 20px 0px;
        width:95%;

    }
    #product_info_btn>button{
        border: none;
        float: right;
    }

    #order_info1,#order_info2 {
        color:black;
        text-align: left;

    }
    .area2{
        padding:0px;
        /* background: tomato; */
        width: 40%;
    }
    #title2{
        margin:20px 0px 0px 10px;
        color:black;
        font-size: 20px;
        font-weight: bolder;
        /* background: brown; */
        padding: 2% 2% 4% 2%;
    }
    #pay_info{
            box-sizing: border-box;
            margin:0px 0px 0px 10px;
            border:1px solid rgb(224, 224, 224);
            border-radius: 2mm;
            height:100%;
            padding:15px; 
            margin-bottom: 10px;
    }

    #pay_table th{  
            text-align: left;
            font-weight: bolder;
            color: black;
             
    }
    #pay_table td{
            text-align: right;
            color: black;
    }
    #pay_table{
            width: 100%;
            padding:10px 15px;
            /* background: yellow; */
            height:100%;
            
    }
    #pay_table div{
            float: left;
            width:50%;
    }


    #title3{
        margin:20px 0px 0px 10px;
        color:black;
        font-size: 20px;
        font-weight: bolder;
        /* background: brown; */
        padding: 2% 2% 4% 2%;
        border-bottom: 1px solid rgb(224, 224, 224);
    }
    #pay{
        margin:20px 0px 20px 10px;
        /*background: royalblue;*/
        
    }
    #pay>div{
        margin:2px;
        text-align:center;
        width:30%;
        display: inline-block;
        background: rgb(224, 224, 224);
        font-size: 20px;
        color:black;
    }

    #pay_btn>button{
        width: 120px;
        font-size: 20px;
        border: none;
    }

</style>
</head>
<body>
<%@ include file="../common/storeMenubar.jsp" %>
    <div id="payForm">
        <h1 align="center">주문 / 결제</h1>
        <div class="area0">
            <div class="area1">
                <div id="title0">주문상품 정보</div>
                <form id="product_info" action="" method="">
                    <table>
                        <tbody>
                            <tr>
                                <th rowspan="4" width="150px">
                                    <div id="product_photo">
                                        <img src="../shopping/강아지.jpg" width="100px" height="100">
                                    </div>
                                </th>
                            </tr>
                            <tr>
                                <th>제품명&nbsp;&nbsp;&nbsp;</th>
                            </tr>
                            <tr>
                                <th>구매수량 : </th>
                            </tr>
                            <tr>
                                <th>상품가격 : </th>
                            </tr>
                        </tbody>   
                                 
                    </table>   
                </form>
                    <div id="product_info_btn">
                        <button type="button">제품보러가기</button>
                    </div>

                <!-- 주문자 정보 -->
                <div id="title1">주문자</div>
                <table id="order_info1">
                    <tr>
                        <th style="color: red; width: 10px;">*</th>
                        <th>주문자</th>
                        <td colspan="2"><input type="text" name="order" required></td>
                    </tr>
                    <tr>
                        <th style="color: red;">*</th>
                        <th>우편번호</th>
                        <td colspan="2"><input type="text" name="order_add_code" required></td>
                    </tr>
                    <tr>
                        <th style="color: red;">*</th>
                        <th>주소</th>
                        <td><input type="text" name="order_add" required></td>
                        <td><button type="button">주소검색</button></td>
                    </tr>
                    <tr>
                        <th style="color: red;">*</th>
                        <th>상세주소</th>
                        <td colspan="2"><input type="text" name="order_deatil_add" required></td>
                    </tr>
                    <tr>
                        <th style="color: red;">*</th>
                        <th>전화번호</th>
                        <td colspan="2"><input type="tel" name="" required placeholder="-없이"></td>
                    </tr>
                </table>

                <!-- 배송정보 -->
                <div id="title1">배송지</div>
                <table id="order_info2">
                    <tr>
                        <th style="color: red; width: 10px;">*</th>
                        <th>주문자</th>
                        <td colspan="2"><input type="text" name="order" required></td>
                    </tr>
                    <tr>
                        <th style="color: red;">*</th>
                        <th>우편번호</th>
                        <td colspan="2"><input type="text" name="order_add_code" required></td>
                    </tr>
                    <tr>
                        <th style="color: red;">*</th>
                        <th>주소</th>
                        <td><input type="text" name="order_add" required></td>
                        <td><button type="button">주소검색</button></td>
                    </tr>
                    <tr>
                        <th style="color: red;">*</th>
                        <th>상세주소</th>
                        <td colspan="2"><input type="text" name="order_deatil_add" required></td>
                    </tr>
                    <tr>
                        <th style="color: red;">*</th>
                        <th>전화번호</th>
                        <td colspan="2"><input type="tel" name="" required placeholder="-없이"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <th>기사님께</th>
                        <td colspan="2"><select name="toke">
                            <option value="">부재시 문앞에다가 놔 주세요.</option>
                            <option value="">배송 전에 연락주세요.</option>
                            <option value="">부재시 문자나 연락주세요.</option>
                            <option value="">부재시 경비실에 맡겨주세요.</option>
                        </select></td>
                    </tr>
                </table>
            </div>


            <!-- 결제금액 정보 -->
            <div class="area2">
                <div id="title2">결제금액</div>
                    <div id="pay_info">
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
                                        
                                    </div>
                                    
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <th>최종결제 금액</th>
                                <td>120,,000</td>
                            </tr>
        
                        </table>
                    </div>
            <!-- 결제수단 -->
            <div id="title3">결제수단</div>
                <div id="pay"> 
                        <div>
                            <p>kakaoPay</p>
                        </div>
                        <div>
                            <p>카드결제</p>
                        </div>
                        <div>
                            <p>계좌이체</p>
                        </div>
                    
                </div>
                <div id="pay_btn" align="center">
                    <button>결제하기</button>
                </div>

           
        </div>
    </div> 
   </div>
   
<%@ include file="../common/mainLower.jsp" %>

</body>
</html>