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
    <link rel="stylesheet" href="../resources/font/NotoSansCJKjp-Black.otf">
    <link rel="stylesheet" href="../resources/css/header.css">
    <link rel="stylesheet" href="../resources/css/main-footer.css">
    <link rel="stylesheet" href="../resources/css/request-writeForm.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript">
		function check(){
			var reqTitle = document.getElementById('reqTitle').value;
			var reqContent = document.getElementById('reqContent').value;
			var categoryCode = document.getElementById('categoryCode').checked;
			
			
			if(reqTitle == null || reqTitle.length == 0){
				alert("Please write title");
				return false;
			}
			<%--
			if(categoryCode != true){
				alert("Please select your category");
				return false;
			}--%>

			if(reqContent == null || reqContent.length == 0){
				alert("Please write your content");
				return false;
			}
			
		}
    </script>
    <style>
        *{
            font-family: 'NotSansCJKjp-Black', sans-serif;
        }
        body{
            background-color: #FFDFB9;
        }

        .cate-sty{
            margin-left: 0 !important;
            margin-right: 0 !important;
            padding-right: 0 !important;
            padding-left: 0 !important;
        }
    </style>
    
    
<script> 
function setThumbnail(event) {
		                        
	var header = document.querySelector("#imgOne");	//제거하고자 하는 엘리먼트
	if(header != null){
		header.parentNode.removeChild(header);
	}
								
	                        	
	var reader = new FileReader();
	reader.onload = function(event) {
	var img = document.createElement("img");
	img.setAttribute("src", event.target.result); 
	img.setAttribute("style", style="width: 350px; height: 350px");
	img.setAttribute("id", "inputFile");
	img.setAttribute("class", "img-thumbnail pic");
	document.querySelector("div.form-inline").appendChild(img); 
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
                    </li>
                    <li class="headli"><a class="menu-a" href="/ad/superplan">SPlan?</a></li>
                    <%-- <li class="headli"><a class="menu-a" href="">Board</a></li> --%>
                    <li class="headli"><a class="menu-a" href="/user/mypagePoint">${sessionScope.userPoint }P</a></li>
                    <li class="headli"><a class="menu-a" href="/user/logout">Logout</a></li>
                    <c:if test="${userType eq 1 }">
                       <li class="headli"><a class="menu-a" href="/user/viewedItems">Recently viewed items</a></li>
                    </c:if>
                </ul>
            </nav>
        </div>
    </header>
    <!-- header -->
    
    <!-- Request WriteForm start-->
    <div class="container" style="margin-top: 5%;">
        <!--title-->
        <h2 class="text-center font-weight-bold text-uppercase" style="margin-bottom: 5%;">Write</h2>
        <div class="row" style="margin-top: 5%;">
            <div class="col-lg-8 mb-5">
                <!--Form-->
            <form action="/request/request_write" method="post" enctype="multipart/form-data" onsubmit="return check();">
                    
                <!--사진 / 화면에 맞춰서 설정clear-->
                    <div class="row form-group">
                        <div class="col-md-6 mb-3 mb-md-0" style="margin-bottom: 2%;">
                            <label class="font-weight-bold text-uppercase" for="fname">Picture</label><br>
                            <div class="form-inline">
                                <img id="imgOne" src="../resources/img/iconfinder_image_photo_5402449.png" alt="..." class="img-thumbnail pic">
                            </div>
                        </div>
                    </div>
                <!--파일 올리기-->
                    <div class="input-group" >
                        <div class="custom-file">
                            <input type="file" name="upload" class="custom-file-input" id="inputGroupFile04 inputFile"
                                aria-describedby="inputGroupFileAddon04" onchange="setThumbnail(event);" multiple="multiple"/>
                            
                            <label class="custom-file-label" for="inputGroupFile04">Choose file</label>
                        </div>
                        
                    </div>
                    
                    <div class="input-group" >
                        <div class="custom-file">
                            <input type="file" name="upload" class="custom-file-input" id="inputGroupFile04 inputFile"
                                aria-describedby="inputGroupFileAddon04" onchange="setThumbnail(event);" multiple="multiple"/>
                            <label class="custom-file-label" for="inputGroupFile04">Choose file</label>
                        </div>
                        
                    </div>
                    
                    <div class="input-group" >
                        <div class="custom-file">
                            <input type="file" name="upload" class="custom-file-input" id="inputGroupFile04 inputFile"
                                aria-describedby="inputGroupFileAddon04" onchange="setThumbnail(event);" multiple="multiple"/>
                            <label class="custom-file-label" for="inputGroupFile04">Choose file</label>
                        </div>
                        
                    </div>
                    
                <!-- 게시글 제목 -->
                    <div class="row form-group" style="margin-top: 3%;">
                        <div class="col-md-12">
                            <label class="font-weight-bold text-uppercase" for="subject">Subject</label>
                            <input type="text" id="reqTitle" class="form-control" name="reqTitle">
                        </div>
                    </div>
                <!-- 카테고리 -->
                    <div class="row form-group col-md-12 cate-sty">
                        <label class="font-weight-bold text-uppercase" for="subject">category</label>
                        <div style="width: 100%">
                            <input type="radio" id="categoryCode" name="categoryCode" value="1" style="margin-right: 2%">Fashion/Acc
                            <input type="radio" id="categoryCode" name="categoryCode" value="2" style="margin-right: 2%">Beauty
                            <input type="radio" id="categoryCode" name="categoryCode" value="3" style="margin-right: 2%">Food
                            <input type="radio" id="categoryCode" name="categoryCode" value="4" style="margin-right: 2%">Book/CD
                            <input type="radio" id="categoryCode" name="categoryCode" value="5" style="margin-right: 2%" checked="checked">Ect
                        </div>
                    </div>

                <!-- 요청 내용-->
                    <div class="row form-group">
                        <div class="col-md-12">
                            <label class="font-weight-bold text-uppercase" for="message">content</label>
                            <textarea name="reqContent" id="reqContent" cols="20" rows="7" class="form-control"
                                placeholder="Write your notes or request here..."></textarea>
                        </div>
                    </div>
                <!-- Submit 버튼-->
                <div class="row form-group">
                    <div class="col-md-6 col-md-offset-3" style="margin-left: 40%; padding-top: 5%;">
                            <input type="submit" value="Save" class="btn btn-danger py-2 px-4 text-uppercase">
                    </div>
                </div>

            </form>
                
            </div>
            <!-- 요청글 사용법 -->
            <div class="col-lg-3 ml-auto">
                <div class="mb-3">
                    <p class="mb-0 font-weight-bold text-uppercase">E-kuru</p>
                    <p class="mb-4">1st, Write your request whatever you want from Korea. But please make sure what it
                        is.</p>
                    <p class="mb-4">2nd, A helper will search and help you with your request </p>
                    <p class="mb-0 font-weight-bold text-uppercase">Contact</p>
                    <p class="mb-4">ekuruco@gmail.com</p>

                </div>
            </div>
        </div>
    </div>
    <!-- request writeForm end -->
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
    <!-- Footer End -->

</body>

</html>