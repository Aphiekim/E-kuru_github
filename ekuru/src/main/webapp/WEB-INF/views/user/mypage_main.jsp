<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>
    <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="../resources/css/mypaeg-main.css">
    <link rel="stylesheet" href="../resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        * {
            font-family: 'NotSansCJKjp-Black', sans-serif;
        }

        body {
            background-color: #FFDFB9 !important;
        }
        a{
        	color: black;
        }
        a:hover{
        	text-decoration: none;
        }
    </style>
    
</head>

<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
    <div>
        <div>
            <!-- 회원 사진 / 인트로 -->
            <div>
                <div class="container d-flex align-items-center flex-column">
                    <!-- Masthead Avatar Image-->
                    <img class="mx-auto rounded-circle" src="../resources/upload/file/${user.getUserProfile()}" style="width: 30%; margin-top: 15%;" />
                    <!-- Masthead Heading-->
                    <h1 class="text-uppercase mb-0" style="margin-top: 5%;color: black;">Mypage</h1>
                    <!-- Icon Divider-->
                    <div class="divider-custom divider-light">
                        <div class="divider-custom-line"></div>
                        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                        <div class="divider-custom-line"></div>
                    </div>
                    <!-- Masthead Subheading-->
                    <p class="masthead-subheading font-weight-light mb-0">${sessionScope.user.getUserNm() } Welcome!</p>
                </div>
            </div>
            <!-- 마이페이지 메뉴 Start -->
            <div class="fact my-menu-size">
                <div class="container">
                    <div class="row align-items-center text-uppercase">
                        <div class="col-lg-3 col-md-6 fact-style" style="margin-left: 12%;">
                        <a href="/user/mypage_Info">
                            <div class="fact-item">
                                <img src="../resources/img/mypage-img/main/icon-1.png" alt="Icon">
                                <h2 class="">My Info</h2>
                            </div>
                        </a>
                        </div>
                        <c:if test="${userType eq 1 }">
	                        <div class="col-lg-3 col-md-6 fact-style">
		                        <a href="/user/mypageShopping">
		                            <div class="fact-item">
		                                <img src="../resources/img/mypage-img/main/icon-5.png" alt="Icon">
		                                <h2>Shopping</h2>
		                            </div>
		                        </a>
	                        </div>
                        </c:if>
                        <div class="col-lg-3 col-md-6 fact-style">
                        <a href="/user/mypagePoint">
                            <div class="fact-item">
                                <img src="../resources/img/mypage-img/main/icon-6.png" alt="Icon">
                                <h2>Point</h2>
                            </div>
                        </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 마이페이지 메뉴 end -->
        </div>
    </div>
    <!-- include tag Footer Start -->
    <div>
<%@ include file="/WEB-INF/views/main-footer.jsp" %>
</body>

</html>