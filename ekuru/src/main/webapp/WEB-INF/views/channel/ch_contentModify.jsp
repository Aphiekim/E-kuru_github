<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>E-kuru</title>

    <link rel="shortcut icon" href="/resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="/resources/css/ch_contentModify.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/header.css">
    <link rel="stylesheet" href="/resources/css/main-footer.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script> $('.carousel').carousel({ interval: 2000 //기본 5초
    });

    function fn_contentModify(){
        var prodModify = document.getElementById("prodModify");
        console.log(prodModify);

        const prodTitle = document.getElementById("prodTitle").value;
        const prodPrice = document.getElementById("prodPrice").value;
        const prodStock = document.getElementById("prodStock").value;
        const prodContent = document.getElementById("prodContent").value;

        if(prodTitle == '' || prodTitle == null){
            alert("물품 이름을 입력 해 주세요");
            return false;
        }

        if(prodPrice == '' || prodPrice == null || prodPrice < 1){
            alert("가격을 입력 해 주세요");
            return false;
        }

        if(isNaN(prodPrice)){
            alert("숫자만 입력 가능합니다");
            return false;
        }

        if(prodStock == '' || prodStock == null || prodStock < 1){
            alert("수량을 입력 해 주세요");
            return false;
        }

        if(isNaN(prodStock)){
            alert("숫자만 입력 가능합니다");
            return false;
        }

        if(prodContent == '' || prodContent == null){
            alert("내용을 입력 해 주세요");
            return false;
        }

        prodModify.action = "/channel/contentModify";
        prodModify.method = "POST";
        prodModify.submit();

    }


    </script>

<style type="text/css">
	#contentimg{
		width: 525px;
		height: 300px;
	}
	</style>
</head>
<body>
<!--전체 틀-->
<div class="fullSize">
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
    <!-- 중간 전체 틀 -->
    <div class="mainSize">
        <form id="prodModify">
            <div class="text-center" style="padding-top: 7%;"></div>
            <!-- <div><h2 class="page-section-heading text-center text-secondary title-style">
                <strong>Holly Dolly</strong>님의 게시글</h2></div> -->
            <!--상위 부분-->
            <div class="top-content">

                <!--슬라이드 범위 -->
                <div class="product-slide">
                    <div id="demo" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <!-- 슬라이드 쇼 -->
                            <div class="carousel-item active">
                                <!--가로-->
                                <img id="contentimg" class="d-block w-100"
                                    src="../resources/upload/file/${prodResult.getProdOriginalPic1() }?auto=compress&cs=tinysrgb&h=650&w=940"
                                    alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img id="contentimg" class="d-block w-100"
                                    src="../resources/upload/file/${prodResult.getProdOriginalPic2() }?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
                                    alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img id="contentimg" class="d-block w-100"
                                    src="../resources/upload/file/${prodResult.getProdOriginalPic3() }?auto=compress&cs=tinysrgb&h=650&w=940"
                                    alt="Third slide">
                            </div>
                            <!-- / 슬라이드 쇼 끝 -->

                            <!-- 왼쪽 오른쪽 화살표 버튼 -->
                            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <!-- <span>Previous</span> -->
                            </a>
                            <a class="carousel-control-next" href="#demo" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <!-- <span>Next</span> -->
                            </a>
                            <!-- / 화살표 버튼 끝 -->

                            <!-- 인디케이터 -->
                            <ul class="carousel-indicators">
                                <li data-target="#demo" data-slide-to="0" class="active"></li>
                                <!--0번부터시작-->
                                <li data-target="#demo" data-slide-to="1"></li>
                                <li data-target="#demo" data-slide-to="2"></li>
                            </ul>
                            <!-- 인디케이터 끝 -->
                        </div>
                    </div>
                <!--슬라이드 끝-->
                </div>

                <!-- 수정 페이지 -->
                <div class="product-intro">
                		<input type="hidden" name="userId" id="userId" value="${prodResult.userId}">
                		<input type="hidden" name="prodNum" id="prodNum" value="${prodResult.prodNum}">
                        <div class="product-title">
                            <input type="text" name="prodTitle" id="prodTitle" value="${prodResult.prodTitle}">
                        </div>

                        <div class="contents">
                            <div class="content-name">
                                <span>PRICE</span>
                            </div>
                            <div class="content-value">
                                <input type="text" name="prodPrice" id="prodPrice" value="${prodResult.prodPrice}">
                            </div>
                            <div class="content-name">
                                <span>QUANTITY</span>
                            </div>
                            <div class="content-value">
                                <input type="text" name="prodStock" id="prodStock" value="${prodResult.prodStock}">
                            </div>
                            <div class="content-name">
                                <span>CATEGORY</span>
                            </div>
                            <div class="content-value">
                                <select class="select" name="prodCategory" id="prodCategory">
                                    <option value="${categoryResult.categoryCode}">${categoryResult.categoryName}</option>
                                    <option value="1">Fashion_acc</option>
                                    <option value="2">Beauty</option>
                                    <option value="3">Food</option>
                                    <option value="4">Book_cd</option>
                                    <option value="5">Ect</option>
                                </select>

                            </div>
                            <div class="content-name">
                                <span>CONTENT</span>
                            </div>
                            <div class="content-value">
                                <textarea  rows="5" cols="40" name="prodContent" id="prodContent">${prodResult.prodContent}</textarea>
                            </div>
                        </div>
                 </div>
                <!-- 수정 페이지 끝-->
            </div>
            <!--상위 부분 끝-->

            <!--하위 부분 시작-->
            <div class="bottom-content">
                <div class="comments">
                    <div class="row" id="commentAdd">
                        <c:forEach items="${commentResult }" var="commentList">
                                <div class="col-md-12">
                                    <img class="img" src="/resources/img/person1.png">
                                    <span class="comment-detail">${commentList.userId }</span>
                                    <span class="comment-detail">${commentList.prodComment }</span>
                                </div>
                        </c:forEach>
                    </div>
                </div>
            <!--하위 부분 끝-->
            </div>
                <div class="button-list">
                    <input class="button btn-danger" type="button" value="modify" onclick="fn_contentModify();">
                </div>

        </form>
    </div>
    <!-- 중간 전체 틀 끝-->

</div>
<!--전체 틀 끝-->

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