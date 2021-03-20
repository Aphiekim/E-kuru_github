<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!--반응형 만들기 위해서 필요-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
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


    <script type="text/javascript">

        function fn_chModify(){
            const chModify = document.getElementById("chModify");
            const chName = document.getElementById("chName").value;
            const chIntro = document.getElementById("chIntro").value;

            if(chName ==""){
                alert("채널 이름을 입력 해 주세요");
                return false;
            }

            if(chIntro == ""){
                alert("채널 소개를 입력 해 주세요");
                return false;
            }


            chModify.action="/channel/chModify";
            chModify.method="POSt";
            chModify.submit();
        }

        $(() => {
            $(".delete_img").click(function () {
                if(confirm("삭제하시겠습니까?")){

                    let prodNum = $(this).attr('data-prodNum'); // prodNum 정의
                    prodNum = parseInt(prodNum);
                    console.log(typeof (prodNum));
                    const data = {
                        prodNum: prodNum
                    };

                    $.ajax({
                        url: '/channel/prodDelete',
                        type: "POST",
                        contentType: "application/json",
                        dataType: "json",
                        data: JSON.stringify(data),
                        success: function (result) {
                            if (result['check']) {

                                $(`#delete_img_${prodNum}`).remove();
                            } else {
                                alert('해당 제품을 보관중인 고객이 있어 삭제할 수 없습니다.');
                            }
                        },
                        error: function () {
                            alert("통신장애가 발생하였습니다.");
                        }

                    });

                }
            });
        });
    </script>
<script>
function setThumbnail(event) {

	var header = document.querySelector(".profile-img");	//제거하고자 하는 엘리먼트
	if(header != null){
		header.parentNode.removeChild(header);
	}


	var reader = new FileReader();
	reader.onload = function(event) {
	var img = document.createElement("img");
	img.setAttribute("src", event.target.result);
	img.setAttribute("style", style="width: 228px; height: 252px");
	img.setAttribute("id", "inputFile");
	img.setAttribute("class", "profile-img");
	document.querySelector("div.profile").appendChild(img);
	};
	reader.readAsDataURL(event.target.files[0]);
	}
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
    <div>


        <div class="container" style="margin-top: 10%;background-color: #FFDFB9;">
            <div class="base">
                <form id=chModify enctype="multipart/form-data">
                    <div class="row">
                        <div class="main-text">
                            <input type="hidden" name="chId" id="chId" value="${channel.chId}">
                            <input type="text" name="chName" id="chName" value="${channel.chName}">
                        </div>
                        <div class="content1">
                            <div class="profile">
                            <label for="inputFile">
                            	<div style="display: none;">
                            		<input type="file" name="upload" id="inputFile" onchange="setThumbnail(event);" multiple="multiple"/>
                            	</div>

                                <img class="minus-icon" src="/resources/img/channel/delete.png" alt="">
                                <img src="../resources/upload/file/${channel.getChProfile() }" alt="" class="profile-img">
                            </label>
                            </div>
                        </div>
                        <div class="content2">
                            <div class="test">
                                <ul>
                                    <li class="li-sty"><span>${fn:length(prodListResult)}  </span></li>
                                    <li class="li-sty"><span>${channel.chFollower }</span></li>
                                    <li  class="li-sty" style="color: #FFDFB9;"><span>.</span></li>
                                </ul>
                                <ul class="text">
                                    <li  class="li-sty"><span>Posts</span></li>
                                    <li  class="li-sty"><span>Followers</span></li>
                                    <li  class="li-sty">
                                        <c:if test="${fUser ne sessionScope.userId && channel.chId ne sessionScope.userId}">
                                             <button type="button" style="width: 30%;" class="btn btn-info" onclick="location.href='chFollow?chNum=${channel.chNum }&chId=${channel.chId}'">follow</button>
                                        </c:if>
                                        <c:if test="${fUser eq sessionScope.userId}">
                                             <button type="button" style="width: 30%;" class="btn btn-outline-secondary">followed</button>
                                        </c:if>
                                        <c:if test="${channel.chId eq sessionScope.userId}">
                                             <span style="color: #FFDFB9;">.</span>
                                        </c:if>
                                    </li>
                                 </ul>
                            </div>
                        </div>

                        <div class="test2 col-md-12">
                            <p>
                                <span class="profile-text">
                                    <input type="text" style="width : 100%" name="chIntro" id="chIntro" value="${channel.chIntro}">
                                </span>
                            </p>
                        </div>

                        <c:if test="${empty prodListResult }">
                            <p>There are no items</p>
                        </c:if>

                        <div class="product-list">
                            <c:forEach items="${prodListResult }" var="prodList">
                                <c:if test="${not empty prodListResult }">
                                <div class="product" id="delete_img_${prodList.prodNum}">
                                    <a href="" class="delete_img" data-prodNum="${prodList.prodNum}"><img class="minus-icon" src="/resources/img/channel/delete.png" alt=""></a>
                                    <a href="/channel/ch_contentModify?prodNum=${prodList.prodNum }&chNum=${channel.chNum}">
                                        <img src="../resources/upload/file/${prodList.getProdOriginalPic1() }" alt="" class="product-img">
                                    </a>
                                </div>
                                </c:if>
                            </c:forEach>
                        </div>

                        <div class="button-list">
                            <input class="button btn-danger" type="button" value="done" onclick="fn_chModify();">
                        </div>
                    </div>
                </form>
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