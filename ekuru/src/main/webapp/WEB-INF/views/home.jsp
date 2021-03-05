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
    <link rel="stylesheet" href="resources/css/main-footer.css">
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
        function loginFormPopup() {
            //window.open("htmlì´ë¦", "ë³ì¹­", "ì¤íì¼");
            //window.open("loginForm.html", "loginForm", "width=600, height=700, left=75, top=50");
            location.href = "user/loginForm";
        }

        function joinFormPopup() {
            //window.open("htmlì´ë¦", "ë³ì¹­", "ì¤íì¼");
            //window.open("loginForm.html", "loginForm", "width=600, height=700, left=75, top=50");
            location.href = "user/joinForm";
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
                                    <a class="header-menu-list login-main" onclick="loginFormPopup();">
                                        <!-- <img class="header-menu-img" src="img/login-img.png" alt="" /> -->
                                        <span class="header-menu-text">Sign In</span>
                                    </a>
                                    <a class="header-menu-list login-main" onclick="joinFormPopup();">
                                        <span class="header-menu-text">Sign Up</span>
                                    </a>
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
                            <a class="header-menu-list" href="">
                                <span class="header-menu-text">Point : 85600</span>
                            </a>
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
     <!-- include tag Footer Start -->
     <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="row">
                        <!-- ì£¼ìì§ -->
                        <div class="col-md-6">
                            <div class="footer-contact">
                                <h2>Our Head Office</h2>
                                <p><i class="fa fa-map-marker-alt"></i>ìì¸ ê°ë¨êµ¬ ìëëë¡ 513</p>
                                <p><i class="fa fa-phone-alt"></i>02-6000-0114</p>
                                <p><i class="fa fa-envelope"></i>E-kuru co.</p>
                                <div class="footer-social">
                                    <a href=""><i class="fab fa-twitter"></i></a>
                                    <a href=""><i class="fab fa-facebook-f"></i></a>
                                    <a href=""><i class="fab fa-youtube"></i></a>
                                    <a href=""><i class="fab fa-instagram"></i></a>
                                    <a href=""><i class="fab fa-linkedin-in"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- íì¬ ë°©ì¹¨ ë§í¬ -->
                        <div class="col-md-6">
                            <div class="footer-link">
                                <h2>Quick Links</h2>
                                <a href="">How to use</a>
                                <a href="">Privacy policy</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ìí¬í¸ ì´ë©ì¼ ë°ëë -->
                <div class="col-lg-5">
                    <div class="footer-newsletter">
                        <h2>Support us</h2>
                        <p>
                            If you are interested in this business, send your email to us.<br>
                            Thank you for supporting.
                        </p>
                    </div>
                    <div>
                        <form class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Email@email.com" aria-label="Email@email.com aria-describedby="button-addon2">
                            <button class="btn btn-secondary" type="submit" id="button-addon2">submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- ì ìê¶ ë¶ë¶ -->
        <div class="container copyright">
            <div class="row">
                <div class="col-md-6">
                    <p>&copy; <a href="#">E-kuru</a>, All Right Reserved.</p>
                </div>
                <div class="col-md-6">
                    <p>Designed By <a href="https://htmlcodex.com">HTML Codex</a></p>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->

</body>

</html>