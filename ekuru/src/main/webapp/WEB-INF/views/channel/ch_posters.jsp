<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-kuru</title>
    <link rel="shortcut icon" href="/resources/img/HatchfulExport-All/ekuru_logo.ico">
    <link rel="stylesheet" href="/resources/font/CuteCartoonItalic.ttf">
    <link rel="stylesheet" href="/resources/css/ChannelPosters.css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/header.css">
    <link rel="stylesheet" href="/resources/css/main-footer.css">
    <style>
        @font-face {
            font-family: "CuteCartoonItalic";
            src: url("font/CuteCartoonItalic.ttf");
        }
        *{
            font-family: "CuteCartoonItalic" !important;
        }
        body{
           background-color:#FFDFB9;
        }
    </style>

    <script>
        function fn_prodWrite(){
            var prodWriteForm = document.getElementById("prodWriteForm");

            const prodTitle = document.getElementById("prodTitle").value;
            const prodPrice = document.getElementById("prodPrice").value;
            const prodStock = document.getElementById("prodStock").value;
            const prodContent = document.getElementById("prodContent").value;

            if(prodTitle==""){
                alert("제목을 입력해 주세요");
                return false;
            }

            if(prodPrice==""){
                alert("가격을 입력해 주세요");
				return false;
            }

            if(isNaN(prodPrice)){
                alert("숫자만 입력 가능합니다");
				return false;
             }

             if(prodStock==""){
                alert("수량을 입력해 주세요");
				return false;
            }

             if(prodContent==""){
                alert("상품 설명을 입력해 주세요");
				return false;
            }

            console.log(prodWriteForm);
            prodWriteForm.action="/channel/ch_posters_Write";
            prodWriteForm.method="POST";
            prodWriteForm.enctype="multipart/form-data";
            prodWriteForm.submit();
        }



    </script>

<script>
function setThumbnail(event) {

	var header = document.querySelector("#inputFileOne");	//제거하고자 하는 엘리먼트
	if(header != null){
		header.parentNode.removeChild(header);
	}


	var reader = new FileReader();
	reader.onload = function(event) {
	var img = document.createElement("img");
	img.setAttribute("src", event.target.result);
	img.setAttribute("style", style="width: 333px; height: 333px");
	img.setAttribute("id", id="inputFileOne");
	document.querySelector("div#image_container").appendChild(img);
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
    <div class="container" style="margin-top: 5%;">
        <div class="base">
            <form name="prodWriteForm" id="prodWriteForm" enctype="multipart/form-data";>
                <input type="hidden" name="userId" id="userId" value="${sessionScope.userId}">
                <input type="hidden" name="chNum" id="chNum" value="${channel.chNum}">
                <div class="row">
                    <!-- 줄 윗 부분 시작 -->
                    <div class="head">
                        <!--사진 파일-->
                        <div class="product-img" onclick="">
                            <div class="img-box" id="image_container" style="width: 333px; height: 333px">

                                <div class="circle">
                                <label for="inputFile">
                                	<div style="display: none;">

                                	</div>

                                    <img class="cross" src="/resources/img/icon/cross.png" alt="">
                                </label>
                                <label><input type="file" name="upload" id="inputFile" onchange="setThumbnail(event);" multiple="multiple"></label>
                                <label><input type="file" name="upload" multiple="multiple"/></label>
								<label><input type="file" name="upload" multiple="multiple"/></label>
                                </div>

                            </div>
                        </div>


                        <!-- 물품 정보 -->
                        <div class="product-details">
                            <div class="product-title">
                                <div class="" style="float: left; margin-left: 120px;">
                                    <span class="span">Title</span>
                                </div>
                                <div class="" style="width: 50%; display: inline-block;">
                                    <input type="text" name="prodTitle" id="prodTitle">
                                </div>
                            </div>
                            <div class="product-spec">
                                <div class="content1">
                                    <span class="span">Price</span>
                                </div>
                                <div class="content2">
                                    <input type="text" name="prodPrice" id="prodPrice">
                                </div>
                                <div class="content1">
                                    <span class="span">Quantity</span>
                                </div>
                                <div class="content2">
                                    <input type="number" name="prodStock" id="prodStock">
                                </div>
                                <div class="content1">
                                    <span class="span">Category</span>
                                </div>
                                <div class="content2 select-div">
                                    <select class="select" name="prodCategory" id="prodCategory">
                                        <option value="1">fashion_acc</option>
                                        <option value="2">beauty</option>
                                        <option value="3">food</option>
                                        <option value="4">book_cd</option>
                                        <option value="5">ect</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 줄 윗 부분 끝 -->
                    <!-- 줄 아래부분 시작 -->
                    <div class="foot">
                        <div class="product-tx">
                            <span>Product Details</span>
                        </div>
                        <div class="product-text-div">
                            <textarea class="product-text" name="prodContent" id="prodContent" cols="100" rows="10"></textarea>
                        </div>

                        <div class="submit-btn">
                            <input class="btn btn-danger" type="button" value="Save" onclick="fn_prodWrite();">
                        </div>
                    </div>
                    <!--줄 아래부분 끝-->
                </div>
            </form>
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
                        <button class="btn btn-secondary submit-btn" type="submit" id="button-addon2">SUBMIT</button>
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
<!-- Footer End -->



</body>
</html>