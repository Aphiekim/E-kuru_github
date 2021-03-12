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
    <link rel="shortcut icon" href="img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="/resources/css/mapage-dealHistory.css">
    <link rel="stylesheet" href="/resources/css/main-footer.css">
    <link rel="stylesheet" href="/resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="/resources/css/header.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body style="background-color: #FFDFB9;">
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
                            <li class="headli">Recently viewed items</li>
                            <li class="headli"><a href="/user/chatForm">My Chat</a></li>
                            <li class="headli"><a class="sub-a"  href="/user/mypagerequest">My Cart</a></li>
                        </ul>
                    </li>
                    <li class="headli"><a class="menu-a" href="/ad/superplan">SPlan?</a></li>
                    <%-- <li class="headli"><a class="menu-a" href="">Board</a></li> --%>
                    <li class="headli"><a class="menu-a" href="/user/mypagePoint">${sessionScope.userPoint }P</a></li>
                    <li class="headli"><a class="menu-a" href="/user/logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- header -->

    <!--마이 포인트 start-->
    <div class="container" style="margin-top: 5%;">

        <!--버튼-->
        <div class="buttons">
			<div class="row">
				<div class="col">
					<button type="button" class="btn btn-info">my shopping</button>&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-secondary">browsing history</button>&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-warning">buying history</button>
				</div>
			</div>
		</div>

        <!--거래 내역 시작-->
        <div class="card text-center">
            <div class="card-header">
                <h1 id="h1-p">거래 내역</h1>
            </div>
            <div class="card-body">

                <div class="base">
                    <div class="row">

                        <div class="list">
                            <table>
                                <tr>
                                    <th><span class="th-text">SPECNUM</span></th>
                                    <th><span class="th-text">DEALCODE</span></th>
                                    <th><span class="th-text">USERID</span></th>
                                    <th><span class="th-text">DEALSTATE</span></th>
                                    <th><span class="th-text">DEALINDATE</span></th>
                                    <th><span class="th-text">Specification</span></th>
                                </tr>
                                    <c:forEach items="${result }" var="dealHistory">
                                <tr>
                                        <td><span>${dealHistory.SPECNUM }</span></td>
                                        <td><span>${dealHistory.DEALCODE }</span></td>
                                        <td><span>${dealHistory.USERID }</span></td>
                                        <td><span>${dealHistory.DEALSTATE }</span></td>
                                        <td><span>${dealHistory.DEALINDATE }</span></td>
                                        <td><span>Specification</span></td>
                                </tr>
                                </c:forEach>

                            </table>
                        </div>
                    </div>
                </div>

                <div class="card-footer text-muted">
                    Make your point be full, you will be happy
                </div>
            </div>
        </div>
        <!--거래 내역 end-->
    </div>
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
                                <p><i class="fa fa-map-marker-alt"></i>서울시 강남구 영동대로 513</p>
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
