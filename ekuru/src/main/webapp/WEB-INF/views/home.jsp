<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <title>E-kuru</title>

    <!-- Css Styles -->

    <link rel="shortcut icon" href="resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">  <!--col-md col-lgë± ì¬ì©í ë íì-->
    <link rel="stylesheet" href="resources/css/index.css">
    <link rel="stylesheet" href="resources/css/main_last.css">
    <link rel="stylesheet" href="resources/css/main_middle.css">
    <link rel="stylesheet" href="resources/css/bootstrap-4.6.0-dist/css">
    <link rel="stylesheet" href="resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="resources/font/NotoSansCJKjp-Bold.otf">
    <link rel="stylesheet" href="resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script>
        function loginForm() {
            location.href = "user/loginForm";
        }

        function joinForm() {
            location.href = "user/joinForm";
        }

        function logout() {
            location.href = "user/logout";
        }

        function mypageMain() {
            location.href = "user/mypageMain";
        }

        function openRequestMain(){
			location.href = "request/request_main";
        }
        function openChannelMain(){
			location.href = "channel/ch_main";
        }
    </script>

    <style>
        *{
            font-family: 'NotoSansCJKjp-Black', sans-serif;
        }
        h2{
            font-family: 'NotoSansCJKjp-Black', sans-serif;
        }
           .section3-con{
            height: 300%;
        }
        .section3-text{
            margin-top: 5%;
            margin-bottom: 5%;
            color: #A4193D;
        }
        .context-korean{
            margin-top: 5%;
        }
        .context-japan{

        }

    </style>
</head>

<body>
    <!-- Header Section Begin -->
    <header class="header">
        <div class="header-nav">
            <div class="row">
                <!-- ë¡ê³  êµ¬ì­-->
                <div class="col-lg-3 col-md-3">
                    <div class="box1">
                        <a class="#" href="/"><img class="logo" src="../resources/img/HatchfulExport-All/ekuru_logo.png" alt="logo"></a>
                    </div>
                </div>

                <!-- ë©ë´ êµ¬ì­ -->
                <div class="col-lg-9 col-md-9">
                    <div class="box2">
                        <div class="header-menu">
                            <ul>
                                <li class="menu-list">


                                    <c:choose>
										<c:when test="${empty sessionScope.userId }">
											<a class="header-menu-list login-main" onclick="loginForm();">
		                                    	<span class="header-menu-text">Sign In</span>
		                                    </a>
		                                    <a class="header-menu-list login-main" onclick="joinForm();">
		                                        <span class="header-menu-text">Sign Up</span>
		                                    </a>
										</c:when>
										<c:otherwise>
											<span class="header-menu-text">${sessionScope.userNm } Welcome!</span>
											<a class="header-menu-list login-main" onclick="mypageMain();">
		                                        <span class="header-menu-text">My Page</span>
		                                    </a>
		                                    <a class="header-menu-list login-main" onclick="logout();">
		                                        <span class="header-menu-text">Logout</span>
		                                    </a>
										</c:otherwise>
									</c:choose>
                                    <!--
                                    <ul class="login-sub">
                                        <li>Logout</li>
                                        <li>Mypage</li>
                                        <li>info</li>
                                        <li>help</li>
                                    </ul>
                                    -->
                                </li>
                                <li></li>
                            </ul>
                            <%--
                            <a class="header-menu-list" href="">
                                <span class="header-menu-text">Point : 85600</span>
                            </a>
                            --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
    <!-- Section1 Start -->
    <section class="set-bg section1">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <div class="section-title">
                            <h2>Discover the Best Korean items</h2>
                            <p>The best Korean package service is waiting for you</p>
                        </div>
                        <div class="search-form">
                            <form action="/main_afterSearchForm" method="post">
                                <input type="text" placeholder="Search..." name="search">

                                <button type="submit">Explore Now</button>
                            </form>
                        </div>
                    </div>
                    <!-- ê²ì íë¨ ë²í¼ -->
                    <div class="select-page">
                        <input class="" type="button" value="Look around" onclick="openChannelMain();">
                        <input class="" type="button" value="Request" onclick="openRequestMain();">
                    </div>
                </div>
            </div>
        </div>
    </section>
   <!-- Section1 End -->
