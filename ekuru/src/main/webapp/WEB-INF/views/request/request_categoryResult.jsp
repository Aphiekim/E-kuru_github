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
  <link rel="shortcut icon" href="../resources/img/HatchfulExport-All/ekuru_logo.ico">
  <link rel="stylesheet" href="../resources/css/request-main.css">
  <link rel="stylesheet" href="../resources/css/main-footer.css">
  <link rel="stylesheet" href="../resources/css/header_Origin.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>
    function openCategory(category){
        var categoryCode = category;
		location.href="/request/request_categoryResult?categoryCode="+categoryCode;
    }
    function openWriteForm(){
		location.href="/request/request_writeForm";
    }
    function openReadForm(reqNum){
		location.href="/request/request_readForm?reqNum="+reqNum;
	}
  </script>
  <style>
    *{
            font-family: 'NotSansCJKjp-Black', sans-serif;
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
  <div>
    <!-- 검색창 -->
        <div class="container">
            <div>
                <div id="custom-search-input" style="width: 80%; margin-left: 10%;">
                    <div class="input-group">
                    <form action="/request/request_search" method="post">
                        <input type="text" class="search-query form-control" name="search" placeholder="Search" style="width=80%;"/>
                        <span class="input-group-btn">
                           <button class="btn btn-danger" type="submit">
                               <span class="glyphicon glyphicon-search"></span>
                           </button>
                        </span>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    <!-- 카테고리별 결과 -->
    <section>
      <div class="category-button" style="height: auto; background:#FFDFB9;">
        <button type="button" class="btn btn-outline-danger" style="margin-right: 50px;" onclick="openCategory('1');">Fashion/Acc</button>
        <button type="button" class="btn btn-outline-warning" style="margin-right: 50px;" onclick="openCategory('2');">Beauty</button>
		<button type="button" class="btn btn-outline-success" style="margin-right: 50px;" onclick="openCategory('3');">Food</button>
		<button type="button" class="btn btn-outline-primary" style="margin-right: 50px;" onclick="openCategory('4');">Book/CD</button>
		<button type="button" class="btn btn-outline-secondary" style="margin-right: 50px;" onclick="openCategory('5');">Ect</button>
        <button class="btn text-white" style="background: brown;" onclick="openWriteForm();">Request</button>
      </div>
    </section>
    <!-- ìì²­ ê²ìê¸ ì¶ë ¥ ë¶ë¶ ìì-->
    <section class="page-section portfolio" id="portfolio">
      <div class="container">
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0" style="margin-top: 5%;">
          Request Board</h2>
        <!-- ìì²­ ê²ìê¸ ë°°ì´ ëëê¸°-->
        <div class="divider-custom">
          <div class="divider-custom-line"></div>
          <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
          <div class="divider-custom-line"></div>
        </div>
        <!-- ê²ìê¸ ë¦¬ì¤í¸ -->
        <!-- ì¸ê¸° ê²ìê¸ -->
        <div style="margin-bottom: 10%; margin-top: 5%;">
          <h3 class="text-center text-uppercase" id="popularRequest">Popular Request</h3>
          <div id="myCarousel" class="carousel slide justify-content-center" data-ride="carousel" style="width: 100%;">

           <!-- Wrapper for slides -->
            <div class="carousel-inner">
              <div class="item active inner">
                <div class="row justify-content-center inner">
                  <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
                      <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                        <div class="portfolio-item-caption-content text-center text-white"><i
                            class="fas fa-plus fa-3x"></i></div>
                      </div>
                      <img class="img-fluid" src="../resources/img/main-section3-images/alexandre-chambon-97R5c0lXUK0-unsplash.jpg"
                        alt="" />
                    </div>
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and
                        make up the bulk
                        of the card's content.</p>
                    </div>
                  </div>
                  <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
                      <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                        <div class="portfolio-item-caption-content text-center text-white"><i
                            class="fas fa-plus fa-3x"></i></div>
                      </div>
                      <img class="img-fluid" src="../resources/img/main-section3-images/alexandre-chambon-97R5c0lXUK0-unsplash.jpg"
                        alt="" />
                    </div>
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and
                        make up the bulk
                        of the card's content.</p>
                    </div>
                  </div>
                  <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                    <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
                      <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                        <div class="portfolio-item-caption-content text-center text-white"><i
                            class="fas fa-plus fa-3x"></i></div>
                      </div>
                      <img class="img-fluid" src="../resources/img/main-section3-images/alexandre-chambon-97R5c0lXUK0-unsplash.jpg"
                        alt="" />
                    </div>
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">Some quick example text to build on the card title and
                        make up the bulk
                        of the card's content.</p>
                    </div>
                  </div>
                </div>
              </div>
           </div>
            <!-- 슬라이드 좌우 -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
              <span class="glyphicon glyphicon-chevron-left"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
              <span class="glyphicon glyphicon-chevron-right"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
        </div>
        
			<!--카테고리별 결과 출력 -->
	        <div class="row justify-content-center inner" style="margin-bottom: 5%;">
		      <c:forEach var="list" items="${reqList }" >
	          <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
		            <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
		              <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100"
		              onclick="openReadForm('${list.reqNum}');">>
		                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i>
		                </div>
		              </div>
		              	<img class="img-fluid" src="../resources/img/main-section3-images/alexandre-chambon-97R5c0lXUK0-unsplash.jpg"/>	              
		            </div>
		          <div class="card-body">
	            	<h5 class="card-title">
	            		${list.reqTitle }
	            	</h5>
		           	<p class="card-text">${list.reqContent }</p>
		          </div>
	          </div>
	         </c:forEach>
	        </div>
        
        
</div>

</section>
</div>
   <!-- include tag Footer Start -->
   <div>

    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="row">
                        <!-- ì£¼ìì§ -->
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
                            <input type="text" class="form-control" placeholder="Email@email.com"
                                aria-label="Email@email.com aria-describedby=" button-addon2">
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
                    <p>Designed By <a>HTML Codex</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->


</body>

</html>