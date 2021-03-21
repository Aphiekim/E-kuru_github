<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>

    <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="../resources/css/mypage-pointpricing.css">
    <link rel="stylesheet" href="../resources/css/main-footer.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript">
		function openPayment1(pointProdNum){
			location.href="/payment/payment?pointProdNum="+pointProdNum;
		}
		function openPayment2(pointProdNum){
			location.href="/payment/payment?pointProdNum="+pointProdNum;
		}
		function openPayment3(pointProdNum){
			location.href="/payment/payment?pointProdNum="+pointProdNum;
		}
    </script>
    <style>
        .coin{
            margin-top: 10%;
        }

        .card{
            width: 25%; 
            height: 100%; 
            margin-right: 1%; 
            border:solid 1.5px gray;
        }

        #pointPrice{
            margin-top: 10%; 
            margin-bottom: 10%;
        }
        .point-content{
            padding: 15%;
        }

        .card-titles{
            margin-bottom: 5%;
        }
        *{
            font-family: 'NotSansCJKjp-Black', sans-serif;
           
        }

        body{
           background-color:#FFDFB9;
        }

        .li-sty{
            background-color: #A4193D; 
            color: white;
            font-size:150%
        }

        .li-sty2{
            background-color: white;
        }
    </style>
    <script>
    </script>
</head>
<body>
  <%@ include file="/WEB-INF/views/header.jsp" %>
    <!-- 포인트 메뉴 start -->
    <div class="container">
        <!-- 포인트 메뉴 타이틀-->
        <div class="row justify-content-md-center coin">
            <img src="../resources/img/mypage-img/mypoint/iconfinder_b_6_2578279.png" alt="">
        </div>
        <div class="card-title text-uppercase text-center" >
            <h1>Point menu</h1>
        </div>
        <div class="text-center card-titles">
            <p>This is menu of point. If you charge your point, you can use it as money in this world</p>
        </div>
        <!-- 포인트 메뉴 목록-->
        <div class="row justify-content-md-center text-center" style="margin-bottom: 30%;">
            <div class="columns">
                <ul class="price">
                  <li class="text-uppercase li-sty"style="background-color: #A4193D; font-size:150%">Basic</li>
                  <li class="grey">5,000P</li>                  
                  <li class="li-sty2">KOREA <p id="priceWon">5</p>USD</li>
                  <li class="li-sty2">JAPAN <p id="priceYen">500</p>YEN</li>
                  <li class="grey">
                    <c:if test="${user.getUserType() ne '1' }">	
                  		<button class="btn btn-outline-danger" onclick="openPayment1('1');">Charge</button>
                  	</c:if>
                  	<c:if test="${user.getUserType() eq '1' }">
                  		<button class="btn btn-outline-danger" onclick="openPayment1('1');">Charge</button>
                  	</c:if> 
                  </li>
                </ul>
            </div>
            <div class="columns">
                <ul class="price">
                  <li class="text-uppercase li-sty">Standard</li>
                  <li class="grey">10,000P</li>
                  <li class="li-sty2">KOREA <p id="priceWon">10</p>USD</li>
                  <li class="li-sty2">JAPAN <p id="priceYen">1,000</p>YEN</li>
                  <li class="li-sty2">Super pass X 1</li>
                  <li class="grey">
                  	<c:if test="${user.getUserType() ne '1' }">	
                  		<button class="btn btn-outline-danger" onclick="openPayment2('2');">Charge</button>
                  	</c:if>
                  	<c:if test="${user.getUserType() eq '1' }">
                  		<button class="btn btn-outline-danger" onclick="openPayment2('2');">Charge</button>
                  	</c:if> 
                  </li>
                </ul>
            </div>
            <div class="columns">
                <ul class="price">
                  <li class="text-uppercase li-sty">Special</li>
                  <li class="grey">50,000P</li>
                  <li class="li-sty2">KOREA <p id="priceWon">50</p>USD</li>
                  <li class="li-sty2">JAPAN <p id="priceYen">5,000</p>YEN</li>
                  <li class="li-sty2">Super pass X 3</li>
                  <li class="grey">
                  	<c:if test="${user.getUserType() ne '1' }">	
                  		<button class="btn btn-outline-danger" onclick="openPayment3('3');">Charge</button>
                  	</c:if>
                  	<c:if test="${user.getUserType() eq '1' }">
                  		<button class="btn btn-outline-danger" onclick="openPayment3('3');">Charge</button>
                  	</c:if> 
                  </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 포인트 메뉴 end -->
   <%@ include file="/WEB-INF/views/main-footer.jsp" %>
</body>
</html>