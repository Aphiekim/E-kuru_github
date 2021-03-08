<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>E-kuru</title>
  <link rel="shortcut icon" href="/resources/img/HatchfulExport-All/ekuru_logo.ico">
  <link rel="stylesheet" href="/resources/css/request-main.css">
  <link rel="stylesheet" href="/resources/css/main-footer.css">
  <link rel="stylesheet" href="/resources/css/header.css">
  <link rel="stylesheet" href="/resources/css/main-footer.css">
  <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.css">
  <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.css">
  <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/css/bootstrap-4.6.0-dist/css/bootstrap.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script>
    var myCarousel = document.querySelector('#myCarousel')
    var carousel = new bootstrap.Carousel(myCarousel, {
      interval: 2000,
      wrap: false
    })

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
        <a href="">
            <img src="/resources/img/HatchfulExport-All/ekuru_logo.png" style="width: 4%; position: absolute;">
        </a>
        <nav>
            <ul class="menu">
                <li class="menu-list headli">
                    <a href="">Home</a>
                    <ul class="menu-sub">
                        <li class="headli">Logout</li>
                        <li class="headli">Mypage</li>
                        <li class="headli">info</li>
                    </ul>
                </li>
                <li class="headli"><a href="">About</a></li>
                <li class="headli"><a href="">Board</a></li>
                <li class="headli"><a href="">Reference</a></li>
                <li class="headli"><a href="">Contact</a></li>
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
            <input type="text" class="search-query form-control" placeholder="Search" />
            <span class="input-group-btn">
              <button class="btn btn-danger" type="button">
                <span class=" glyphicon glyphicon-search" onclick="location.href='ch_search'"></span>
              </button>
            </span>
          </div>
        </div>
      </div>
    </div>
    <!-- 카테고리 구분 -->
    <section  style="margin-top: 1%;">
      <div class="category-button" style="height: auto; background:#FFDFB9;">
        <a href="ch_categoryresult">
          <button type="button" class="btn btn-outline-danger" style="margin-right: 50px;">Fashion/Acc</button>
        </a>
        <a href="ch_categoryresult">
          <button type="button" class="btn btn-outline-warning" style="margin-right: 50px;">Beauty</button>
        </a>
        <a href="ch_categoryresult">
          <button type="button" class="btn btn-outline-success" style="margin-right: 50px;">Food</button>
        </a>
        <a href="ch_categoryresult">
          <button type="button" class="btn btn-outline-primary" style="margin-right: 50px;">Book/CD</button>
        </a>
        <a href="ch_categoryresult">
          <button type="button" class="btn btn-outline-secondary" style="margin-right: 50px;">Ect</button>
        </a>
        <button class="btn text-white" style="background: brown;">Request</button>
      </div>
    </section>
    <!-- 채널 게시글 출력 부분 시작-->
    <section class="page-section portfolio" id="portfolio">
      <div class="container">
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0" style="margin-top: 5%;">
          채 널 게 시 판</h2>
        <!-- 채널 게시글 배열 나누기-->
        <div class="divider-custom">
          <div class="divider-custom-line"></div>
          <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
          <div class="divider-custom-line"></div>
        </div>
        <!-- 게시글 리스트 -->
        <!-- 인기 채널-->
        <div style="margin-bottom: 10%; margin-top: 5%;">
          <h3 class="text-center text-uppercase" id="popularRequest">인 기 채 널</h3>
          <div id="myCarousel" class="carousel slide justify-content-center" data-ride="carousel" style="width: 100%;">

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
              <div class="item active inner">
                <div class="row justify-content-center inner">
                  <c:forEach items="${chListResult }" var="channel">
                    <c:if test="${channel.chNum > -1 && channel.chNum < 3 }">
                      <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
                          <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100" onclick="location.href='ch_personal_main?chName=${channel.chName }&chId=${channel.chId }'">
                            <div class="portfolio-item-caption-content text-center text-white"><i
                                class="fas fa-plus fa-3x"></i></div>
                          </div>
                          <img class="img-fluid" src="/resources/img/channel/ch-profile${channel.chNum }.jpg"
                            alt="" />
                        </div>
                        <div class="card-body">
                          <h5 class="card-title">${channel.chName }</h5>
                          <p class="card-text">${channel.chIntro }</p>
                        </div>
                      </div>
                  </c:if>
                  </c:forEach>

                </div>
              </div>

              <div class="item inner">
                <div class="row justify-content-center inner">
                  <c:forEach items="${chListResult }" var="channel">
                    <c:if test="${channel.chNum > 2 && channel.chNum < 6 }">
                      <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
                          <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100" onclick="location.href='ch_personal_main?chName=${channel.chName }&chId=${channel.chId }'">
                            <div class="portfolio-item-caption-content text-center text-white"><i
                                class="fas fa-plus fa-3x"></i></div>
                          </div>
                          <img class="img-fluid" src="/resources/img/channel/ch-profile${channel.chNum }.jpg"
                            alt="" />
                        </div>
                        <div class="card-body">
                          <h5 class="card-title">${channel.chName }</h5>
                          <p class="card-text">${channel.chIntro }</p>
                        </div>
                      </div>
                    </c:if>
                  </c:forEach>
                </div>
              </div>

              <div class="item inner">
                <div class="row justify-content-center inner">
                  <c:forEach items="${chListResult }" var="channel">
                    <c:if test="${channel.chNum > 5 && channel.chNum < 9 }">
                      <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
                          <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100" onclick="location.href='ch_personal_main?chName=${channel.chName }&chId=${channel.chId }'">
                            <div class="portfolio-item-caption-content text-center text-white"><i
                                class="fas fa-plus fa-3x"></i></div>
                          </div>
                          <img class="img-fluid" src="/resources/img/channel/ch-profile${channel.chNum }.jpg"
                            alt="" />
                        </div>
                        <div class="card-body">
                          <h5 class="card-title">${channel.chName }</h5>
                          <p class="card-text">${channel.chIntro }</p>
                        </div>
                      </div>
                    </c:if>
                  </c:forEach>
                </div>
              </div>
            </div>
            <!-- 인기 채널 끝 -->
            <!-- 슬라이드 커서 기능 -->
            <!-- 슬라이드 커서 기능 -->
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


        <div class="row justify-content-center inner" style="margin-bottom: 5%;">
        <c:forEach items="${chListResult }" var="channel">
          <div class="col-md-6 col-lg-4 mb-5 mb-lg-0">
            <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
              <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100" onclick="location.href='ch_personal_main?chName=${channel.chName }&chId=${channel.chId }'">
                <div class="portfolio-item-caption-content text-center text-white"><i class="fas fa-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="/resources/img/channel/ch-profile${channel.chNum }.jpg" alt="" />
            </div>
            <div class="card-body">
              <h5 class="card-title">${channel.chName }</h5>
              <p class="card-text">${channel.chIntro }</p>
            </div>
          </div>
      </c:forEach>
        </div>

    </section>
  </div>

</div>
<!-- include tag Footer Start -->
<div>

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
  </div>
</div>
<!-- Footer End -->


</body>

</html>