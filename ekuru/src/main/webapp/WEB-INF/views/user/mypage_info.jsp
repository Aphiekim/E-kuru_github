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
    <link rel="stylesheet" href="../resources/css/mypage-info.css">
    <link rel="stylesheet" href="../resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body style="background-color: #FFDFB9;">
   <%@ include file="/WEB-INF/views/header.jsp" %>
    <div>
        <div>
            <!-- 회원 사진 / 인트로 -->
            <div>
                <div class="container d-flex align-items-center flex-column">
                    <!--버튼-->
                    <div class="buttons">
                        <div class="row">
                            <div class="col">
                                <button type="button" class="btn btn-secondary">기본정보</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-warning">채널관리</button>
                            </div>
                        </div>
                    </div>

                    <!-- Masthead Avatar Image-->
                    <img class="mx-auto rounded-circle imgsize" src="../resources/img/member1.jpg" style="width: 20%; margin-top: 5%;" />
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

                    <!-- 마이페이지 메뉴 Start -->
                    <div class="fact my-menu-size">
                        <div class="container">
                            <div class="row align-items-center text-uppercase" >
                                <div class="col-lg-3 col-md-6 fact-style" style="margin-left: 12%;">
                                    <div class="fact-item" style="width: 330%;">
                                        <div><h2 style="display: inline;">아이디</h2><h2 style="display: inline;">아이디</h2></div>
                                        <div><h2 style="display: inline;">아이디</h2><h2 style="display: inline;">아이디</h2></div>
                                        <div><h2 style="display: inline;">아이디</h2><h2 style="display: inline;">아이디</h2></div>
                                        <div><h2 style="display: inline;">아이디</h2><h2 style="display: inline;">아이디</h2></div>

                                        <h2>현주소지</h2>
                                    </div>
                                </div>
                                .
                            </div>
                        </div>
                    </div>
                    <!-- 마이페이지 메뉴 end -->
                </div>
                
            </div>


        </div>
    </div>

<%@ include file="/WEB-INF/views/main-footer.jsp" %>

</body>

</html>