<!-- Section2 Area Start -->
<div class="section3-con">
    <div class="container">
        <hr class="line" style="margin-top: 10%; border-top: 2px solid #A4193D">
        <div class="row">
            <div class="col-lg-12">
                <!-- Section Tittle -->
                <div class="section-tittle section-tittle2 text-center mb-80 section3-text" >
                    <span>E - k u r u</span>
                    <h2>How It Works</h2>
                </div>
            </div>
        </div>
        <div class="row justify-content-between">
            <div class="col-lg-3 col-md-6">
                <div class="single-services text-center mb-50">
                    <div class="services-icon" style="margin-bottom: 10%; width: 100%;">
                        <span>
                            <img src="../resources/img/icon/2x/baseline_laptop_mac_black_18dp.png">
                        </span>
                    </div>
                    <div class="services-cap">
                        <h5>
                            <a>1. Request</a>
                        </h5>
                        <p id="context-korean" style="margin-top: 10%;">
                           구매자가 원하는 상품을<br>
                           채널을 운영하는 판매자에게<br>
                           요청글 작성 / 상품 요청
                        </p>
                        <p id="context-japan" style="margin-top: 10%;">
                            お客様のご希望の商品を<br>
                           チャンネルを運営する人に<br>
                           リクエスト作成 / 商品リクエスト
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="single-services text-center mb-50">
                    <div class="services-icon" style="margin-bottom: 10%;">
                        <span>
                            <img src="resources/img/icon/2x/baseline_contact_mail_black_18dp.png">
                        </span>
                    </div>
                    <div class="services-cap">
                        <h5><a>2. Matching</a></h5>
                        <p id="context-korean" style="margin-top: 10%;">
                           원하는 상품을 채팅을 통해<br>
                           정보 공유 및 거래
                        </p>
                        <p id="context-japan" style="margin-top: 10%;">
                            欲しい賞品をチャットで<br>
                          	情報共有及び取引

                        </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6" style="margin-bottom: 10%;">
                <div class="single-services text-center mb-50">
                    <div class="services-icon" style="margin-bottom: 10%;">
                        <span>
                            <img src="resources/img/icon/2x/baseline_shopping_bag_black_18dp.png" alt="">
                        </span>
                    </div>
                    <div class="services-cap">
                        <h5><a>3. Get</a></h5>
                        <p id="context-korean" style="margin-top: 10%; font: ;">
                            거래서 작성 후<br>
                            해외 배송으로 상품 수령
                        </p>
                        <p id="context-japan" style="margin-top: 10%; font: ;">
                            取引書作成後、<br>
                            海外配送で商品を受領
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <hr class="line" style="border-top: 2px solid #A4193D">
    </div>
</div>
<!-- section2 Area End -->
<!-- Section4 Start-->
    <section class="section4">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <!-- Section Tittle -->
                    <div class="section4-title text-center mb-80">
                        <h2>Our Amazing Team</h2>
                    </div>

                    <div class="page-section" id="team">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="team-member">
                                <img class="mx-auto rounded-circle" src="../resources/img/crew-img/member1.jpg" alt="" />
                                <h4>Jung Ha Young</h4>
                                <p class="text-muted">IT engineer</p>
                                <p class="text-muted">한국어/日本語/English</p>
                                <p class="text-muted">"グローバル人間、諦めない"</p>
                                <p class="text-muted">hayoungjung55@gmail.com</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="team-member">
                                <img class="mx-auto rounded-circle" src="../resources/img/crew-img/meojong.jpg" alt="" />
                                <h4>Choi Hyun Jong</h4>
                                <p class="text-muted">IT engineer</p>
                                <p class="text-muted">한국어/日本語/English</p>
                                <p class="text-muted">"成長、情熱、責任"</p>
                                <p class="text-muted">meojong@gmail.com</p>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="team-member">
                                <img class="mx-auto rounded-circle" src="../resources/img/crew-img/minyoung.jpg" alt="" />
                                <h4>Kim Min Young</h4>
                                <p class="text-muted">IT engineer</p>
                                <p class="text-muted">한국어/日本語/English</p>
                                <p class="text-muted">"前向き、挑戦、向上心"</p>
                                <p class="text-muted">aphiekim@gmail.com</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">We are waiting for you. We want to offer the great service to you.<br> If you have any questions, let us know thank you</p></div>
                    </div>
                </div>


                </div>
            </div>
        </div>
    </section>
    <!-- Section4 End-->
<%@ include file="/WEB-INF/views/main-footer.jsp" %>

</body>

</html>