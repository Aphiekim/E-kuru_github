<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--반응형 만들기 위해서 필요-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>
    <link rel="shortcut icon" href="/resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="/resources/css/ChannelManagement.css">
    <link rel="stylesheet" href="/resources/css/main-footer.css">
    <link rel="stylesheet" href="/resources/css/header.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <style>
       body{
           background-color: #FFDFB9;
       }
    </style>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>


    <script>
        $(".delete_${prodList.prodNum}_img").click(function(){
            var confirm = confirm("정말 삭제?");

            if(confirm) {
                var checkArr = new Array();

                checkArr.push($(this).attr("data-prodNum"));

                $.ajax({
                url : "channel/prodDelete",
                type : "post",
                data : { chbox : checkArr },
                success : function(result){
                if(result == 1) {
                location.href = "channel/management";
                } else {
                alert("삭제 실패");
                }
                }
                });
            }
        });
    </script>

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
                            <li class="headli">Recently viewed items</li>
                            <li class="headli">My Request</li>
                            <li class="headli"><a class="sub-a"  href="/user/mypagerequest">My Cart</a></li>
                        </ul>
                    </li>
                    <li class="headli"><a class="menu-a" href="/ad/superplan">SPlan?</a></li>
                    <%-- <li class="headli"><a class="menu-a" href="">Board</a></li> --%>
                    <li class="headli"><a class="menu-a" href="">58600P</a></li>
                    <li class="headli"><a class="menu-a" href="/user/logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <!-- header -->
    <div>


        <div class="container" style="margin-top: 10%;background-color: #FFDFB9;">
            <div class="base">
                <div class="row">
                    <div class="main-text">
                        <span>Channel Management</span>
                    </div>
                    <div class="content1">
                        <div class="profile">
                            <a href="##"><img class="minus-icon" src="/resources/img/channel/delete.png" alt=""></a>
                            <a href="">
                                <img src="/resources/img/card-img2.jpg" alt="" class="profile-img">
                            </a>
                        </div>
                    </div>
                    <div class="content2">
                        <div class="test">
                            <ul>
                                <li class="li-sty"><span>51</span></li>
                                <li class="li-sty"><span>379</span></li>
                            <li  class="li-sty"><span>8210</span></li>
                        </ul>

                        <ul class="text">
                            <li  class="li-sty"><span>Posts</span></li>
                            <li  class="li-sty"><span>Followers</span></li>
                            <li  class="li-sty"><span>Follow</span></li>
                        </ul>
                    </div>

                </div>
                <a href="##"><img class="minus-icon" src="/resources/img/channel/delete.png" alt=""></a>
                <div class="test2">

                    <p>
                        <span class="profile-text">
                            Nike Pro Top can be worn as a long sleeve layered item in cool weather.
                            Lightweight, highly reliable materials with dry fit technology provide a consistent comfortable fit during training.
                        </span>
                    </p>
                </div>

                <c:if test="${empty prodListResult }">
                    <p>아직 등록된 상품이 없습니다.</p>
                </c:if>

                <div class="product-list">
                    <c:forEach items="${prodListResult }" var="prodList">
						<c:if test="${not empty prodListResult }">
                        <div class="product">
                            <a href="" class="delete_${prodList.prodNum}_img" data-prodNum="${prodList.prodNum}"><img class="minus-icon" src="/resources/img/channel/delete.png" alt=""></a>
                            <a href="ch_content?prodNum=${prodList.prodNum }&chNum=${channel.chNum}">
                                <img src="/resources/img/channel/product${prodList.prodNum }.jpg" alt="" class="product-img">
                            </a>
                        </div>
                       	</c:if>
                    </c:forEach>
                </div>



                <div class="button-list">
                    <input class="button btn-danger" type="button" value="done">
                </div>



            </div>


        </div>
    </div>
</div>
    <!-- include tag Footer Start -->
    <div class="footer">
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
                            <button class="btn btn-secondary" type="submit" id="button-addon2">SUBMIT</button>
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


</body>
</html>