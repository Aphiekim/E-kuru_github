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
    <link rel="stylesheet" href="../resources/css/main-footer.css">
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/header_Origin.css">
    <script type="text/javascript">
		function openHome(){
			location.href="/";
		}
		function openPointHistory(){
			location.href="/user/mypagePoint";
		}
    </script>
    <style>
        .text-st{
            color: #A4193D;
            margin-top: 3%;
        }

        body{
            background-color: #FFDFB9;
        }
    </style>
</head>
<body>
  <!-- header -->
    <header class="header---">
        <div class="wrapper">
            <a href="/">
                <img src="../resources/img/HatchfulExport-All/ekuru_logo.png" style="width: 4%; position: absolute;">
            </a>
            <nav>
                <ul class="menu">
                    <li class="menu-list headli">
                        <a class="menu-a" href="/user/mypageMain">My Page</a>
                        <ul class="menu-sub">
                            <li class="headli"><a href="/user/specificationListForm">My Spec</a></li>
                            <li class="headli"><a href="/user/chatForm">My Chat</a></li>
                            <li class="headli"><a class="sub-a"  href="/user/mypageShopping">My Cart</a></li>
                        </ul>
                    </li>
                    <li class="headli"><a class="menu-a" href="/ad/superplan">SPlan?</a></li>
                    <%-- <li class="headli"><a class="menu-a" href="">Board</a></li> --%>
                    <li class="headli"><a class="menu-a" href="/user/mypagePoint">${sessionScope.userPoint }P</a></li>
                    <li class="headli"><a class="menu-a" href="/user/logout">Logout</a></li>
                    <li class="headli"><a class="menu-a" href="/user/viewedItems">Recently viewed items</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- header -->
<!-- 주문 완료 창-->
<div class="container" style="margin-bottom: 25%;">
    <div class="text-center text-st">
        <img src="../resources/img/HatchfulExport-All/ekuru_logo.png" style="width: 30%; margin-top: 10%;">
        <h2>[ Super Plan ]</h2>
        <h1>Point payment success!!</h1>
    </div>

    <!--버튼-->
    <div class="buttons" style="text-align: center; margin-top: 5%;">
        <div class="row">
            <div class="col">
                <button type="button" class="btn btn-info" onclick="openHome();">Home</button>&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-warning" onclick="openPointHistory();">Point history</button>
            </div>
        </div>
    </div>

</div>
<!-- 주문 완료창 end-->

<!-- include tag Footer Start -->
<div>

    <div class="footer" style="margin-top: -15%;">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="row">
                        <!-- 주소지 -->
                        <div class="col-md-6">
                            <div class="footer-contact">
                                <h2>Our Head Office</h2>
                                <p><i class="fa fa-map-marker-alt"></i>서울 강남구 영동대로 513</p>
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
                        <!-- 회사 방침 링크 -->
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
                <!-- 서포트 이메일 받는란 -->
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
                            <input type="text" class="form-control" placeholder="Email@email.com"
                                aria-label="Email@email.com aria-describedby=" button-addon2">
                            <button class="btn btn-secondary" type="submit" id="button-addon2">submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- 저작권 부분 -->
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
</div>
<!-- Footer End -->
</body>
</html>