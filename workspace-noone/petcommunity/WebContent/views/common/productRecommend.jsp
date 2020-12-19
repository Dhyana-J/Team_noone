<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%String rcontext = request.getContextPath();%>
<html lang="en">
<head>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        .outer{
            background: white;
            color: black;
            width:900px;
            height: 400px;
            margin:auto;
            margin-top: 50px;
        }
        .tbody{
            margin-left: 80px;
            height: 350px;
            margin-right: 80px;
        }
        .recobody>table{
            float: left;
            margin: 20px;
            margin-left: 50px;
        }

        .paging-area a{
           
            color: black;
            margin: 5px;
        }
        .test1 :hover{
          cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="outer">

        <br>
        <h2 align="center">물품 추천</h2>
        <div class="recobody">
            <table class="test1">
            	<tr>
        			<th><a class="address1" href=""><img src="" width=200 height=200></a></th>
        		</tr>
        	</table>
        	<table class="test1">
            	<tr>
        			<th><a class="address2" href=""><img src="" width=200 height=200></a></th>
        		</tr>
        	</table>
        	<table class="test1">
            	<tr>
        			<th><a class="address3" href=""><img src="" width=200 height=200></a></th>
        		</tr>
        	</table>
        </div>
    </div>
</body>
<script>
        	$(function(){
                selectRecommand();
              });
              function selectRecommand(){
                $.ajax({
                	url:"reclist.bo",
                	success:function(rlist){
                		var str = rlist[0].pThumbUrl;
                		var adr = "<%=rcontext%>/detail.st?pno=" + rlist[0].pNo+ "&rp=1&pip=1&qp=1";
                		var str2 = rlist[1].pThumbUrl;
                		var adr2 = "<%=rcontext%>/detail.st?pno=" + rlist[1].pNo+ "&rp=1&pip=1&qp=1";
                		var str3 = rlist[2].pThumbUrl;
                		var adr3 = "<%=rcontext%>/detail.st?pno=" + rlist[2].pNo+ "&rp=1&pip=1&qp=1";
                		$(".address1 img").attr("src", str);
                		$(".address1").attr("href", adr);
                		$(".address2 img").attr("src", str2);
                		$(".address2").attr("href", adr2);
                		$(".address3 img").attr("src", str3);
                		$(".address3").attr("href", adr3);
                	},error:function(){
                		console.log("fail");
                	}
                })
              }
             
      
     </script>
</html>