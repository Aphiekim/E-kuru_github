<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">

    <title>E-kuru</title>

    <!-- Css Styles -->
    <link rel="shortcut icon" href="img/HatchfulExport-All/ekuru_logo.ico">
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

        function mypageMain() {
            location.href = "user/mypageMain";
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
                        <a class="#" href="home-index-all.html"><img class="logo" src="resources/img/HatchfulExport-All/ekuru_logo.png" alt="logo"></a>
                    </div>
                </div>

                <!-- ë©ë´ êµ¬ì­ -->
                <div class="col-lg-9 col-md-9">
                    <div class="box2">
                        <div class="header-menu">
                            <ul>
                                <li class="menu-list">
                                    
                                    
                                    <c:choose>
										<c:when test="${empty sessionScope.user.getUserId() }">
											<a class="header-menu-list login-main" onclick="loginForm();">
		                                    	<span class="header-menu-text">Sign In</span>
		                                    </a>
		                                    <a class="header-menu-list login-main" onclick="joinForm();">
		                                        <span class="header-menu-text">Sign Up</span>
		                                    </a>
										</c:when>
										<c:otherwise>
											<span class="header-menu-text">${sessionScope.user.getUserNm() } Welcome!</span>
											<a class="header-menu-list login-main" onclick="mypageMain();">
		                                        <span class="header-menu-text">My Page</span>
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
                            <form action="#">
                                <input type="text" placeholder="Search...">

                                <button type="submit">Explore Now</button>
                            </form>
                        </div>
                    </div>
                    <!-- ê²ì íë¨ ë²í¼ -->
                    <div class="select-page">
                        <input class="" type="button" value="Look around">
                        <input class="" type="button" value="Request">
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
                            <img src="resources/img/icon/2x/baseline_laptop_mac_black_18dp.png">
                        </span>
                    </div>
                    <div class="services-cap">
                        <h5>
                            <a>1. Request</a>
                        </h5>
                        <p id="context-korean" style="margin-top: 10%; font: ;">
                            êµ¬ë§¤ìê° ìíë ìíì<br>
                            ì±ëì ì´ìíë íë§¤ììê²<br>
                            ìì²­ê¸ ìì± / ìí ìì²­
                        </p>
                        <p id="context-japan" style="margin-top: 10%; font: ;">
                            êµ¬ë§¤ìê° ìíë ìíì<br>
                            ì±ëì ì´ìíë íë§¤ììê²<br>
                            ìì²­ê¸ ìì± / ìí ìì²­
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
                            êµ¬ë§¤ìì íë§¤ìê° ì±íì íµíì¬<br>
                            ìíë ìí ì ë³´ ê³µì  / ê±°ë
                        </p>
                        <p id="context-japan" style="margin-top: 10%;">
                            êµ¬ë§¤ìì íë§¤ìê° ì±íì íµíì¬<br>
                            ìíë ìí ì ë³´ ê³µì  / ê±°ë
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
                            ê±°ëìê¹ì§ ìì± íì<br>
                            í´ì¸ ë°°ì¡ì íµí´ ë°°ë¬
                        </p>
                        <p id="context-japan" style="margin-top: 10%; font: ;">
                            ê±°ëìê¹ì§ ìì± íì<br>
                            í´ì¸ ë°°ì¡ì íµí´ ë°°ë¬
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
                                <img class="mx-auto rounded-circle" src="resources/img/member1.jpg" alt="" />
                                <h4>Jung Ha Young</h4>
                                <p class="text-muted">IT engineer</p>
                                <p class="text-muted">íêµ­ì´/æ¥æ¬èª/English</p>
                                <p class="text-muted">Lead Designer</p>
                                <p class="text-muted">Lead Designer</p>
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="team-member">
                                <img class="mx-auto rounded-circle" src="resources/img/crew-img/meojong.jpg" alt="" />
                                <h4>Choi Hyun Jong</h4>
                                <p class="text-muted">IT engineer</p>
                                <p class="text-muted">íêµ­ì´/æ¥æ¬èª/English</p>
                                <p class="text-muted">Lead Marketer</p>
                                <p class="text-muted">Lead Marketer</p>
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="team-member">
                                <img class="mx-auto rounded-circle" src="resources/img/crew-img/minyoung.jpg" alt="" />
                                <h4>Kim Min Young</h4>
                                <p class="text-muted">IT engineer</p>
                                <p class="text-muted">íêµ­ì´/æ¥æ¬èª/English</p>
                                <p class="text-muted">"ååã","ææ¦","åä¸å¿"</p>
                                <p class="text-muted">Lead Developer</p>
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p></div>
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